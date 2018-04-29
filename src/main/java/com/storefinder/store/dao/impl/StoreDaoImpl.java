package com.storefinder.store.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.dao.StoreDao;
import com.storefinder.store.model.Store;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.storefinder.store.model.Checkout;
import com.storefinder.store.model.City;
import com.storefinder.store.model.Product;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class StoreDaoImpl extends AbstractDao<Store, Long> implements StoreDao {

	@Autowired
	private BasicDataSource dataSource;

	@Override
	public ArrayList<Product> getAllProducts() throws SQLException {
		ArrayList<Product> products = new ArrayList<Product>();
		
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;

		stmt = connectionSource.prepareStatement("SELECT * FROM products");
		
        ResultSet resultSet = stmt.executeQuery();
        
        while(resultSet.next()){
        	products.add(new Product(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3)));
        }

        resultSet.close();
        stmt.close();
        connectionSource.close();
        
		return products;
	}
	
	@Override
	public ArrayList<String> getAvailableStores(String col, String itemCodes) throws SQLException {
		ArrayList<String> availableStores = new ArrayList<String>();
		
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;

		stmt = connectionSource.prepareStatement("SELECT DISTINCT(store."+ col +") FROM store_products INNER JOIN store ON store_products.store_id=store.store_id WHERE store_products.product_id IN (?)");
		stmt.setString(1, itemCodes);
		
        ResultSet resultSet = stmt.executeQuery();
        
        while(resultSet.next()){
        	availableStores.add(resultSet.getString(1));
        }

        resultSet.close();
        stmt.close();
        connectionSource.close();
		return availableStores;
	}

	@Override
	public Map<String, ArrayList<String>> getPricePerStore(HashMap<Integer, String> prods) throws SQLException {
		ArrayList<ArrayList<String>> pricePerStore = new ArrayList<ArrayList<String>>();
		HashMap<String, ArrayList<String>> prodsItems = new HashMap<String, ArrayList<String>>();
		
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;

		for(Integer key : prods.keySet()){
			ArrayList<String> currentStorePrices = new ArrayList<String>();
			stmt = connectionSource.prepareStatement("SELECT store_products.price FROM store_products INNER JOIN store ON store_products.store_id=store.store_id WHERE store.loc_id = 1 AND store_products.product_id = ?");
			stmt.setString(1, key.toString());
			
	        ResultSet resultSet = stmt.executeQuery();
	        
	        while(resultSet.next()){
	        	currentStorePrices.add(resultSet.getString(1));
	        }
	        resultSet.close();
	        
	        pricePerStore.add(currentStorePrices);
	        prodsItems.put(prods.get(key), currentStorePrices);
		}
		

        stmt.close();
        connectionSource.close();
		return prodsItems;
	}

	@Override
	public ArrayList<City> getAllCities() throws SQLException {
		ArrayList<City> cities = new ArrayList<City>();
		
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;

		stmt = connectionSource.prepareStatement("SELECT * FROM locations WHERE loc_id = parent_loc");
		
        ResultSet resultSet = stmt.executeQuery();
        
        while(resultSet.next()){
        	cities.add(new City(resultSet.getInt(1), resultSet.getString(2)));
        }

        resultSet.close();
        stmt.close();
        connectionSource.close();
        
		return cities;
	}

	@Override
	public void checkoutOrders(Checkout orderDetails) throws SQLException {
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddmmHHssSS");
		Date date = new Date();
		String dateToday = dateFormat.format(date);
		
		stmt = connectionSource.prepareStatement("INSERT INTO checkout (name, address, city, number, delivery, orderDate, creditpayment, cardNumber, cardExpiry, cardCVC, orders_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		stmt.setString(1, orderDetails.getName());
		stmt.setString(2, orderDetails.getAddress());
		stmt.setInt(3, orderDetails.getCity());
		stmt.setString(4, orderDetails.getNumber());
		stmt.setInt(5, orderDetails.getAcquireMethod());
		stmt.setString(6, orderDetails.getDate());
		stmt.setInt(7, orderDetails.getPaymentMethod());
		stmt.setString(8, orderDetails.getCardNumber());
		stmt.setString(9, orderDetails.getCardExpiry());
		stmt.setString(10, orderDetails.getCardCVC());
		stmt.setString(11, dateToday);
        stmt.execute();
        
        for(int i = 0; i < orderDetails.getOrders().size(); i++){
        	stmt = connectionSource.prepareStatement("INSERT INTO orders (order_id, product_id, qty, price) values (?, ?, ?, ?)");
    		stmt.setString(1, dateToday);
    		stmt.setInt(2, orderDetails.getOrders().get(i).getProduct_id());
    		stmt.setInt(3, orderDetails.getOrders().get(i).getQty());
    		stmt.setDouble(4, orderDetails.getOrders().get(i).getPrice());
    		stmt.execute();
        }
        
        stmt.close();
        connectionSource.close();

	}

	@Override
	public Store findByName(String name) {
		Query query = getCurrentSession().createQuery("from Store store where store.name = :name")
				.setString("name", name);

		return (Store) query.uniqueResult();
	}

}
