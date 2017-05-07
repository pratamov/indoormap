package id.ac.itb.indoormap.ws.service;

import java.util.List;

import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.model.entity.User;
import id.ac.itb.indoormap.ws.model.pojo.Ibeacon;
import id.ac.itb.indoormap.ws.model.pojo.Posisi;

public interface PosisiService {
	
	public Posisi getPosisi(List<Ibeacon> ibeacons);
	
	public User setRole(User user, Role role);
}
