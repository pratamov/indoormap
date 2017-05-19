package id.ac.itb.indoormap.controller;

import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.model.entity.Geofence;
import id.ac.itb.indoormap.model.entity.Lokasi;
import id.ac.itb.indoormap.model.response.Response;
import id.ac.itb.indoormap.repository.GeofenceRepository;
import id.ac.itb.indoormap.repository.LokasiRepository;

@RestController
@RequestMapping(value="/lokasis")
public class LokasiController {
	
	@Autowired
	private LokasiRepository lokasiRepository;
	
	@Autowired
	private GeofenceRepository geofenceRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response<Lokasi> insert(@RequestBody Lokasi lokasi){
		
		Response<Lokasi> response = new Response<Lokasi>();
		try{
			response.setResponseBody(lokasiRepository.save(lokasi));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response<Lokasi> update(@RequestBody Lokasi lokasi){
		
		Response<Lokasi> response = new Response<Lokasi>();
		Lokasi lokasiOld = lokasiRepository.findOne(lokasi.getId());
		if (lokasiOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(lokasiRepository.save(lokasi));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response<Lokasi> select(@PathVariable String id){
		
		Response<Lokasi> response = new Response<Lokasi>();
		response.setResponseBody(lokasiRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(value="/{id}/geofences", method = RequestMethod.GET)
	Response<List<Geofence>> selectGeofences(@PathVariable String id){
		
		Response<List<Geofence>> response = new Response<List<Geofence>>();
		response.setResponseBody(geofenceRepository.findByLokasi(id));
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response<List<Lokasi>> selectAll(){
		
		Response<List<Lokasi>> response = new Response<List<Lokasi>>();
		response.setResponseBody(lokasiRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response<Lokasi> delete(@PathVariable String id){
		
		Response<Lokasi> response = new Response<Lokasi>();
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
