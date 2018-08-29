<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript" src="${proPath }/layui/layui.js"></script>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<style type="text/css">
a.changecursor:hover{
	cursor:pointer!important;
}
</style>
<body class="layui-bg-gray" style="align: center; margin: auto">
	<div class="layui-container fly-marginTop">
		<div class="fly-panel fly-panel-user" pad20>
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title">
					<li class="layui-this" onclick="login()" id="login">登录</li>
					<li onclick="register()" id="register">注册</li>
				</ul>
				<div class="layui-form layui-tab-content" id="LAY_ucm"
					style="padding: 20px 0;"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//初始化时加载登录模块
		$(function() {
			login();
		});
		
		//监听数据提交,包括登录,注册,忘记密码
		layui.use(['form','layer'], function(){
			  var form = layui.form;
			  var layer = layui.layer;
			  //监听登录模块
			  form.on('submit(login)', function(data){
				  var submitData = JSON.stringify(data.field);
				  $.ajax({
						url : "${proPath}/user/login",//请求的URL
						dataType : "json",//返回的类型
						type : "POST",//请求的类型,GET或者POST
						data : submitData,//请求携带的数据
						contentType: "application/json",//请求数据类型
						success : function(data) {//请求成功的数据
							if (data.code == 200) {
								//成功,页面跳转到主页,此时主页中信息已经改变
								window.parent.location.href='${proPath}/index.jsp';
							}else{
								layer.msg(data.msg);
							}
						},
						error : function(data, type, err) {//该接口出错是执行的方法
								console.log("ajax错误类型："+type);
								console.log(err); 
							}
						});
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			  
			  //注册模块
			  form.on('submit(register)', function(data){
				  $.ajax({
						url : "${proPath}/user/register",
						dataType : "json",
						type : "POST",
						contentType: "application/json",
						data : JSON.stringify(data.field),
						success : function(data) {
							var layerparent = window.parent.layer || layui.layer;
							if (data.code == 200) {
								layerparent.msg(data.msg, {icon: 1});
							}else{
								//不合法
								layerparent.msg(data.msg, {icon: 2});
							}
						},
						error : function(data, type, err) {
								console.log("ajax错误类型："+type);
								console.log(err); 
							}
						});
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			  //向邮箱发送验证码
			  form.on('submit(forget1)', function(data){
				  var mail = $("#mail").val();
				  $.ajax({
						url : "${proPath}/user/getEmailValidCode",
						dataType : "json",
						type : "POST",
						data : {"mail":mail},
						async: false,
						success : function(data) {
							if (data.state == 1) {
								layer.msg(data.message);
								forget2();
							}else{
								//不合法
								layer.msg(data.message, {icon: 2});
							}
						},
						error : function(data, type, err) {
								console.log("ajax错误类型："+type);
								console.log(err); 
							}
						});
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			  
			  form.on('submit(forget2)', function(data){
				  var emailvalidcode = $("#emailvalidcode").val();
				  $.ajax({
						url : "${proPath}/user/validEmailCode",
						dataType : "json",
						type : "GET",
						data : {"code":emailvalidcode},
						async: false,
						success : function(data) {
							if (data.state == 1) {
								//layer.msg(data.message);
								modifyPassword();
							}else{
								//验证码不正确
								layer.msg(data.message, {icon: 2});
							}
						},
						error : function(data, type, err) {
								console.log("ajax错误类型："+type);
								console.log(err); 
							}
						});
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			  
			  //验证
			  form.verify({
					user : function(value) {
						if (value.length <= 0) {
							return '账号不能为空!';
						}else if(value.length > 18){
							return '账号不合法!';
						} else {
							var check = validateUsername(value);
							if (check == 1) {
								//用户已经存在
								return '用户已存在!';
							}
						}
					},
					password : [ /(.+){6,12}$/, '密码必须6到12位' ],
					confrim_pass : function(value) {
						var passvalue = $("#password").val();
						if (passvalue != value) {
							return '两次密码不一致!';
						}
					}
				});
			});

		function forget() {
			$("#LAY_ucm").empty();
			$("#LAY_ucm")
					.append(
							"<div class='layui-tab-item layui-show'>"
									+ "<div class='layui-form layui-form-pane'>"
									+ "<form>"
									
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_email' class='layui-form-label'>邮箱</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='text' id='mail' placeholder='请输入邮箱地址' name='mail' required lay-verify='email' autocomplete='off' class='layui-input'>"
									+ "</div></div>"
									+ "  <div class='layui-form-item'><br>"
									
									+ "  <div class='layui-form-item' style='align:center;'>"
									+ "    <button class='layui-btn' id='forget1' lay-filter='forget1' lay-submit>下一步</button>"
									+ "  </div>"
									+ " </div>");
		}
		
		function forget2(){
			$("#LAY_ucm").empty();
			$("#LAY_ucm")
					.append(
							"<div class='layui-tab-item layui-show'>"
									+ "<div class='layui-form layui-form-pane'>"
									+ "<form>"
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_email' class='layui-form-label'>验证码</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='text' id='emailvalidcode' placeholder='请输入验证码' name='code' required autocomplete='off' class='layui-input'>"
									+ "</div>"
									+ "</div>"
									+ "  <div class='layui-form-item'><br>"
									
									+ "  <div class='layui-form-item' style='align:center;'>"
									+ "    <button class='layui-btn' id='forget2' lay-filter='forget2' lay-submit>下一步</button>"
									+ "  </div>"
									+ " </div>");
		}
		
		function validateUsername(username){
			var check = 0;
			 $.ajax({
					url : "${proPath}/user/get",//这是注释   请求Java的路径,就是地址栏的路径
					dataType : "json",//返回数据的格式  ---json
					type : "GET",//请求的方式,两种  get和post
					data : {"username":username},//请求后台携带的参数
					async : false,//是否异步请求
					success : function(data) {//请求成功时的操作
						if (data.state == 1) {
							//不存在此用户
							check = 1;
						}else{
							check = 0;
						}
					},
					error : function(data, type, err) {//请求失败时的操作
							console.log("ajax错误类型："+type);
							console.log(err); 
						}
					});
			 return check;
		}
		
		
		//登录模块动态添加
		function login() {
			$("#LAY_ucm").empty();
			$("#LAY_ucm")
					.append(
							"<div class='layui-tab-item layui-show'>"
									+ "<div class='layui-form layui-form-pane'>"
									+ "<form>"
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_email' class='layui-form-label'>邮箱</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='text' name='mail' required lay-verify='email' placeholder='请输入正确的邮箱地址' autocomplete='off' class='layui-input'>"
									+ "</div>"
									+ "</div>"
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_pass' class='layui-form-label'>密码</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='password' name='password' required lay-verify='password' placeholder='请输入至少6位数密码' autocomplete='off' class='layui-input'>"
									+ "    </div>"
									+ "  </div>"
									+ "  <div class='layui-form-item'>"
									
									+ "  <div class='layui-form-item' style='align:center; margin:0 0 0 70px;'>"
									+ "    <button class='layui-btn' id='login' lay-filter='login' lay-submit>立即登录</button>"
									+ "    <span style='padding-left:20px;'>"
									+ "      <a class='changecursor' onclick='forget()'>忘记密码？</a>"
									+ "    </span>"
									+ "  </div>"
									+ " </div>"
									+ " <div class='layui-form-item fly-form-app'>"
								
									+ " </div>");
			//改变登录和注册的选中状态
			$("#register").removeClass("layui-this");
			$("#login").addClass("layui-this");
		}
		//注册模块
		function register() {
			$("#LAY_ucm").empty();
			$("#LAY_ucm")
					.append(
							"<div class='layui-tab-item layui-show'>"
									+ "<div class='layui-form layui-form-pane'>"
									+ "<form>"
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_email' class='layui-form-label'>邮箱</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='text' id='email' name='mail' required lay-verify='email' placeholder='请输入正确的邮箱地址' autocomplete='off' class='layui-input'>"
									+ "</div>"
									+ "</div>"
									
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_email' class='layui-form-label'>昵称</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='text' name='username' required lay-verify='required' placeholder='请输入昵称' autocomplete='off' class='layui-input'>"
									+ "</div>"
									+ "</div>"
									
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_email' class='layui-form-label'>密码</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='password' id='password' name='password' placeholder='请输入至少6位数密码' required lay-verify='password' autocomplete='off' class='layui-input'>"
									+ "</div>"
									+ "</div>"
									+ "<div class='layui-form-item'>"
									+ "    <label for='L_pass' class='layui-form-label'>确认密码</label>"
									+ "    <div class='layui-input-inline'>"
									+ "      <input type='password' id='confirm_password' name='confirm_password' placeholder='请确认密码' required lay-verify='confrim_pass' autocomplete='off' class='layui-input'>"
									+ "    </div>"
									+ "  </div>"
									+ "  <div class='layui-form-item' style='align:center; margin:0 0 0 70px;'>"
									+ "    <button class='layui-btn' id='login' lay-filter='register' lay-submit>注册</button>"
									+"     <button type='reset' class='layui-btn layui-btn-primary'>重置</button>"
									+ "  </div>"
									+ " </div>");
			//改变登录和注册的选中状态
			$("#login").removeClass("layui-this");
			$("#register").addClass("layui-this");
		}
	</script>
</body>
</html>