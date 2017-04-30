package id.ac.itb.indoormap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the ibeacon database table.
 * 
 */
@Entity
@NamedQuery(name="Ibeacon.findAll", query="SELECT i FROM Ibeacon i")
public class Ibeacon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int id1;

	private int id2;

	private int id3;

	private BigDecimal jarak;

	//bi-directional many-to-one association to Denah
	@ManyToOne
	@JoinColumn(name="id_denah")
	private Denah denah;

	public Ibeacon() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId1() {
		return this.id1;
	}

	public void setId1(int id1) {
		this.id1 = id1;
	}

	public int getId2() {
		return this.id2;
	}

	public void setId2(int id2) {
		this.id2 = id2;
	}

	public int getId3() {
		return this.id3;
	}

	public void setId3(int id3) {
		this.id3 = id3;
	}

	public BigDecimal getJarak() {
		return this.jarak;
	}

	public void setJarak(BigDecimal jarak) {
		this.jarak = jarak;
	}

	public Denah getDenah() {
		return this.denah;
	}

	public void setDenah(Denah denah) {
		this.denah = denah;
	}

}