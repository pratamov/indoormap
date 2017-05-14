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

import id.ac.itb.indoormap.model.Response;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.repository.RoleRepository;

@RestController
@RequestMapping(value="/roles")
public class RoleController {
	
	@Autowired
	private RoleRepository roleRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response<Role> insert(@RequestBody Role role){
		
		Response<Role> response = new Response<Role>();
		try{
			response.setResponseBody(roleRepository.save(role));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response<Role> update(@RequestBody Role role){
		
		Response<Role> response = new Response<Role>();
		Role roleOld = roleRepository.findOne(role.getId());
		if (roleOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(roleRepository.save(role));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response<Role> select(@PathVariable String id){
		
		Response<Role> response = new Response<Role>();
		response.setResponseBody(roleRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response<List<Role>> selectAll(){
		
		Response<List<Role>> response = new Response<List<Role>>();
		response.setResponseBody(roleRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response<Role> delete(@PathVariable String id){
		
		Response<Role> response = new Response<Role>();
		Role role = roleRepository.findOne(id);
		if (role == null)
			setMessage(response, new FileNotFoundException());
		else{
			roleRepository.delete(id);
			response.setResponseBody(role);
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
