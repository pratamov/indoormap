package id.ac.itb.indoormap.model;

import java.util.List;

import id.ac.itb.indoormap.model.entity.Geofence;

public class PosisiOutput {
	
	private double x;
	private double y;
	private List<Geofence> geofences;
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public List<Geofence> getGeofences() {
		return geofences;
	}
	public void setGeofences(List<Geofence> geofences) {
		this.geofences = geofences;
	}

	
}
