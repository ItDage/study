<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script type="text/javascript" src="${proPath }/layui/layui.js"></script>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<style type="text/css">
body {
	width: 1200px;
	background-color: #dddddd;
	margin: auto;
}

#container {
	width: 1200px;
	margin: auto;
}

#recommend ul li {
	background-color: #F0F0F0;
	border-radius: 10px;
	width: 223px;
	height: 195px;
	float: left;
}

#recommend ul li a:hover {
	color: red;
}

#recommend {
	clear: both;
}

#recommend ul li img {
	width: 223px;
	height: 140px;
	border-radius: 10px;
}

#new_arrival ul li {
	background-color: #F0F0F0;
	border-radius: 10px;
	width: 223px;
	height: 195px;
	float: left;
	margin-top: 13px;
}

#new_arrival ul li a:hover {
	color: red;
}

#new_arrival ul li img {
	width: 223px;
	height: 140px;
	border-radius: 10px;
}

#skill ul li {
	background-color: #F0F0F0;
	border-radius: 10px;
	width: 223px;
	height: 195px;
	float: left;
	margin-top: 13px;
}

#skill ul li a:hover {
	color: red;
}

#skill ul li img {
	width: 223px;
	height: 140px;
	border-radius: 10px;
}

#container_first_left {
	margin-top: 10px;
	width: 70%;
	float: left;
}

