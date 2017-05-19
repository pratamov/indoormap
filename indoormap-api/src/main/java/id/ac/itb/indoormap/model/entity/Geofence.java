package id.ac.itb.indoormap.model.entity;

import java.io.Serializable;

public class Geofence implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;

	private String deskripsi;

	private String nama;

	private double x1;

	private double x2;

	private double y1;

	private double y2;
	
	private Lokasi lokasi;

	public Geofence() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDeskripsi() {
		return this.deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}

	public String getNama() {
		return this.nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public double getX1() {
		return this.x1;
	}

	public void setX1(double x1) {
		this.x1 = x1;
	}

	public double getX2() {
		return this.x2;
	}

	public void setX2(double x2) {
		this.x2 = x2;
	}

	public double getY1() {
		return this.y1;
	}

	public void setY1(double y1) {
		this.y1 = y1;
	}

	public double getY2() {
		return this.y2;
	}

	public void setY2(double y2) {
		this.y2 = y2;
	}
	public Lokasi getLokasi() {
		return this.lokasi;
	}

	public void setLokasi(Lokasi lokasi) {
		this.lokasi = lokasi;
	}

}