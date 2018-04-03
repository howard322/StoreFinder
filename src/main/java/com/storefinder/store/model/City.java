package com.storefinder.store.model;

public class City {
	private int loc_id;
	private String name;
	
	public City() {
	}

	public City(int id, String name){
		this.loc_id = id;
		this.name = name;
	}

	public int getLoc_id() {
		return loc_id;
	}

	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
