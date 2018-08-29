package com.study.dao;

import org.springframework.stereotype.Repository;

import com.study.entity.LogRecord;

@Repository
public interface LogDao {

	int add(LogRecord logRecord);

}
