package id.ac.itb.indoormap.model.entity;

import java.io.Serializable;

public class Lokasi implements Serializable {
	private static final long serialVersionUID = 1L;

	private String id;

	private String deskripsi;

	private int major;
	
	private int denahLebar;

	private String denahFile;

	private Lokasi lokasi;

	private Role role;

	public Lokasi() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeskripsi() {
		return this.deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}

	public int getMajor() {
		return major;
	}

	public void setMajor(int major) {
		this.major = major;
	}

	public int getDenahLebar() {
		return denahLebar;
	}

	public void setDenahLebar(int denahLebar) {
		this.denahLebar = denahLebar;
	}

	public String getDenahFile() {
		return denahFile;
	}

	public void setDenahFile(String denahFile) {
		this.denahFile = denahFile;
	}

	public Lokasi getLokasi() {
		return this.lokasi;
	}

	public void setLokasi(Lokasi lokasi) {
		this.lokasi = lokasi;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}