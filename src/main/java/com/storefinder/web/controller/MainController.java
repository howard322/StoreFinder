package com.storefinder.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.storefinder.store.dao.impl.StoreDaoImpl;
import com.storefinder.users.dao.UserDaoImpl;
import com.storefinder.users.model.UserInfo;

@Controller
public class MainController {

	@Autowired
	private UserDaoImpl userDao;
	@Autowired
	private StoreDaoImpl storeDao;

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() throws SQLException {
		
		ModelAndView model = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UserInfo user = userDao.getUser(userDetail.getUsername());
			List<String> roles = new ArrayList<String>();
			for (GrantedAuthority authority : auth.getAuthorities()) {
				roles.add(authority.getAuthority());
			}

			addRoleProps(model, auth);
			model.addObject("email", user.getEmail());
			model.setViewName("hello");
			return model;
		}
		model.addObject("title", "Spring Security + Hibernate Example");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security + Hibernate Example");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) throws SQLException {

		ModelAndView model = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			UserInfo user = userDao.getUser(userDetail.getUsername());
			addRoleProps(model, auth);

			model.addObject("email", user.getEmail());
			model.setViewName("hello");
			return model;
		}
		
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("signin");

		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = exception.getLocalizedMessage();
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signup() throws SQLException {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
			model.addObject("username", userDetail.getUsername());
			model.addObject("role", userDetail.getAuthorities());

			addRoleProps(model, auth);
			model.setViewName("hello");
			return model;
		}

		model.addObject("cities", storeDao.getAllCities());
		model.setViewName("signup");
		return model;

	}
	
	@ModelAttribute("newUser")
	public UserInfo getUser() {
		return new UserInfo();
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("newUser") UserInfo newUser, ModelMap model) {
		if(!newUser.getPassword().equals(newUser.getPasswordConf())){
			model.addObject("errormsg", "Passwords are not the same!");
			return "signup";
		} else {
			try {
				userDao.insertUser(newUser);
			} catch (SQLException e) {
				e.printStackTrace();
				model.addObject("errormsg", "Error registering user!");
				return "signup";
			}
			model.addObject("message", "Thanks for registering. You have successfully registered user " + newUser.getUsername());
			return "registerSuccess";
		}

	}

	private void addRoleProps(ModelAndView model, Authentication auth) {
		List<String> roles = new ArrayList<String>();
		for (GrantedAuthority authority : auth.getAuthorities()) {
			roles.add(authority.getAuthority());
		}

		model.addObject("isAdmin", roles.contains("ROLE_ADMIN"));
		model.addObject("isBuyer", roles.contains("ROLE_BUYER"));
		model.addObject("isSeller", roles.contains("ROLE_SELLER"));
	}

}