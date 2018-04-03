package com.storefinder.store.model;

public class Product {

	private int product_id;
	private String name;
	private String description;
	private int qty = 0;
	private double price = 0;
	private double subTotal = price * qty;

	public Product() {
	}

	public Product(int id, String name, String desc){
		this.product_id = id;
		this.name = name;
		this.description = desc;
	}
	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
		this.subTotal = price * qty;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
		this.subTotal = price * qty;
	}
	
	public double getSubTotal() {
		return price * qty;
	}

}
