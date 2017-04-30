package id.ac.itb.indoormap.model;

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

	private String nama;

	//bi-directional many-to-one association to Denah
	@ManyToOne
	@JoinColumn(name="id_denah")
	private Denah denah;

	public Geofence() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNama() {
		return this.nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public Denah getDenah() {
		return this.denah;
	}

	public void setDenah(Denah denah) {
		this.denah = denah;
	}

}