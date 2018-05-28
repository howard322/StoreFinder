package com.storefinder.users.dao;

import com.storefinder.users.model.User;
import com.storefinder.users.model.UserInfo;

import java.sql.SQLException;

public interface UserDao {
    User findByUserName(String username);

    UserInfo getUser(String username) throws SQLException;

    void insertUser(UserInfo user) throws SQLException;
}