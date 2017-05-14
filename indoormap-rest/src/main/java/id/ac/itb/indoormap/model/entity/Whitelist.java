package id.ac.itb.indoormap.model.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Whitelist.findAll", query="SELECT w FROM Whitelist w"),
	@NamedQuery(name="Whitelist.find", query="SELECT w FROM Whitelist w WHERE w.id = :id")
})
@JsonIdentityInfo(
		  generator = ObjectIdGenerators.PropertyGenerator.class, 
		  property = "id",
		  scope = Whitelist.class)
public class Whitelist implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	public Whitelist() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

}