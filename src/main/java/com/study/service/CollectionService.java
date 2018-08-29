package com.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.study.entity.Collection;
import com.study.entity.Video;

@Service
public interface CollectionService {

	public int add(Collection collection);
	
	public int delete(Collection collection);
	
	public List<Collection> get(HashMap<Object, Object> map);
	
	public List<Video> getCollection(HashMap<Object, Object> map);
}
