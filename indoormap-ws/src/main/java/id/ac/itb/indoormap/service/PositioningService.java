package id.ac.itb.indoormap.service;

import id.ac.itb.indoormap.model.Denah;
import id.ac.itb.indoormap.model.IbeaconList;
import id.ac.itb.indoormap.model.PosisiList;
import id.ac.itb.indoormap.model.User;

public interface PositioningService {

	public PosisiList getPosisiByIbeacon(IbeaconList ibeaconList);
	
	public Denah getDenahById(int id_denah);
	
	public User login(String nama, String password);
	
}
