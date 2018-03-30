package com.jsjk.model;

import java.util.Date;

public class Record {

	private Integer id;
	private Date createDate;
	private Integer dId;
	private Integer uId;
	private Integer foodCount;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public Integer getFoodCount() {
		return foodCount;
	}
	public void setFoodCount(Integer foodCount) {
		this.foodCount = foodCount;
	}
	
	
}
