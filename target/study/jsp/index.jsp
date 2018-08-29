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
	<%@include file="/jsp/header.jsp"%>

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
				<ul>
					<li class="hot_video_list"><span class="layui-badge">1</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"><span class="layui-badge">2</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"><span class="layui-badge">3</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">4</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">5</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">6</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">7</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">8</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">9</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
					<li class="hot_video_list"> <span class="layui-badge layui-bg-gray">10</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: cursive; letter-spacing: 2px; font-size: 16px;"><a href="#" class="show_pointer">Java基础讲解1</a></span></li>
				</ul>
			</div>

			<!-- <div class="layui-container fly-marginTop" style="width: 100%">
				<div class="fly-panel fly-panel-user" pad20>
					<div class="layui-tab layui-tab-brief" lay-filter="user">
						<ul class="layui-tab-title">
							<li class="layui-this" onclick="login()">热播视频</li>
							<li onclick="register()">直播视频</li>
						</ul>
						<div class="layui-form layui-tab-content" id="LAY_ucm"
							style="padding: 20px 0;">
							
							</div>
					</div>
				</div>
			</div> -->

		</div>


		<HR>
		<div id="recommend">
			<blockquote class="layui-elem-quote">实战推荐</blockquote>
			<ul>
				<li style=""><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel01.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel03.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel04.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
			</ul>
		</div>
		<hr>
		<div id="new_arrival">
			<blockquote class="layui-elem-quote">最新上架</blockquote>
			<ul>
				<li style=""><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel01.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel03.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel04.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style=""><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel01.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel03.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel04.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
			</ul>
		</div>
		<hr>
		<div id="skill">
			<blockquote class="layui-elem-quote">技能提升</blockquote>
			<ul>
				<li style=""><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel01.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel03.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel04.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style=""><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel01.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel03.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel04.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
				<li style="margin-left: 20px;"><a href="#"> <img alt=""
						src="${proPath }/images/carousel02.jpg">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">Java基础讲解</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>高级</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:888</span>
						</p>
				</a></li>
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
	</script>
</body>
</html>