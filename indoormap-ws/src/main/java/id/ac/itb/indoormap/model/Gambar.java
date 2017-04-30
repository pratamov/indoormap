package id.ac.itb.indoormap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the gambar database table.
 * 
 */
@Entity
@NamedQuery(name="Gambar.findAll", query="SELECT g FROM Gambar g")
public class Gambar implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private double lebar;

	private String url;

	//bi-directional many-to-one association to Denah
	@OneToMany(mappedBy="gambar")
	private List<Denah> denahs;

	public Gambar() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getLebar() {
		return this.lebar;
	}

	public void setLebar(double lebar) {
		this.lebar = lebar;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Denah> getDenahs() {
		return this.denahs;
	}

	public void setDenahs(List<Denah> denahs) {
		this.denahs = denahs;
	}

	public Denah addDenah(Denah denah) {
		getDenahs().add(denah);
		denah.setGambar(this);

		return denah;
	}

	public Denah removeDenah(Denah denah) {
		getDenahs().remove(denah);
		denah.setGambar(null);

		return denah;
	}

}