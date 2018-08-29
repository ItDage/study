package com.study.controller;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.entity.Collection;
import com.study.entity.Result;
import com.study.entity.User;
import com.study.entity.Video;
import com.study.service.CollectionService;
import com.study.service.VideoService;

@Controller
@RequestMapping("/collection")
public class CollectionAction {

	@Autowired
	private Result result;
	@Autowired
	private CollectionService collectionService;
	@Autowired
	private VideoService videoService;

	@ResponseBody
	@RequestMapping("/add")
	public Result add(Collection coll, HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user == null){
			//未登录
			result.setCode(404);
			result.setMsg("错误的请求");
		}else{
			Collection collection = new Collection();
			collection.setMail(user.getMail());
			collection.setV_id(coll.getV_id());
			int add = collectionService.add(collection);
			if(add > 0){
				result.setCode(200);
				result.setMsg("收藏视频成功!");
			}else{
				result.setCode(404);
				result.setMsg("收藏视频失败!");
			}
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Result delete(Collection coll, HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user == null){
			//未登录
			result.setCode(404);
			result.setMsg("错误的请求");
		}else{
			Collection collection = new Collection();
			collection.setMail(user.getMail());
			collection.setV_id(coll.getV_id());
			int add = collectionService.delete(collection);
			if(add > 0){
				result.setCode(200);
				result.setMsg("取消收藏该视频成功!");
			}else{
				result.setCode(404);
				result.setMsg("取消收藏该视频失败!");
			}
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/getCollection")
	public Result scanHistory(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if(user.getMail() != null){
			HashMap<Object, Object> map = new HashMap<>();
			List<Collection> list2 = collectionService.get(map);
			HashMap<Object, Object> map2 = new HashMap<>();
			map2.put("mail", user.getMail());
			String limit = request.getParameter("limit");
			String page = request.getParameter("page_no");
			//获取分页数据
			Integer page_no = Integer.valueOf(page);
			page_no = (page_no - 1) * 10;
			map2.put("page_no", page_no);
			map2.put("limit", Integer.valueOf(limit));
			List<Video> list = collectionService.getCollection(map2);
			result.setCode(200);
			result.setCount(list2.size());
			result.setData(list);
		}
		
		return result;
	}
}
