package id.ac.itb.indoormap.model;

public class Ibeacon {
	
	private String uuid;
	private int major;
	private int minor;
	private double distance;
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getMajor() {
		return major;
	}
	public void setMajor(int major) {
		this.major = major;
	}
	public int getMinor() {
		return minor;
	}
	public void setMinor(int minor) {
		this.minor = minor;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public double getX(){
		return Math.round(minor/100);
	}
	public double getY(){
		return minor%100;
	}
	
	
}