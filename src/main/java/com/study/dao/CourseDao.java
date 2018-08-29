package com.study.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.entity.Navigation;

@Mapper
public interface CourseDao {

	List<Navigation> getSecNavByFirNav(String firstNav);

}
