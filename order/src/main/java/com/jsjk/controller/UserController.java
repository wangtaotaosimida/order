package com.jsjk.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsjk.model.Department;
import com.jsjk.model.Record;
import com.jsjk.model.User;
import com.jsjk.service.DepartmentService;
import com.jsjk.service.RecordService;
import com.jsjk.service.UserService;
import com.jsjk.service.serviceImpl.UserServiceImpl;
import com.jsjk.util.BaseJsons;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("selectDL")
	public ModelAndView selectDepartmentList(){
		ModelAndView mav = new ModelAndView("Table");
		List<Department> dList = departmentService.selectDepartment();
		mav.addObject("dList", dList);
		List<User> uList = userService.selectUserList(1);
		mav.addObject("uList", uList);
		return mav;
	}
	
	@RequestMapping("selectUL")
	@ResponseBody
	public BaseJsons selectUserList(@RequestParam("dID") Integer dID){
		
		if(dID == null){
			BaseJsons baseJsons = new BaseJsons(1,"错误",null);
			return baseJsons;
		}
		
		List<User> uList = userService.selectUserList(dID);
		BaseJsons baseJsons = new BaseJsons(0,"成功",uList);
		return baseJsons;
	}
	
	@RequestMapping("addRecord")
	@ResponseBody
	public BaseJsons addRecord(Record record){
		
		if(null == record.getFoodCount()){
			BaseJsons baseJsons = new BaseJsons(1,"请输入餐份数",null);
			return baseJsons; 
		}
		
		record.setCreateDate(new Date());
		
		int count = recordService.addRecord(record);
		if(count > 0){
			BaseJsons baseJsons = new BaseJsons(0,"成功",null);
			return baseJsons;
		}
		BaseJsons baseJsons = new BaseJsons(1,"失败",null);
		return baseJsons;
	}
	
	@RequestMapping("selectInfo")
	@ResponseBody
	public BaseJsons selectInfo(@RequestParam("uId") Integer uId){
		List<Record> list = recordService.selectInfo(uId);
		BaseJsons baseJsons = new BaseJsons(0,"成功",list);
		return baseJsons;
	}
	
	@RequestMapping("selectAll")
	@ResponseBody
	public BaseJsons selectAll(){
		List<Record> list = recordService.selectAll();
		BaseJsons baseJsons = new BaseJsons(0,"成功",list);
		return baseJsons;
	}
	
	public ModelAndView addUserRecord(@RequestParam("user") User user){
		int count = userService.addUserRecord(user);
		
		ModelAndView mav = new ModelAndView();
		
		if(count > 0){
			
		}
		
		return null;
	}
}
