package id.ac.itb.indoormap.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.model.RegisterInput;
import id.ac.itb.indoormap.model.RegisterOutput;

@RestController
@RequestMapping
public class RegistratingController {
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	RegisterOutput setPosisi (@RequestBody RegisterInput registerInput){
		return null;
	}
	
	
}