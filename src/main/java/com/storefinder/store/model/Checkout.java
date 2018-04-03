package com.storefinder.store.model;

import java.util.ArrayList;

public class Checkout {
	private String name;
	private String address;
	private int city;
	private String number;
	private int acquireMethod;
	private String date;
	private String time;
	private int paymentMethod;
	
	private String cardNumber;
	private String cardExpiry;
	private String cardCVC;
	
	private ArrayList<Product> orders;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public int getAcquireMethod() {
		return acquireMethod;
	}

	public void setAcquireMethod(int acquireMethod) {
		this.acquireMethod = acquireMethod;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(int paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardExpiry() {
		return cardExpiry;
	}

	public void setCardExpiry(String cardExpiry) {
		this.cardExpiry = cardExpiry;
	}

	public String getCardCVC() {
		return cardCVC;
	}

	public void setCardCVC(String cardCVC) {
		this.cardCVC = cardCVC;
	}

	public ArrayList<Product> getOrders() {
		return orders;
	}

	public void setOrders(ArrayList<Product> orders) {
		this.orders = orders;
	}
}
