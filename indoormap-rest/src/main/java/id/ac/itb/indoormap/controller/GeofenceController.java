package id.ac.itb.indoormap.controller;

import java.io.FileNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.entity.Geofence;
import id.ac.itb.indoormap.model.Response;
import id.ac.itb.indoormap.repository.GeofenceRepository;

@RestController
@RequestMapping(value="/geofences")

public class GeofenceController {
	
	@Autowired
	private GeofenceRepository geofenceRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response insert(@RequestBody Geofence geofence){
		
		Response response = new Response();
		try{
			response.setResponseBody(geofenceRepository.save(geofence));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response update(@RequestBody Geofence geofence){
		
		Response response = new Response();
		Geofence geofenceOld = geofenceRepository.findOne(geofence.getId());
		if (geofenceOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(geofenceRepository.save(geofence));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response select(@PathVariable Integer id){
		
		Response response = new Response();
		response.setResponseBody(geofenceRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response selectAll(){
		
		Response response = new Response();
		response.setResponseBody(geofenceRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response delete(@PathVariable Integer id){
		
		Response response = new Response();
		Geofence geofence = geofenceRepository.findOne(id);
		if (geofence == null)
			setMessage(response, new FileNotFoundException());
		else{
			geofenceRepository.delete(id);
			response.setResponseBody(geofence);
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
