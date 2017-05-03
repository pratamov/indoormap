package id.ac.itb.indoormap.model.service;

import java.util.List;

import id.ac.itb.indoormap.model.pojo.Ibeacon;
import id.ac.itb.indoormap.model.pojo.Posisi;

public interface PosisiService {
	
	public Posisi getPosisi(List<Ibeacon> ibeacons);
	
}
