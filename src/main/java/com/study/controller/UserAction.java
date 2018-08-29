package com.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.entity.Result;
import com.study.entity.User;
import com.study.service.UserService;
import com.study.util.SendEmailUtil;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Autowired
	private Result result;

	@Autowired
	private UserService userService;

	/**
	 * 登录接口
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Result login(@RequestBody User user, HttpServletRequest request) {
		HashMap<Object, Object> map = new HashMap<>();
		map.put("mail", user.getMail());
		map.put("password", user.getPassword());
		List<User> list = userService.getUser(map);
		if (list.size() > 0) {
			// 登录成功
			User user2 = list.get(0);
			if(user2.getState() == 1){
				//未通过邮箱验证激活
				result.setCode(404);
				result.setMsg("此账号未激活!");
			}else{
				if(user2.getLock_state() == 1){
					//账号锁定
					result.setCode(404);
					result.setMsg("此账号已被锁定,请联系管理员!");
				}else{
					request.getSession().setAttribute("user", list.get(0));
					result.setCode(200);
					result.setMsg("登录成功!");
				}
			}
		} else {
			result.setCode(404);
			result.setMsg("用户名或密码不正确!");
		}

		return result;
	}

	/**
	 * 注册接口
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public Result register(@Valid @RequestBody User user, BindingResult br, HttpServletRequest request) {
		HashMap<Object, Object> map = new HashMap<>();
		if (br.hasErrors()) {
			// 参数不合法
			List<ObjectError> allErrors = br.getAllErrors();
			for (ObjectError objectError : allErrors) {
				System.out.println(objectError.getDefaultMessage());
				result.setMsg(objectError.getDefaultMessage());
			}
			result.setCode(404);
		} else {
			// 防止绕过前端强行注册
			map.put("mail", user.getMail());
			List<User> list = userService.getUser(map);
			if (list.size() > 0) {
				result.setMsg("此邮箱已注册!");
				result.setCode(404);
			} else {
				// 随机选一张默认的头像 register_0.jpg --->register_7.jpg
				Random random = new Random();
				int nextInt = random.nextInt(8);
				user.setImage("register_" + nextInt + ".jpg");
				int flag = userService.add(user, request);
				if (flag == 1) {
					// 注册成功
					result.setMsg("注册成功,去邮箱激活吧!");
					result.setCode(200);
				} else if (flag == 2) {
					// 邮件发送出现异常
					result.setMsg("邮箱地址不正确!");
					result.setCode(404);
				} else {
					result.setMsg("注册失败!");
					result.setCode(404);
				}
			}
		}
		return result;
	}
	
	
	/**
	 * 验证用户是否登录的接口
	 * @param id
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/validLogin")
	public Result play(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user == null){
			//未登录,不可以观看视频
			result.setCode(404);
			result.setMsg("未登录!");
			result.setData(null);
		}else{
			//已经登录,可以看视频
			result.setCode(200);
			result.setMsg("已登录!");
			result.setData(null);
		}
		return result;
	}
	
	/**
	 * 退出登录的接口
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logOut(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		
		return "redirect:/index.jsp";
	}
	
	
	/**
	 * 邮箱激活的接口
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/activeMail", method = RequestMethod.GET)
	public String activeMail(String id) {

		if (id == null || "".equals(id)) {
			return "redirect:/index.jsp";
		} else {
			int activeMail = userService.activeMail(id);
			if (activeMail > 0) {
				return "redirect:/index.jsp";
			}
		}
		return null;
	}
	
	
	/**
	 * 修改数据
	 * @param video
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public Result update(@RequestBody User user, HttpServletRequest request){
		User user2 = (User)request.getSession().getAttribute("user");
		if(user2 == null){
			//未登录
			result.setCode(404);
			result.setMsg("错误的请求!");
			result.setData(null);
			result.setCount(0);
		}else{
			User user3 = new User();
			user3.setMail(user2.getMail());
			user3.setAge(user.getAge());
			user3.setGender(user.getGender());
			user3.setImage(user.getImage());
			user3.setPassword(user.getPassword());
			user3.setTel(user.getTel());
			user3.setUsername(user.getUsername());
			int update = userService.update(user3);
			if(update > 0){
				result.setCode(200);
				result.setMsg("修改成功!");
			}else{
				result.setCode(404);
				result.setMsg("修改失败!");
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/userInfo")
	public String userInfo(HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		if (user != null) {
			// 底层sql传为null可以获得所有数据
			HashMap<Object, Object> map = new HashMap<>();
			map.put("mail", user.getMail());
			List<User> list = userService.getUser(map);
			request.setAttribute("user", list.get(0));
		} else {
			return "redirect:/index.jsp";
		}
		return "/userinfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getEmailValidCode", method = RequestMethod.POST)
	public Result emailValidCode(String username, String mail, HttpServletRequest request){
		try{
		if(mail==null || "".equals(mail)){
			result.setMsg("参数不合法");
			result.setCode(0);
		}else{
			User user = new User();
			HashMap<Object, Object> map = new HashMap<>();
			map.put("mail", mail);
			List<User> list = userService.getUser(map);
			if(list.size() > 0){
				Random random = new Random();
				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < 6; i++) {
					int nextInt = random.nextInt(6);
					sb.append(String.valueOf(nextInt));
				}
				String validCode = sb.toString();
				SendEmailUtil.sendSimpleMail(mail, "您的验证码为:"+validCode + ",此验证码5分钟内有效。", "验证码");
				HttpSession session = request.getSession();
				//单位为秒
				session.setMaxInactiveInterval(300);
				session.setAttribute("emailValidCode", sb.toString());
				session.setAttribute("email_username", username);
				result.setMsg("验证码已经发到您邮箱,请注意查收!");
				result.setCode(1);
			}else{
				//用户名和邮箱不匹配
				result.setMsg("用户名和邮箱不匹配!");
				result.setCode(0);
			}
			
		}
		}catch(Exception e){
			e.printStackTrace();
			result.setMsg("参数不合法");
			result.setCode(0);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/validEmailCode", method = RequestMethod.GET)
	public Result validEmailCode(String code, HttpServletRequest request){
		if(code==null || "".equals(code)){
			result.setMsg("参数不合法");
			result.setCode(0);
		}else{
			HttpSession session = request.getSession();
			String serverCode = (String)session.getAttribute("emailValidCode");
			if(serverCode.equals(code)){
				result.setMsg("验证码正确!");
				result.setCode(1);
			}else{
				result.setMsg("验证码不正确!");
				result.setCode(0);
			}
		}
		return result;
	}
}
