package com.storefinder.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.storefinder.users.model.User;
import com.storefinder.users.model.UserInfo;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();

		users = sessionFactory.getCurrentSession().createQuery("from User where username=?").setParameter(0, username)
				.list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}
	
	public UserInfo getUser(String username) throws SQLException {
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;

		stmt = connectionSource.prepareStatement("SELECT * FROM user_info where username = ?");
		stmt.setString(1, username);
		
		UserInfo user = new UserInfo();
        ResultSet resultSet = stmt.executeQuery();

        while(resultSet.next()){
        	user = new UserInfo(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), 
        			resultSet.getString(5));
        	// add 5 pag new field
        }
        
        resultSet.close();
        stmt.close();
        connectionSource.close();
		return user;
	}
	
	public void insertUser(UserInfo user) throws SQLException {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		Connection connectionSource = dataSource.getConnection();
		PreparedStatement stmt = null;

		stmt = connectionSource.prepareStatement("INSERT INTO users (username, password, enabled) values (?, ?, ?)");
		stmt.setString(1, user.getUsername());
		stmt.setString(2, encoder.encode(user.getPassword()));
		stmt.setBoolean(3, true);
        stmt.execute();
        
		stmt = connectionSource.prepareStatement("INSERT INTO user_roles (username, role) values (?, ?)");
		stmt.setString(1, user.getUsername());
		stmt.setString(2, "ROLE_USER");
        stmt.execute();
        
        // INSERT NEW FIELDS tapos ?
		stmt = connectionSource.prepareStatement("INSERT INTO user_info (username, email, name, city_id, type) values (?, ?, ?, ?, ?)");
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getEmail());
		stmt.setString(3, user.getName());
		stmt.setInt(4, Integer.parseInt(user.getCity()));
		stmt.setString(5, user.gettype());
		// insert getBuyer and seller
        stmt.execute();
        
        stmt.close();
        connectionSource.close();
	}
}