#container_first_right {
	margin-top: 10px;
	margin-left: 2%;
	width: 27%;
	float: left;
}
.hot_video_list{
	margin-top:15px;
	margin-left: 20px;
}
a.show_pointer:hover{
	cursor: pointer;
	color:#009688;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>

	<div id="container">
		<div id="container_first_left">
			<!-- 轮播 -->
			<div class="layui-carousel" id="test1">
				<div carousel-item>
					<div>
						<img alt="图片不见了" src="${proPath }/images/carousel01.jpg"
							width="100%" height="400px">
					</div>
					<div>
						<img alt="图片不见了" src="${proPath }/images/carousel02.jpg"
							width="100%" height="400px">
					</div>
					<div>
						<img alt="图片不见了" src="${proPath }/images/carousel03.jpg"
							width="100%" height="400px">
					</div>
					<div>
						<img alt="图片不见了" src="${proPath }/images/carousel04.jpg"
							width="100%" height="400px">
					</div>
				</div>
			</div>
		</div>
		<div id="container_first_right">
			<p style="font-weight: bold;">视频排行</p>
			<hr class="layui-bg-red">
			
			<div>
				<ul id="list_001">
				</ul>
			</div>
		</div>
		
		<HR>
		<div id="recommend">
			<blockquote class="layui-elem-quote">实战推荐</blockquote>
			<ul id="list_002">
			</ul>
		</div>
		<hr>
		<div id="new_arrival">
			<blockquote class="layui-elem-quote">最新上架</blockquote>
			<ul id="list_003">
				
			</ul>
		</div>
		<hr>
		<div id="skill">
			<blockquote class="layui-elem-quote">技能提升</blockquote>
			<ul id="list_004">
				
			</ul>
		</div>

	</div>
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
			$("#test").append("<dd><a href=''>选项t</a></dd>");
			element.init('nav', 'test');
		});
		//轮播
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '100%', //设置容器宽度,
				height : '400px',
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		
		//视频排行
		function fun1(){
			//$("#list_001").empty();
			/* <li class="hot_video_list"><span class="layui-badge">1</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li> */
			$.ajax({
				url : "${proPath}/video/index/getVideoInfo",
				dataType : "json",
				type : "GET",
				async:false,
				success:function(data){
					//绑定视频排行
					$("#list_001").empty();
					for (var i = 0; i < data.data.length; i++) {
						if(i < 3){
							$("#list_001").append("<li class='hot_video_list'><a href='javascript:play(" + data.data[i].id + ")'><span class='layui-badge'>" + (i+1) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-family: cursive; letter-spacing: 2px; font-size: 16px;'><a href='javascript:play(" + data.data[i].id + ")' class='show_pointer'>" + data.data[i].name + "</a></span></li>");
						}else{
							$("#list_001").append("<li class='hot_video_list'> <span class='layui-badge layui-bg-gray'>" + (i+1) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-family: cursive; letter-spacing: 2px; font-size: 16px;'><a href='javascript:play(" + data.data[i].id + ")' class='show_pointer'>" + data.data[i].name + "</a></span></li>");
						}
					}
					//绑定实战推荐
					$("#list_002").empty();
					for (var i = 0; i < data.data1.length; i++) {
						var level = "";
						if(data.data1[i].level == 0){
							level = "<span style='color: #1E9FFF'>初级</span>";
						}else if(data.data1[i].level == 1){
							level = "<span style='color: #FFB800'>中级</span>";
						}else{
							level = "<span style='color: #FF5722'>高级</span>";
						}
						if(i < 1){
							$("#list_002").append("<li><a href='javascript:play("+data.data1[i].id+")'> <img src='/study_manage/images/" + data.data1[i].image + "'>"
							+" <p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>" + data.data1[i].name + "</p>"
							+" <p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
							+" 	<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;" + level + "&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:"+ data.data1[i].page_view +"</span>"
							+" </p>"
							+" </a></li>");
						}else{
							$("#list_002").append("<li style='margin-left: 20px;'><a href='javascript:play("+data.data1[i].id+")'> <img src='/study_manage/images/" + data.data1[i].image + "'>"
									+" <p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>" + data.data1[i].name + "</p>"
									+" <p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
									+" 	<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;" + level + "&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:"+ data.data1[i].page_view +"</span>"
									+" </p>"
									+" </a></li>");
						}
					}
					//绑定最新上架
					$("#list_003").empty();
					for (var i = 0; i < data.data2.length; i++) {
						var level = "";
						if(data.data2[i].level == 0){
							level = "<span style='color: #1E9FFF'>初级</span>";
						}else if(data.data2[i].level == 1){
							level = "<span style='color: #FFB800'>中级</span>";
						}else{
							level = "<span style='color: #FF5722'>高级</span>";
						}
						if(i == 0 || i == 5){
							$("#list_003").append("<li><a href='javascript:play("+data.data2[i].id+")'> <img src='/study_manage/images/" + data.data2[i].image + "'>"
							+" <p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>" + data.data2[i].name + "</p>"
							+" <p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
							+" 	<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;" + level + "&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:"+ data.data2[i].page_view +"</span>"
							+" </p>"
							+" </a></li>");
						}else{
							$("#list_003").append("<li style='margin-left: 20px;'><a href='javascript:play("+data.data2[i].id+")'> <img src='/study_manage/images/" + data.data2[i].image + "'>"
									+" <p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>" + data.data2[i].name + "</p>"
									+" <p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
									+" 	<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;" + level + "&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:"+ data.data2[i].page_view +"</span>"
									+" </p>"
									+" </a></li>");
						}
					}
					
					//绑定技能提升
					$("#list_004").empty();
					for (var i = 0; i < data.data3.length; i++) {
						var level = "";
						if(data.data3[i].level == 0){
							level = "<span style='color: #1E9FFF'>初级</span>";
						}else if(data.data3[i].level == 1){
							level = "<span style='color: #FFB800'>中级</span>";
						}else{
							level = "<span style='color: #FF5722'>高级</span>";
						}
						if(i == 0 || i == 5){
							$("#list_004").append("<li><a href='javascript:play("+data.data3[i].id+")'> <img src='/study_manage/images/" + data.data3[i].image + "'>"
							+" <p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>" + data.data3[i].name + "</p>"
							+" <p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
							+" 	<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;" + level + "&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:"+ data.data3[i].page_view +"</span>"
							+" </p>"
							+" </a></li>");
						}else{
							$("#list_004").append("<li style='margin-left: 20px;'><a href='javascript:play("+data.data3[i].id+")'> <img src='/study_manage/images/" + data.data3[i].image + "'>"
									+" <p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>" + data.data3[i].name + "</p>"
									+" <p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
									+" 	<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;" + level + "&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:"+ data.data3[i].page_view +"</span>"
									+" </p>"
									+" </a></li>");
						}
					}
				},
				error: function(data){
					alert("error!");
				}
			})
		}
$(function(){
	fun1();
})
function play(id){
	layui.use('layer', function() {
		var layer = layui.layer; //导航的hover效果、二级菜单等功能，需要依赖element模块
	$.ajax({
		url : "${proPath }/user/validLogin",//请求的URL
		dataType : "json",//返回的类型
		type : "GET",//请求的类型,GET或者POST
		//data : {"id" : id},//请求携带的数据
		contentType: "application/json",//请求数据类型
		success : function(data) {//请求成功的数据
			if (data.code == 200) {
				//成功,页面跳转到主页,此时主页中信息已经改变
				window.open('${proPath}/video/play?id=' + id);
			}else{
				layer.msg('请先登录再观看视频!');
			}
		},
		error : function(data, type, err) {//该接口出错是执行的方法
				console.log("ajax错误类型："+type);
				console.log(err); 
			}
		});
	});
}
	</script>
</body>
</html>