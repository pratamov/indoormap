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

import id.ac.itb.indoormap.model.entity.User;
import id.ac.itb.indoormap.model.response.Response;
import id.ac.itb.indoormap.repository.UserRepository;

@RestController
@RequestMapping(value="/users")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(method = RequestMethod.POST)
	Response<User> insert(@RequestBody User user){
		
		Response<User> response = new Response<User>();
		try{
			response.setResponseBody(userRepository.save(user));
		}
		catch(HttpMessageNotReadableException e){
			setMessage(response, e);
		}
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	Response<User> update(@RequestBody User user){
		
		Response<User> response = new Response<User>();
		User userOld = userRepository.findOne(user.getId());
		if (userOld == null)
			setMessage(response, new FileNotFoundException());
		else
			response.setResponseBody(userRepository.save(user));
			
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Response<User> select(@PathVariable String id){
		
		Response<User> response = new Response<User>();
		response.setResponseBody(userRepository.findOne(id));
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET, params={"password"})
	Response<User> selectIdPassword(@PathVariable String id, @RequestParam String password){
		
		Response<User> response = new Response<User>();
		List<User> users = userRepository.findByIdPassword(id, password);
		if (users.isEmpty())
			response.setResponseBody(new User());
		else
			response.setResponseBody(users.get(0));
		
		return response;
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	Response<List<User>> selectAll(){
		
		Response<List<User>> response = new Response<List<User>>();
		response.setResponseBody(userRepository.findAll());
		return response;
		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	Response<User> delete(@PathVariable String id){
		
		Response<User> response = new Response<User>();
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
