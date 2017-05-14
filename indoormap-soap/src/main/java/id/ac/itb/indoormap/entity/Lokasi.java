package id.ac.itb.indoormap.entity;

import java.io.Serializable;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class Lokasi implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;

	private String deskripsi;

	private int gambarLebar;

	private String gambarUrl;

	private String nama;

	private Lokasi lokasi;

	private List<Lokasi> lokasis;

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

	public String getGambarUrl() {
		return this.gambarUrl;
	}

	public void setGambarUrl(String gambarUrl) {
		this.gambarUrl = gambarUrl;
	}

	public String getNama() {
		return this.nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
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