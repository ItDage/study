<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息</title>
<script type="text/javascript" src="${proPath }/layui/layui.js"></script>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<style type="text/css">
body {
	width: 1200px;
	background-color: white;
	margin: auto;
}

#top{
	width: auto;
	height: 200px;
	background-image:url(../images/bg1.jpg);
	background-size:1200px 200px;
	background-repeat:no-repeat;
}

#top table tr td{
	padding-left: 50px;
}

#left {
	width: 70%;
	float: left;
}
#right {
	width: 30%;
	height: 300px;
	float: left;
	background-color: #f2f2f2;
}

a.change_color:hover {
	color: red;
}

.courseInfo li{
	float:left;
	margin-top:10px;
	margin-left:30px;
}

.li_length{
	width: 60px;
}
</style>
</head>
<body>
	<div id="top">
		<p style="color: white; font-size: 28px; padding-top: 40px; padding-left: 100px;">Java基础讲解</p>
		<div>
			<p style="text-align: left; color: white; margin-top: 10px; padding-left: 100px;">简介:Java基础是学习Java必学的,学完可以做在线考试系统</p>
		</div>
		<div>
			<ul style="color: white; margin-top: 10px;" class="courseInfo">
				<li class="study_numbers li_length" style="margin-left: 100px;">学习人数</li>
				<li>|</li>
				<li class="li_length">难度级别</li>
				<li>|</li>
				<li class="li_length">章节总数</li>
			</ul>
		</div>
		<div>
			<ul style="color: white; clear: both;" class="courseInfo">
				<li class="study_numbers li_length" style="margin-left: 100px;">1888</li>
				<li>|</li>
				<li class="li_length">初级</li>
				<li>|</li>
				<li class="li_length">5章</li>
			</ul>
		</div>
	</div>

	<div id="left">
		<div>
			<p style="font-size: 18px; font-weight: bold; margin-top: 20px;"><a href="" class="change_color">章节</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="change_color">评论</a></p>
			<hr class="layui-bg-green">
		</div>
		<!-- 内容 -->
		<div>
			<div style="margin-top: 20px;">
			<span style="padding-left: 30px; padding-top: 20px; font-size: 16px; font-weight: bold;">第一章: Java简介</span>
				<ul>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-1 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-2 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-3 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-4 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-5 环境的安装</a></li>
				</ul>
			</div>
			<div style="margin-top: 20px;">
			<span style="padding-left: 30px; padding-top: 20px; font-size: 16px; font-weight: bold;">第二章: 第一个Java程序</span>
				<ul>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-1 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-2 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-3 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-4 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-5 环境的安装</a></li>
				</ul>
			</div>
			<div style="margin-top: 20px;">
			<span style="padding-left: 30px; padding-top: 20px; font-size: 16px; font-weight: bold;">第三章: 标识符和数据类型</span>
				<ul>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-1 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-2 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-3 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-4 环境的安装</a></li>
					<li style="padding-left: 60px; padding-top: 10px;"><a href="#" class="change_color">1-5 环境的安装</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="right">
		<div>
			<p style="font-size: 18px; font-weight: bold; margin-top: 20px; text-align: center;">讲师简介</p>
			<hr class="layui-bg-red" width="80%" style="margin: auto; margin-top: 10px;">
		</div>
		<div>
			<table align="center" style="margin-top:15px;">
				<tr>
					<td rowspan="2"><img alt="" src="${proPath }/images/user/register_0.jpg" width="50px" height="50px" style="border-radius:25px;"></td>
					<td style="padding-left: 10px; font-weight: bold;">Sun</td>
				</tr>
				<tr>
					<td style="padding-left: 10px; color: #c2c2c2;">Java开发工程师</td>
				</tr>
			</table>
			<div style="margin-top:20px;">
				<p style="text-indent:25px; line-height: 25px;">精通Java、C、C++等主流开发语言，5年以上开发经验，非常丰富的IT从业经验和教育心得，金牌JAVA讲师，曾担任**课程总监级讲师。</p>
			</div>
		</div>
		
		<!-- 讲师寄语 -->
		<!-- <div>
			<p style="font-size: 18px; font-weight: bold; margin-top: 20px; text-align: center;">讲师寄语</p>
			<hr class="layui-bg-red" width="80%" style="margin: auto; margin-top: 10px;">
		</div>
		<div>
			<div style="margin-top:20px;">
				<p style="text-indent:25px; line-height: 25px;">精通Java、C、C++等主流开发语言，5年以上开发经验，非常丰富的IT从业经验和教育心得，金牌JAVA讲师，曾担任**课程总监级讲师。</p>
			</div>
		</div> -->
	</div>

	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
</body>
</html>