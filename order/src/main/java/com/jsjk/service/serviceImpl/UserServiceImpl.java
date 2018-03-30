package com.jsjk.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsjk.dao.UserDao;
import com.jsjk.model.User;
import com.jsjk.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	public int addUserRecord(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<User> selectUserList(Integer dId) {
		return userDao.selectUserList(dId);
	}

}
