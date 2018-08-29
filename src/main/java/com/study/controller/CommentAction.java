package com.study.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.entity.Collection;
import com.study.entity.Comment;
import com.study.entity.Result;
import com.study.entity.User;
import com.study.entity.Video;
import com.study.service.CollectionService;
import com.study.service.CommentService;
import com.study.service.UserService;
import com.study.service.VideoService;

@Controller
@RequestMapping("/comment")
public class CommentAction {

	@Autowired
	private Result result;
	@Autowired
	private CommentService commentService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/add")
	public Result add(@Valid Comment comment, HttpServletRequest request, BindingResult result1) {

		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 未登录
			result.setCode(404);
			result.setMsg("错误的请求");
		} else {
			if (result1.hasErrors()) {
				// 参数不合法
				result.setCode(404);
				result.setMsg("错误的请求");
			} else {
				Comment comment2 = new Comment();
				comment2.setMail(user.getMail());
				comment2.setV_id(comment.getV_id());
				comment2.setContent(comment.getContent());
				
				int add = commentService.add(comment2);
				//刚刚插入这条数据的id
				String id = comment2.getId();
				if (add > 0) {
					HashMap<Object, Object> map = new HashMap<>();
					map.put("mail", user.getMail());
					List<User> list = userService.getUser(map);
					//此时楼层数
					map.remove("mail");
					map.put("limit", 0);
					map.put("v_id", comment.getV_id());
					List<Comment> list2 = commentService.get(map);
					result.setCount(list2.size());
					//评论的时间
					HashMap<Object, Object> map2 = new HashMap<>();
					map2.put("id", id);
					map2.put("limit", 0);
					List<Comment> list3 = commentService.get(map2);
					result.setData1(list3.get(0).getComment_time());
					result.setData(list.get(0));
					result.setCode(200);
					result.setMsg("评论成功!");
				} else {
					result.setCode(404);
					result.setMsg("评论失败!");
				}
			}

		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Result delete(String id, HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user == null){
			result.setCode(404);
		}else{
			int flag = commentService.delete(id);
			if(flag > 0){
				result.setCode(200);
			}else{
				result.setCode(404);
			}
		}
		result.setCount(0);
		result.setMsg(null);
		result.setData(null);
		return result;
	}

}
