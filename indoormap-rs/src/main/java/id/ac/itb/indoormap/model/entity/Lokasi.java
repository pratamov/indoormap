package id.ac.itb.indoormap.model.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.List;


/**
 * The persistent class for the lokasi database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Lokasi.findAll", query="SELECT l FROM Lokasi l"),
	@NamedQuery(name="Lokasi.find", query="SELECT l FROM Lokasi l WHERE l.id = :id")
})
public class Lokasi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Lob
	private String deskripsi;

	@Column(name="gambar_lebar")
	private int gambarLebar;

	@Column(name="gambar_url")
	private int gambarUrl;

	private String nama;

	//bi-directional many-to-one association to Geofence
	@OneToMany(mappedBy="lokasi")
	@JsonManagedReference
	private List<Geofence> geofences;

	//bi-directional many-to-one association to Lokasi
	@ManyToOne
	@JoinColumn(name="id_lokasi")
	@JsonManagedReference
	private Lokasi lokasi;

	//bi-directional many-to-one association to Lokasi
	@OneToMany(mappedBy="lokasi")
	@JsonBackReference
	private List<Lokasi> lokasis;

	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="id_role")
	@JsonManagedReference
	private Role role;

	public Lokasi() {
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

	public int getGambarLebar() {
		return this.gambarLebar;
	}

	public void setGambarLebar(int gambarLebar) {
		this.gambarLebar = gambarLebar;
	}

	public int getGambarUrl() {
		return this.gambarUrl;
	}

	public void setGambarUrl(int gambarUrl) {
		this.gambarUrl = gambarUrl;
	}

	public String getNama() {
		return this.nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public List<Geofence> getGeofences() {
		return this.geofences;
	}

	public void setGeofences(List<Geofence> geofences) {
		this.geofences = geofences;
	}

	public Geofence addGeofence(Geofence geofence) {
		getGeofences().add(geofence);
		geofence.setLokasi(this);

		return geofence;
	}

	public Geofence removeGeofence(Geofence geofence) {
		getGeofences().remove(geofence);
		geofence.setLokasi(null);

		return geofence;
	}

	public Lokasi getLokasi() {
		return this.lokasi;
	}

	public void setLokasi(Lokasi lokasi) {
		this.lokasi = lokasi;
	}

	public List<Lokasi> getLokasis() {
		return this.lokasis;
	}

	public void setLokasis(List<Lokasi> lokasis) {
		this.lokasis = lokasis;
	}

	public Lokasi addLokasi(Lokasi lokasi) {
		getLokasis().add(lokasi);
		lokasi.setLokasi(this);

		return lokasi;
	}

	public Lokasi removeLokasi(Lokasi lokasi) {
		getLokasis().remove(lokasi);
		lokasi.setLokasi(null);

		return lokasi;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}