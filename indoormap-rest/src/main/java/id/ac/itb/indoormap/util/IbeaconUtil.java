package id.ac.itb.indoormap.util;

import id.ac.itb.indoormap.model.Ibeacon;
import id.ac.itb.indoormap.model.Koordinat;

public class IbeaconUtil {
	
	public static int getLokasiId(Ibeacon ibeacon){
		return ibeacon.getMajor();
	}
	
	public static Koordinat getKoordinat(Ibeacon ibeacon){
		Koordinat koordinat = new Koordinat();
		
		double x = Math.round(ibeacon.getMinor() / 100);
		double y = ibeacon.getMinor() % 100;
		koordinat.setX(x);
		koordinat.setY(y);
		
		return koordinat;
	}
	
}
