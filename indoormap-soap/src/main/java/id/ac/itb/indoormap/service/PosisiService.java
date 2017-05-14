package id.ac.itb.indoormap.service;

import id.ac.itb.indoormap.entity.User;
import id.ac.itb.indoormap.model.IbeaconList;
import id.ac.itb.indoormap.model.Posisi;

public interface PosisiService {
	
	public Posisi getPosisi(IbeaconList ibeaconList);
	
	public User getUser(User user);
	
	public User setUser(User user);
	
}