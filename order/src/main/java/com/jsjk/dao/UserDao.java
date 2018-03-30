package com.jsjk.dao;

import java.util.List;

import com.jsjk.model.User;

public interface UserDao {

	public int addUserRecord(User user);
	
	public List<User> selectUserList(Integer dId);
}
