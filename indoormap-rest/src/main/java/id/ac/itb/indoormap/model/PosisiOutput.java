package id.ac.itb.indoormap.model;

import java.util.List;

import id.ac.itb.indoormap.model.entity.Geofence;

public class PosisiOutput {
	
	private Koordinat koordinat;
	private List<Geofence> geofences;
	public Koordinat getKoordinat() {
		return koordinat;
	}
	public void setKoordinat(Koordinat koordinat) {
		this.koordinat = koordinat;
	}
	public List<Geofence> getGeofences() {
		return geofences;
	}
	public void setGeofences(List<Geofence> geofences) {
		this.geofences = geofences;
	}
	
	
}
