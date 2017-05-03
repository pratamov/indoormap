package id.ac.itb.indoormap.entity;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the geofence database table.
 * 
 */
@Entity
@NamedQuery(name="Geofence.findAll", query="SELECT g FROM Geofence g")
public class Geofence implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private double x1;
	
	private double y1;
	
	private double x2;
	
	private double y2;
	
	private String nama;

	//bi-directional many-to-one association to Denah
	@ManyToOne
	@JoinColumn(name="id_denah")
	private Denah denah;

	public Geofence() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getX1() {
		return x1;
	}

	public void setX1(double x1) {
		this.x1 = x1;
	}

	public double getY1() {
		return y1;
	}

	public void setY1(double y1) {
		this.y1 = y1;
	}

	public double getX2() {
		return x2;
	}

	public void setX2(double x2) {
		this.x2 = x2;
	}

	public double getY2() {
		return y2;
	}

	public void setY2(double y2) {
		this.y2 = y2;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public Denah getDenah() {
		return denah;
	}

	public void setDenah(Denah denah) {
		this.denah = denah;
	}

	

}