<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类列表</title>
<style type="text/css">
body {
	width: 1200px;
	background-color: #dddddd;
	margin: auto;
}

#top{
	width: 1200px;
	height: 150px;
	background-color: #F0F0F0;
	margin-top: 0px;
}

.classify_bar {
	padding-top: 30px;
	padding-left: 2%;
}

.sec_classify {
	float: left;
}

.category li {
	float: left;
	padding-top: 3px;
	padding-left: 30px;
}

a.change_color:hover {
	color: red;
}

.lx{
	padding-top: 10px;
}
#content .condition{
	padding-top: 20px;
	padding-left: 2%;
}

#new_arrival ul li {
	background-color: #F0F0F0;
	border-radius: 10px;
	width: 210px;
	height: 195px;
	float: left;
	margin-top: 13px;
	margin-left:2%;
}

#new_arrival ul li a:hover {
	color: red;
}

#new_arrival ul li img {
	width: 210px;
	height: 140px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%@include file="/jsp/header.jsp"%>
	<div id="top">
		<div class="classify_bar">
			<span style="font-weight: bold; font-size: 15px;"
				class="sec_classify">分类:</span>
			<div>
				<ul class="category">
					<c:forEach var="sec_nav" items="${requestScope.second }">
						<li><a href="#" class="change_color">${sec_nav.name }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div style="clear: both;">
			<hr class="layui-bg-green" style="margin-top: 40px">
		</div>
		<div class="classify_bar lx">
			<span style="font-weight: bold; font-size: 15px;"
				class="sec_classify">类型:</span>
			<div>
				<ul class="category">
					<li><a href="#" class="change_color">初级</a></li>
					<li><a href="#" class="change_color">中级</a></li>
					<li><a href="#" class="change_color">高级</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 视频列表 -->
	<div id="content">
		<div class="condition">
			<p><a href="#" class="change_color">最新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="change_color">最热</a></p>
		</div>
		
		<div id="new_arrival">
			<ul>
				<c:forEach var="video" items="${requestScope.videoList }">
					<li style=""><a onclick="showVideo('${video.src}')"> <img alt=""
						src="${proPath }/images/user/${video.image}">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">${video.name }</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${video.level == 0 }">
									<span>初级</span>
								</c:if>
								<c:if test="${video.level == 1 }">
									<span>中级</span>
								</c:if>
								<c:if test="${video.level == 2 }">
									<span>高级</span>
								</c:if>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>浏览量:${video.page_view }</span>
						</p>
				</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div style="clear:both; text-align: center;">
			<div id="demo7"></div>
	</div>
<button onclick="test()">test</button>	
<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  
  //完整功能
  laypage.render({
    elem: 'demo7'
    ,count: 100
    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
    ,jump: function(obj){
      console.log(obj)
    }
  });
});

function test(){
	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
		  layer.open({
			  type: 2,
			  title: false,
			  area: ['630px', '360px'],
			  shade: 0.8,
			  closeBtn: 0,
			  shadeClose: true,
			  content: '${proPath }/videos/1517469127236.mp4'
			});
	});
}

function showVideo(src){
	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
		  layer.open({
			  type: 2,
			  title: false,
			  area: ['630px', '360px'],
			  shade: 0.8,
			  closeBtn: 0,
			  shadeClose: true,
			  content: 'localhost:8888/study_manage/videos/1517469127236.mp4'
			});
	});
}
</script>
</body>
</html>