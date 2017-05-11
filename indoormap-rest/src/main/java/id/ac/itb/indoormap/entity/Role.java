package id.ac.itb.indoormap.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.util.List;


/**
 * The persistent class for the role database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Role.findAll", query="SELECT r FROM Role r"),
	@NamedQuery(name="Role.find", query="SELECT r FROM Role r WHERE r.id = :id")
})
@JsonIdentityInfo(
		  generator = ObjectIdGenerators.PropertyGenerator.class, 
		  property = "id",
		  scope = Role.class)
public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Lob
	private String deskripsi;

	@OneToMany(mappedBy="role", cascade = CascadeType.ALL)
	@JsonIgnore
	private List<Lokasi> lokasis;

	@ManyToMany(mappedBy="roles", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JsonIgnore
	private List<User> users;

	public Role() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeskripsi() {
		return this.deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}

	public List<Lokasi> getLokasis() {
		return this.lokasis;
	}

	public void setLokasis(List<Lokasi> lokasis) {
		this.lokasis = lokasis;
	}

	public Lokasi addLokasi(Lokasi lokasi) {
		getLokasis().add(lokasi);
		lokasi.setRole(this);

		return lokasi;
	}

	public Lokasi removeLokasi(Lokasi lokasi) {
		getLokasis().remove(lokasi);
		lokasi.setRole(null);

		return lokasi;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}