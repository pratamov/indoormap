package id.ac.itb.indoormap.controller;

import java.io.FileNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.entity.Lokasi;
import id.ac.itb.indoormap.entity.Role;
import id.ac.itb.indoormap.model.Response;
import id.ac.itb.indoormap.repository.GeofenceRepository;
import id.ac.itb.indoormap.repository.LokasiRepository;
import id.ac.itb.indoormap.repository.RoleRepository;

@RestController
@RequestMapping(value="/lokasis")
public class LokasiController {
	
	@Autowired
	private LokasiRepository lokasiRepository;
	
	@Autowired
	private GeofenceRepository geofenceRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response insert(@RequestBody Lokasi lokasi){
		
		Response response = new Response();
		try{
			response.setResponseBody(lokasiRepository.save(lokasi));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response update(@RequestBody Lokasi lokasi){
		
		Response response = new Response();
		Lokasi lokasiOld = lokasiRepository.findOne(lokasi.getId());
		if (lokasiOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(lokasiRepository.save(lokasi));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response select(@PathVariable Integer id){
		
		Response response = new Response();
		response.setResponseBody(lokasiRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(value="/{id}/geofences", method = RequestMethod.GET)
	Response selectGeofences(@PathVariable Integer id){
		
		Response response = new Response();
		response.setResponseBody(geofenceRepository.findByLokasi(id));
		return response;
		
	}
	
	@RequestMapping(value="/{id}/geofences", method = RequestMethod.GET, params={"x", "y"})
	Response selectGeofencesCoordinate(@PathVariable Integer id, @RequestParam double x, @RequestParam double y){
		
		Response response = new Response();
		response.setResponseBody(geofenceRepository.findByLokasiKoordinat(id, x, y));
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response selectAll(){
		
		Response response = new Response();
		response.setResponseBody(lokasiRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response delete(@PathVariable Integer id){
		
		Response response = new Response();
		Lokasi lokasi = lokasiRepository.findOne(id);
		if (lokasi == null)
			setMessage(response, new FileNotFoundException());
		else{
			lokasiRepository.delete(id);
			response.setResponseBody(lokasi);
		}
		return response;
		
	}
	
	
	public void setMessage(Response response, Exception e) {
		
		if(e instanceof FileNotFoundException || e instanceof NullPointerException) {
	        response.setResponseCode(404);
	    }
	    else if(e instanceof HttpMessageNotReadableException){
	    	response.setResponseCode(409);
	    }
	    else{
	    	response.setResponseCode(400);
	    }
	    response.setMessage(e.getMessage());
	}

}
