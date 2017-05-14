package id.ac.itb.indoormap.model;

import java.util.List;

public class PosisiInput {
	
	private String userId;
	private String userPassword;
	private List<Ibeacon> ibeacons;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public List<Ibeacon> getIbeacons() {
		return ibeacons;
	}
	public void setIbeacons(List<Ibeacon> ibeacons) {
		this.ibeacons = ibeacons;
	}
	
}