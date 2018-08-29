package com.study.service;

import org.springframework.stereotype.Service;

import com.study.entity.LogRecord;

@Service
public interface LogService {

	public int add(LogRecord logRecord);
}
