package com.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dao.CourseDao;
import com.study.entity.Navigation;
import com.study.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;
	
	@Override
	public List<Navigation> getSecNavByFirNav(String firstNav) {
		
		return courseDao.getSecNavByFirNav(firstNav);
	}

}
