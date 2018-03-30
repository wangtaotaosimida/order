package com.jsjk.dao;

import java.util.List;

import com.jsjk.model.Record;

public interface RecordDao {
	public int addRecord(Record record);
	
	public List<Record> selectInfo(Integer uId);
	
	public List<Record> selectAll();
}
