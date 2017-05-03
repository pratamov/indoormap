package id.ac.itb.indoormap.model;


public class Denah {
	private int id;
	private int id_gambar;
	private String url_gambar;
	private double lebar_gambar;
	private int id_lokasi;
	private int id_role;
	private String role_role;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_gambar() {
		return id_gambar;
	}
	public void setId_gambar(int id_gambar) {
		this.id_gambar = id_gambar;
	}
	public String getUrl_gambar() {
		return url_gambar;
	}
	public void setUrl_gambar(String url_gambar) {
		this.url_gambar = url_gambar;
	}
	public double getLebar_gambar() {
		return lebar_gambar;
	}
	public void setLebar_gambar(double lebar_gambar) {
		this.lebar_gambar = lebar_gambar;
	}
	public int getId_lokasi() {
		return id_lokasi;
	}
	public void setId_lokasi(int id_lokasi) {
		this.id_lokasi = id_lokasi;
	}
	public int getId_role() {
		return id_role;
	}
	public void setId_role(int id_role) {
		this.id_role = id_role;
	}
	public String getRole_role() {
		return role_role;
	}
	public void setRole_role(String role_role) {
		this.role_role = role_role;
	}
	
}