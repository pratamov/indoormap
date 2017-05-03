package id.ac.itb.indoormap.entity;

import java.io.Serializable;
import javax.persistence.*;
import javax.xml.bind.annotation.XmlTransient;

import org.eclipse.persistence.oxm.annotations.XmlInverseReference;

import java.util.List;


/**
 * The persistent class for the lokasi database table.
 * 
 */
@Entity
@NamedQuery(name="Lokasi.findAll", query="SELECT l FROM Lokasi l")
public class Lokasi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String deskripsi;

	private String nama;

	//bi-directional many-to-one association to Denah
	@OneToMany(mappedBy="lokasi")
	private List<Denah> denahs;

	//bi-directional many-to-one association to Lokasi
	@ManyToOne
	@JoinColumn(name="id_lokasi")
	private Lokasi lokasi;

	//bi-directional many-to-one association to Lokasi
	@OneToMany(mappedBy="lokasi")
	private List<Lokasi> lokasis;

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

	public String getNama() {
		return this.nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public List<Denah> getDenahs() {
		return this.denahs;
	}

	public void setDenahs(List<Denah> denahs) {
		this.denahs = denahs;
	}

	public Denah addDenah(Denah denah) {
		getDenahs().add(denah);
		denah.setLokasi(this);

		return denah;
	}

	public Denah removeDenah(Denah denah) {
		getDenahs().remove(denah);
		denah.setLokasi(null);

		return denah;
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

}