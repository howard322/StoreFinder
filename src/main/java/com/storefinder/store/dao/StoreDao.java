package com.storefinder.store.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.storefinder.store.model.Checkout;
import com.storefinder.store.model.City;
import com.storefinder.store.model.Product;
import com.storefinder.store.model.Store;

public interface StoreDao {
	ArrayList<City> getAllCities() throws SQLException;
	ArrayList<Product> getAllProducts() throws SQLException;
	ArrayList<String> getAvailableStores(String col, String itemCodes) throws SQLException;
	Map<String, ArrayList<String>> getPricePerStore(HashMap<Integer, String> prods) throws SQLException;
	void checkoutOrders(Checkout orderDetails) throws SQLException;

	Store findByName(String name);
}
