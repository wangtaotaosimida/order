package com.jsjk.service;

import java.util.List;

import com.jsjk.model.Record;

public interface RecordService {
	public int addRecord(Record record);
	
	public List<Record> selectInfo(Integer uId);
	
	public List<Record> selectAll();
}
