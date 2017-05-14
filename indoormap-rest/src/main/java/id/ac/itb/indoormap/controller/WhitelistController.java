package id.ac.itb.indoormap.controller;

import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.model.entity.Whitelist;
import id.ac.itb.indoormap.model.response.Response;
import id.ac.itb.indoormap.repository.WhitelistRepository;

@RestController
@RequestMapping(value="/whitelist")
public class WhitelistController {
	
	@Autowired
	private WhitelistRepository whitelistRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response<Whitelist> insert(@RequestBody Whitelist whitelist){
		
		Response<Whitelist> response = new Response<Whitelist>();
		try{
			response.setResponseBody(whitelistRepository.save(whitelist));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response<Whitelist> update(@RequestBody Whitelist whitelist){
		
		Response<Whitelist> response = new Response<Whitelist>();
		Whitelist whitelistOld = whitelistRepository.findOne(whitelist.getId());
		if (whitelistOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(whitelistRepository.save(whitelist));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response<Whitelist> select(@PathVariable String id){
		
		Response<Whitelist> response = new Response<Whitelist>();
		response.setResponseBody(whitelistRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response<List<Whitelist>> selectAll(){
		
		Response<List<Whitelist>> response = new Response<List<Whitelist>>();
		response.setResponseBody(whitelistRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response<Whitelist> delete(@PathVariable String id){
		
		Response<Whitelist> response = new Response<Whitelist>();
		Whitelist whitelist = whitelistRepository.findOne(id);
		if (whitelist == null)
			setMessage(response, new FileNotFoundException());
		else{
			whitelistRepository.delete(id);
			response.setResponseBody(whitelist);
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
