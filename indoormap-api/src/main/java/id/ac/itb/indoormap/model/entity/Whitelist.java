package id.ac.itb.indoormap.model.entity;

import java.io.Serializable;

public class Whitelist implements Serializable {
	private static final long serialVersionUID = 1L;

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