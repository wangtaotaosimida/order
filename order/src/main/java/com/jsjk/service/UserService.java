package com.jsjk.service;

import java.util.List;

import com.jsjk.model.User;

public interface UserService {
	public int addUserRecord(User user);
	
	public List<User> selectUserList(Integer dId);
}
