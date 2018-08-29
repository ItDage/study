package com.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.entity.Collection;
import com.study.entity.Video;

@Mapper
public interface CollectionDao {

	int add(Collection collection);

	int delete(Collection collection);

	List<Collection> get(HashMap<Object, Object> map);

	List<Video> getCollection(HashMap<Object, Object> map);

}
