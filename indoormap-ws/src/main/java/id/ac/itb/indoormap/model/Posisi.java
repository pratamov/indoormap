package id.ac.itb.indoormap.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the posisi database table.
 * 
 */
@Entity
@NamedQuery(name="Posisi.findAll", query="SELECT p FROM Posisi p")
public class Posisi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private double x;

	private double y;

	//bi-directional many-to-one association to Denah
	@ManyToOne
	@JoinColumn(name="id_denah")
	private Denah denah;

	public Posisi() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getX() {
		return this.x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return this.y;
	}

	public void setY(double y) {
		this.y = y;
	}

	public Denah getDenah() {
		return this.denah;
	}

	public void setDenah(Denah denah) {
		this.denah = denah;
	}

}