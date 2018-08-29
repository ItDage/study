package com.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.study.entity.Navigation;

@Service
public interface CourseService {

	/**
	 * 根据一级导航得到二级导航
	 * @param firstNav 一级导航名
	 * @return
	 */
	public List<Navigation> getSecNavByFirNav(String firstNav);
}
