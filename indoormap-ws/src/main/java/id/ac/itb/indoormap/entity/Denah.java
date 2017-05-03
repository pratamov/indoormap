package id.ac.itb.indoormap.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the denah database table.
 * 
 */
@Entity
@NamedQuery(name="Denah.findAll", query="SELECT d FROM Denah d")
public class Denah implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	//bi-directional many-to-one association to Lokasi
	@ManyToOne
	@JoinColumn(name="id_lokasi")
	private Lokasi lokasi;

	//bi-directional many-to-one association to Gambar
	@ManyToOne
	@JoinColumn(name="id_gambar")
	private Gambar gambar;
	
	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="id_role")
	private Role role;

	//bi-directional many-to-one association to Geofence
	@OneToMany(mappedBy="denah")
	private List<Geofence> geofences;

	//bi-directional many-to-one association to Ibeacon
	@OneToMany(mappedBy="denah")
	private List<Ibeacon> ibeacons;

	public Denah() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Lokasi getLokasi() {
		return this.lokasi;
	}

	public void setLokasi(Lokasi lokasi) {
		this.lokasi = lokasi;
	}

	public Gambar getGambar() {
		return this.gambar;
	}

	public void setGambar(Gambar gambar) {
		this.gambar = gambar;
	}
	
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Geofence> getGeofences() {
		return this.geofences;
	}

	public void setGeofences(List<Geofence> geofences) {
		this.geofences = geofences;
	}

	public Geofence addGeofence(Geofence geofence) {
		getGeofences().add(geofence);
		geofence.setDenah(this);

		return geofence;
	}

	public Geofence removeGeofence(Geofence geofence) {
		getGeofences().remove(geofence);
		geofence.setDenah(null);

		return geofence;
	}

	public List<Ibeacon> getIbeacons() {
		return this.ibeacons;
	}

	public void setIbeacons(List<Ibeacon> ibeacons) {
		this.ibeacons = ibeacons;
	}

	public Ibeacon addIbeacon(Ibeacon ibeacon) {
		getIbeacons().add(ibeacon);
		ibeacon.setDenah(this);

		return ibeacon;
	}

	public Ibeacon removeIbeacon(Ibeacon ibeacon) {
		getIbeacons().remove(ibeacon);
		ibeacon.setDenah(null);

		return ibeacon;
	}

}