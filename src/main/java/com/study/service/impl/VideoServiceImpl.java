package com.study.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dao.VideoDao;
import com.study.entity.History;
import com.study.entity.User;
import com.study.entity.Video;
import com.study.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	private VideoDao videoDao;

	@Override
	public List<Video> getVideo(HashMap<Object, Object> map) {
		// TODO Auto-generated method stub
		return videoDao.getVideo(map);
	}

	@Transactional
	@Override
	public int update(Video video, User user) {
		//插入观看历史,1.先查询一下以前是否看过该视频,看过则更新最后浏览时间,没看过则插入观看历史
		
		HashMap<Object, Object> map = new HashMap<>();
		map.put("mail", user.getMail());
		map.put("v_id", video.getId());
		List<History> list = videoDao.getAllVideoHistory(map);
		int flag1 = 0;
		if(list.size() > 0){
			//以前看过这个视频,更新这个视频的最后浏览时间
			History history = new History();
			history.setId(list.get(0).getId());
			flag1 = videoDao.updateVideoHistory(history);
		}else{
			//以前没有看过这个视频
			map.put("v_id", video.getId());
			flag1 = videoDao.addHistory(map);
		}
		
		//更新浏览量
		int flag2 = videoDao.update(video);
		if(flag1 > 0 && flag2 > 0){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public List<Video> getVideoHistory(HashMap<Object, Object> map) {
		
		return videoDao.getVideoHistory(map);
	}

	@Override
	public int updateVideoHistory(History history) {
		// TODO Auto-generated method stub
		return videoDao.updateVideoHistory(history);
	}

	@Override
	public List<History> getAllVideoHistory(HashMap<Object, Object> map) {
		// TODO Auto-generated method stub
		return videoDao.getAllVideoHistory(map);
	}

}
