package com.storefinder.users.dao;

import java.sql.SQLException;

import com.storefinder.users.model.User;
import com.storefinder.users.model.UserInfo;

public interface UserDao {
	User findByUserName(String username);
	UserInfo getUser(String username) throws SQLException;
	void insertUser(UserInfo user) throws SQLException;
}