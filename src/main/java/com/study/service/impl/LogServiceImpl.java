package com.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dao.LogDao;
import com.study.entity.LogRecord;
import com.study.service.LogService;

@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private LogDao logDao;
	
	@Override
	public int add(LogRecord logRecord) {
		return logDao.add(logRecord);
	}

}
