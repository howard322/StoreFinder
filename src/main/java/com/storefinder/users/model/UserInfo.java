package com.storefinder.users.model;

public class UserInfo {

	private String username;
	private String password;
	private String passwordConf;
	private String email;
	private String name;
	private String city;
	private String type;


	public UserInfo() {
	}

	public UserInfo(String username, String email, String name, String city_id, String type){
		this.username = username;
		this.email = email;
		this.name = name;
		this.setCity(city_id);
		this.settype(type);
	}
	
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPasswordConf() {
		return passwordConf;
	}

	public void setPasswordConf(String passwordConf) {
		this.passwordConf = passwordConf;
	}

	public String gettype() {
		return type;
	}

	public void settype(String type) {
		this.type = type;
	}

}
