package id.ac.itb.indoormap.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import id.ac.itb.indoormap.model.RegisterInput;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.model.entity.User;
import id.ac.itb.indoormap.model.response.Response;

@RestController
@RequestMapping
public class RegistratingController {

	@Value("${indoormap.rest.scheme}")
	private String restScheme;

	@Value("${indoormap.rest.host}")
	private String restHost;

	@Value("${indoormap.rest.path}")
	private String restPath;

	@Value("${indoormap.rest.port}")
	private String restPort;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	User setRegister(@RequestBody RegisterInput registerInput) {

		String id = registerInput.getId();
		String password = registerInput.getPassword();
		String roleId = registerInput.getRoleId();
		
		UriComponents uriComponentsGetUser = UriComponentsBuilder.newInstance().scheme(restScheme).host(restHost)
				.port(restPort).path(restPath + "/users/" + id).queryParam("password", password).build();

		RestTemplate restTemplate = new RestTemplate();
		Response<User> responseGetUser = restTemplate.exchange(uriComponentsGetUser.toUriString(), HttpMethod.GET, null,
				new ParameterizedTypeReference<Response<User>>() {
				}).getBody();
		
		if (responseGetUser.getResponseBody() == null)
			return null;
		else{
			User user = responseGetUser.getResponseBody();
			
			if (user.getRoles() == null)
				user.setRoles(new ArrayList<Role>());
			
			Role role = new Role();
			role.setId(roleId);
			
			user.getRoles().add(role);
			
			UriComponents uriComponentsPutUser = UriComponentsBuilder.newInstance().scheme(restScheme).host(restHost)
					.port(restPort).path(restPath + "/users").build();
			HttpHeaders requestHeaders = new HttpHeaders();
			
			HttpEntity<User> httpEntity = new HttpEntity<User>(user, requestHeaders);
			
			restTemplate.exchange(
					uriComponentsPutUser.toUriString(), 
					HttpMethod.PUT, 
					httpEntity,
					new ParameterizedTypeReference<Response<User>>() {
					}).getBody();
			
			return login(user);
			
		}

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	User login(@RequestBody User user) {
		
		String id = user.getId();
		String password = user.getPassword();
		
		UriComponents uriComponentsGetUser = UriComponentsBuilder.newInstance().scheme(restScheme).host(restHost)
				.port(restPort).path(restPath + "/users/" + id).queryParam("password", password).build();
		
		RestTemplate restTemplate = new RestTemplate();
		Response<User> responseGetUser = restTemplate.exchange(uriComponentsGetUser.toUriString(), HttpMethod.GET, null,
				new ParameterizedTypeReference<Response<User>>() {
				}).getBody();
		
		if (responseGetUser.getResponseBody() == null)
			return null;
		else{
			return responseGetUser.getResponseBody();
		}
	}

	
	

}