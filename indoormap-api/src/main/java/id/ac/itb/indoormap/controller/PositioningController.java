package id.ac.itb.indoormap.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.math3.fitting.leastsquares.LeastSquaresOptimizer.Optimum;
import org.apache.commons.math3.fitting.leastsquares.LevenbergMarquardtOptimizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.lemmingapex.trilateration.NonLinearLeastSquaresSolver;
import com.lemmingapex.trilateration.TrilaterationFunction;

import id.ac.itb.indoormap.model.Ibeacon;
import id.ac.itb.indoormap.model.Koordinat;
import id.ac.itb.indoormap.model.PosisiInput;
import id.ac.itb.indoormap.model.PosisiOutput;
import id.ac.itb.indoormap.model.Ruang;
import id.ac.itb.indoormap.model.entity.Geofence;
import id.ac.itb.indoormap.model.entity.Lokasi;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.model.entity.User;
import id.ac.itb.indoormap.model.entity.Whitelist;
import id.ac.itb.indoormap.model.response.Response;

@RestController
@RequestMapping
public class PositioningController {
	
	@Value("${indoormap.rest.scheme}")
	private String restScheme;
	
	@Value("${indoormap.rest.host}")
	private String restHost;
	
	@Value("${indoormap.rest.path}")
	private String restPath;
	
	@Value("${indoormap.rest.port}")
	private String restPort;
	
	@Autowired
	private RegistratingController registratingController; 
	
	@RequestMapping(value="/posisi", method = RequestMethod.POST)
	PosisiOutput getPosisi (@RequestBody PosisiInput posisiInput){
		/**
		 * input: user_id, user_password, ibeacons
		 * output: lokasi_id, lokasi_denah_url, lokasi_denah_lebar, lokasi_nama, lokasi_deskripsi, ruangs, koordinat
		 */
		
		PosisiOutput posisiOutput = new PosisiOutput();
		
		List<Ibeacon> ibeacons = posisiInput.getIbeacons();
		String id = posisiInput.getUserId();
		String password = posisiInput.getUserPassword();
		
		/**
		 * Menentukan apakah user memiliki hak akses
		 */
		
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		user = registratingController.login(user);
		
		List<String> roles = new ArrayList<String>();
		if (user.getRoles() != null && !user.getRoles().isEmpty()){
			for (Role role : user.getRoles())
				roles.add(role.getId());
		}
		
		/**
		 * Retrieve whitelist uuid iBeacon
		 */
		
		UriComponents uriComponentsGetUser = UriComponentsBuilder.newInstance().scheme(restScheme).host(restHost)
				.port(restPort).path(restPath + "/whitelists").build();
		
		RestTemplate restTemplate = new RestTemplate();
		Response<List<Whitelist>> responseGetWhitelist = restTemplate.exchange(uriComponentsGetUser.toUriString(), HttpMethod.GET, null,
				new ParameterizedTypeReference<Response<List<Whitelist>>>() {
				}).getBody();
		
		List<String> whitelists = new ArrayList<String>();
		for(Whitelist whitelist : responseGetWhitelist.getResponseBody()){
			whitelists.add(whitelist.getId());
		}
		
		
		/**
		 * Menentukan koordinat
		 */
		
		Map<Integer, List<Ibeacon>> mapIbeaconMajor = new HashMap<Integer, List<Ibeacon>>();
		
		for(Ibeacon ibeacon : ibeacons){
			if (mapIbeaconMajor.containsKey(ibeacon.getMajor()))
				mapIbeaconMajor.get(ibeacon.getMajor()).add(ibeacon);
			else{
				mapIbeaconMajor.put(ibeacon.getMajor(), new ArrayList<Ibeacon>());
				mapIbeaconMajor.get(ibeacon.getMajor()).add(ibeacon);
			}
		}
		
		int maxGroup = 0;
		List<Ibeacon> ibeaconsGroup = new ArrayList<Ibeacon>();
		for (List<Ibeacon> mapIbeaconMajorValue : mapIbeaconMajor.values()){
			
			if (mapIbeaconMajorValue.size() > maxGroup){
				ibeaconsGroup = mapIbeaconMajorValue;
				maxGroup = mapIbeaconMajorValue.size();
			}
			
		}
		
		posisiOutput.setKoordinat(new Koordinat());
		int major = 0;
		
		if (ibeaconsGroup.size() > 2){
			double[][] positions = new double[][]{};
			double[] distances = new double[]{};
			for (Ibeacon ibeacon : ibeaconsGroup){
				positions = ArrayUtils.add(positions, new double[] {ibeacon.getX(), ibeacon.getY()});
				distances = ArrayUtils.add(distances, ibeacon.getDistance());
				major = ibeacon.getMajor();
			}
			NonLinearLeastSquaresSolver solver = new NonLinearLeastSquaresSolver(
					new TrilaterationFunction(positions, distances), new LevenbergMarquardtOptimizer());
			Optimum optimum = solver.solve();
			double[] centroid = optimum.getPoint().toArray();
			posisiOutput.getKoordinat().setX(centroid[0]);
			posisiOutput.getKoordinat().setY(centroid[1]);
		}
		
		
		/**
		 * Mencari lokasi dan ruang
		 */
		UriComponents uriComponentsGetGeofences = UriComponentsBuilder.newInstance().scheme(restScheme).host(restHost)
				.port(restPort).path(restPath + "/geofences")
				.queryParam("x", posisiOutput.getKoordinat().getX())
				.queryParam("y", posisiOutput.getKoordinat().getY())
				.queryParam("major", major)
				.build();
		
		Response<List<Geofence>> responseGetGeofences = restTemplate.exchange(uriComponentsGetGeofences.toUriString(), HttpMethod.GET, null,
				new ParameterizedTypeReference<Response<List<Geofence>>>() {
				}).getBody();
		
		Lokasi lokasi = null;
		posisiOutput.setRuangs(new ArrayList<Ruang>());
		
		if (responseGetGeofences.getResponseBody() != null){
			for (Geofence geofence : responseGetGeofences.getResponseBody()){
				Ruang ruang = new Ruang();
				ruang.setNama(geofence.getNama());
				ruang.setDeskripsi(geofence.getDeskripsi());
				posisiOutput.getRuangs().add(ruang);
				if (lokasi == null){
					lokasi = geofence.getLokasi();
					UriComponents uriComponentsGetAssets = UriComponentsBuilder.newInstance().scheme(restScheme).host(restHost)
							.port(restPort).path(restPath + "/assets/" + lokasi.getDenahFile())
							.build();
					
					posisiOutput.setDenahLebar(lokasi.getDenahLebar());
					posisiOutput.setDenahUrl(uriComponentsGetAssets.toUriString());
					posisiOutput.setDeskripsi(lokasi.getDeskripsi());
					posisiOutput.setNama(lokasi.getId());
				}
			}
		}
		
		return posisiOutput;
	}
	
	
}