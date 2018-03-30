package com.jsjk.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsjk.dao.RecordDao;
import com.jsjk.model.Record;
import com.jsjk.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService{

	@Autowired
	private RecordDao recordDao;
	
	public int addRecord(Record record) {
		return recordDao.addRecord(record);
	}

	public List<Record> selectInfo(Integer uId) {
		return recordDao.selectInfo(uId);
	}

	public List<Record> selectAll() {
		return recordDao.selectAll();
	}

}
