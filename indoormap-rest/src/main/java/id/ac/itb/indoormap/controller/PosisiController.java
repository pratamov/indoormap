package id.ac.itb.indoormap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.model.PosisiInput;
import id.ac.itb.indoormap.model.PosisiOutput;
import id.ac.itb.indoormap.model.Response;
import id.ac.itb.indoormap.model.entity.Lokasi;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.repository.GeofenceRepository;
import id.ac.itb.indoormap.repository.LokasiRepository;
import id.ac.itb.indoormap.repository.RoleRepository;
import id.ac.itb.indoormap.repository.UserRepository;

@RestController
@RequestMapping(value="/posisi")
public class PosisiController {
	
	@Autowired
	private GeofenceRepository geofenceRepository;
	
	@Autowired
	private LokasiRepository lokasiRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	Response<PosisiOutput> insert(@RequestBody PosisiInput posisiInput){
		
		return new Response<PosisiOutput>();
		
	}
	
}
