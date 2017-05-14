package id.ac.itb.indoormap.model;

import java.util.List;

import id.ac.itb.indoormap.model.entity.Role;

public class PosisiInput {

	private List<Ibeacon> ibeacons;
	private List<Role> roles;
	
	public List<Ibeacon> getIbeacons() {
		return ibeacons;
	}
	public void setIbeacons(List<Ibeacon> ibeacons) {
		this.ibeacons = ibeacons;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	
}
