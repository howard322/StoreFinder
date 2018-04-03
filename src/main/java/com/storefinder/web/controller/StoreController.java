package com.storefinder.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.storefinder.store.dao.StoreDaoImpl;
import com.storefinder.store.model.Checkout;
import com.storefinder.store.model.Product;
import com.storefinder.users.dao.UserDaoImpl;
import com.storefinder.users.model.UserInfo;


@Controller
public class StoreController {
	@Autowired
	private StoreDaoImpl storeDao;
	@Autowired
	private UserDaoImpl userDao;
	   
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public ModelAndView shop(@RequestParam(value = "items", required = false) String items,
			HttpServletRequest request) throws SQLException, JSONException {

		ModelAndView model = new ModelAndView();

		model.addObject("products", storeDao.getAllProducts());
		if(items != null) {
			model.addObject("menuitems", items);
		} else {
			model.addObject("menuitems", "[]");
		}
		
		model.setViewName("shop");
		return model;

	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkout(@RequestParam(value = "items", required = true) String items,
			HttpServletRequest request) throws SQLException, JSONException {

		ModelAndView model = new ModelAndView();
		//JSONArray orders = new JSONArray(items);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UserInfo user = userDao.getUser(userDetail.getUsername());
			model.addObject("user", user);
			model.addObject("email", user.getEmail());
		}

		model.addObject("cities", storeDao.getAllCities());
		
		model.addObject("items", items);
		return model;

	}	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cart(@RequestParam(value = "items", required = true) String items,
			HttpServletRequest request) throws SQLException, JSONException {

		ModelAndView model = new ModelAndView();
		ArrayList<Product> products = new ArrayList<Product>();
		JSONArray orders = new JSONArray(items);
		double total = 0;
		
		for(int i = 0; i < orders.length(); i++){
			Product product = new Product(Integer.parseInt(orders.getJSONObject(i).get("ItemCode").toString()), orders.getJSONObject(i).get("Item").toString(), orders.getJSONObject(i).get("Description").toString());
			product.setPrice(Double.parseDouble(orders.getJSONObject(i).get("Price").toString()));
			product.setQty(Integer.parseInt(orders.getJSONObject(i).get("Qty").toString()));
			products.add(product);
			total += product.getSubTotal();
		}

		model.addObject("items", items);
		model.addObject("products", products);
		model.addObject("total", total);
		model.setViewName("shoppingCart");
		return model;

	}
	
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "items", required = true) String items,
			HttpServletRequest request) throws SQLException, JSONException {

		ModelAndView model = new ModelAndView();
		JSONArray orders = new JSONArray(items);
		
		ArrayList<String> products = new ArrayList<String>();
		ArrayList<String> itemCodesList = new ArrayList<String>();
		HashMap<Integer, String> prods = new HashMap<Integer, String>(); 
		String itemCodes = "";
		for(int i = 0; i < orders.length(); i++){
			itemCodes += orders.getJSONObject(i).get("ItemCode") + ",";
			products.add(orders.getJSONObject(i).get("Item").toString());
			itemCodesList.add(orders.getJSONObject(i).get("ItemCode").toString());
			prods.put(Integer.parseInt(orders.getJSONObject(i).get("ItemCode").toString()), orders.getJSONObject(i).get("Item").toString());
		}

		if(items != null) {
			model.addObject("menuitems", items);
		} else {
			model.addObject("menuitems", "[]");
		}
		
		model.addObject("availableStores", storeDao.getAvailableStores("name", itemCodes.substring(0, itemCodes.length()-1)));
		model.addObject("availableStoresbyId", storeDao.getAvailableStores("store_id", itemCodes.substring(0, itemCodes.length()-1)));
		
		model.addObject("items", products);
		model.addObject("prices", storeDao.getPricePerStore(prods));
		
		model.setViewName("searchItem");

		return model;

	}
	
	@ModelAttribute("newCheckout")
	public Checkout getCheckout() {
		return new Checkout();
	}
	
	@RequestMapping(value = "/checkoutOrders", method = RequestMethod.POST)
	public String register(@RequestParam(value = "items", required = true) String items, 
			@ModelAttribute("newCheckout") Checkout newCheckout, ModelMap model) {
		
		JSONArray orders;
		try {
			orders = new JSONArray(items);
			ArrayList<Product> orderList = new ArrayList<Product>();
			
			for(int i = 0; i < orders.length(); i++){
				JSONObject prod = orders.getJSONObject(i);
				Product product = new Product();
				product.setProduct_id(Integer.parseInt(prod.get("ItemCode").toString()));
				product.setName(prod.get("Item").toString());
				product.setDescription(prod.get("Description").toString());
				product.setQty(Integer.parseInt(prod.get("Qty").toString()));
				product.setPrice(Double.parseDouble(prod.get("Price").toString()));
				
				orderList.add(product);
			}
			
			newCheckout.setOrders(orderList);
			storeDao.checkoutOrders(newCheckout);
		} catch (JSONException e) {
			e.printStackTrace();
			model.addObject("errormsg", "Error processing orders. Orders not posted! Please go back.");
			return "registerSuccess";
		} catch (SQLException e) {
			e.printStackTrace();
			model.addObject("errormsg", "Error inserting orders. Orders not posted! Please go back." + e.getMessage());
			return "registerSuccess";
		}
		
		model.addObject("message", "Orders successfully posted! ");
		return "registerSuccess";

	}
}