package id.ac.itb.indoormap.controller;

import java.io.FileNotFoundException;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.entity.User;
import id.ac.itb.indoormap.model.Response;
import id.ac.itb.indoormap.repository.UserRepository;

@RestController
@RequestMapping(value="/users")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response insert(@RequestBody User user){
		
		Response response = new Response();
		try{
			response.setResponseBody(userRepository.save(user));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response update(@RequestBody User user){
		
		Response response = new Response();
		User userOld = userRepository.findOne(user.getId());
		if (userOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(userRepository.save(user));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response select(@PathVariable String id){
		
		Response response = new Response();
		response.setResponseBody(userRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response selectAll(){
		
		Response response = new Response();
		response.setResponseBody(userRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response delete(@PathVariable String id){
		
		Response response = new Response();
		User user = userRepository.findOne(id);
		if (user == null)
			setMessage(response, new FileNotFoundException());
		else{
			userRepository.delete(id);
			response.setResponseBody(user);
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
