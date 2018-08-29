package com.study.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dao.CollectionDao;
import com.study.entity.Collection;
import com.study.entity.Video;
import com.study.service.CollectionService;

@Service
public class CollectionServiceImpl implements CollectionService {

	@Autowired
	private CollectionDao collectionDao;
	
	@Override
	public int add(Collection collection) {
		// TODO Auto-generated method stub
		return collectionDao.add(collection);
	}

	@Override
	public int delete(Collection collection) {
		// TODO Auto-generated method stub
		return collectionDao.delete(collection);
	}

	@Override
	public List<Collection> get(HashMap<Object, Object> map) {
		// TODO Auto-generated method stub
		return collectionDao.get(map);
	}

	@Override
	public List<Video> getCollection(HashMap<Object, Object> map) {
		// TODO Auto-generated method stub
		return collectionDao.getCollection(map);
	}

}
