package id.ac.itb.indoormap.model;

import java.util.List;

public class PosisiOutput {
	
	private int lokasiId;
	private String denahUrl;
	private String denahLebar;
	private String nama;
	private String deskripsi;
	private List<Ruang> ruangs;
	private Koordinat koordinat;
	public int getLokasiId() {
		return lokasiId;
	}
	public void setLokasiId(int lokasiId) {
		this.lokasiId = lokasiId;
	}
	public String getDenahUrl() {
		return denahUrl;
	}
	public void setDenahUrl(String denahUrl) {
		this.denahUrl = denahUrl;
	}
	public String getDenahLebar() {
		return denahLebar;
	}
	public void setDenahLebar(String denahLebar) {
		this.denahLebar = denahLebar;
	}
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getDeskripsi() {
		return deskripsi;
	}
	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}
	public List<Ruang> getRuangs() {
		return ruangs;
	}
	public void setRuangs(List<Ruang> ruangs) {
		this.ruangs = ruangs;
	}
	public Koordinat getKoordinat() {
		return koordinat;
	}
	public void setKoordinat(Koordinat koordinat) {
		this.koordinat = koordinat;
	}
	
	
	
}