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

a.show_pointer:hover{
	cursor: pointer;
	color:#009688;
}

a.change_color:hover {
	color: red;
}

.lx{
	padding-top: 10px;
}

#content{
	width: auto;
	height: 470px;
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
	<%@include file="/header.jsp"%>
	<div id="top">
		<div class="classify_bar">
			<span style="font-weight: bold; font-size: 15px;"
				class="sec_classify">分类:</span>
			<div>
				<ul class="category">
					<c:forEach var="sec_nav" items="${requestScope.second }">
						<li><a onclick="getVideoListBySecNav('${sec_nav.name }')" class="change_color show_pointer">${sec_nav.name }</a></li>
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
					<li><a href='javascript:getVideoListByLevel(0)' class="change_color show_pointer show_active">初级</a></li>
					<li><a href='javascript:getVideoListByLevel(1)' class="change_color show_pointer show_active">中级</a></li>
					<li><a href='javascript:getVideoListByLevel(2)' class="change_color show_pointer show_active">高级</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 视频列表 -->
	<div id="content">
		<div class="condition">
			<p><a href="javascript:getVideoListByType(1)" class="change_color show_pointer show_active">最新</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:getVideoListByType(2)" class="change_color show_pointer show_active">最热</a></p>
		</div>
		
		<div id="new_arrival">
			<ul id="videoList">
				<c:forEach var="video" items="${requestScope.videoList }">
					<li style=""><a href="javascript:play(${video.id })"> <img
						src="/study_manage/images/${video.image}">
						<p style="margin-left: 15px; margin-top: 6px; font-size: 17px;">${video.name }</p>
						<p style="margin-left: 15px; margin-top: 6px; color: #009688">
							<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${video.level == 0 }">
									<span style='color: #1E9FFF'>初级</span>
								</c:if>
								<c:if test="${video.level == 1 }">
									<span style='color: #FFB800'>中级</span>
								</c:if>
								<c:if test="${video.level == 2 }">
									<span style='color: #FF5722'>高级</span>
								</c:if>
							&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:${video.page_view }</span>
						</p>
				</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div style="clear:both; text-align: center;">
			<div id="demo7"></div>
	</div>
	
	<input type="hidden" value="${requestScope.first_nav_name }" id="first_nav_name">
	<input type="hidden" value="${requestScope.videoCount }" id="videoCount">
	
	<!-- 保存当前点击的导航 -->
	<input type="hidden" id = "second_nav_name">
	<input type="hidden" id = "level">
	<input type="hidden" id = "type">
<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  var count = $("#videoCount").val();
  
  //完整功能
  laypage.render({
     elem: 'demo7'
    ,count: count
    ,layout: ['count', 'prev', 'page', 'next', 'skip']
    	,jump: function(obj, first){
		    //首次不执行
		    var first_nav_name = $("#first_nav_name").val();
		    if(!first){
		    	$("#videoList").empty();
		    	$.ajax({
		    		url : "${proPath }/course/pageSelect?time=" + new Date(),//请求的URL
		    		dataType : "json",//返回的类型
		    		type : "GET",//请求的类型,GET或者POST
		    		data : {"page_no" : obj.curr, "first_nav_name" : first_nav_name},//请求携带的数据
		    		contentType: "application/json",//请求数据类型
		    		success : function(data) {//请求成功的数据
		    			if (data.code == 200) {
		    				//成功
		    				for (var i = 0; i < data.data.length; i++) {
		    					$("#videoList").append();
		    					var level = null;
		    					if(data.data[i].level == 0){
		    						level = "<span style='color: #1E9FFF'>初级</span>";
		    					}else if(data.data[i].level == 1){
		    						level = "<span style='color: #FFB800'>中级</span>";
		    					}else{
		    						level = "<span style='color: #FF5722'>高级</span>";
		    					}
		    					$("#videoList").append("<li><a href='javascript:play("+data.data[i].id+")'>"
		    		    				+ "<img src='/study_manage/images/"+data.data[i].image+"'>"
		    		    				+ "<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
		    		    				+ "<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
		    		    				+ "<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
		    		    				+ "<span>"+level+"</span>"
		    		    				+ "&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
		    		    				+ "</p>"
		    		    				+ "</a></li>");
							}
		    			
		    			}else{
		    				layer.msg('获取视频列表失败!');
		    			}
		    		},
		    		error : function(data, type, err) {//该接口出错是执行的方法
		    				console.log("ajax错误类型："+type);
		    				console.log(err); 
		    			}
		    		});
		    }
		  }
});
});

function play(id){
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
}
function showVideo(src, name){
	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
		  layer.open({
			  type: 2,
			  title: name,
			  area: ['630px', '360px'],
			  shade: 0.8,
			  maxmin: true,
			  closeBtn: 1,
			  shadeClose: true,
			  content: '/study_manage/videos/' + src  //必须加上http
			});
	});
}

function getVideoListByLevel(level2){
	var first_nav_name = $("#first_nav_name").val();
	var second_nav_name = $("#second_nav_name").val();
	//设置新的值
	$("#level").val(level2);
	$.ajax({
		url:"${proPath}/course/getVideoListByParam?time=" + new Date(),
		type:"POST",
		dataType:"json",
		data: {"first_nav_name" : first_nav_name, "second_nav_name": second_nav_name, "level" : level2, "page_no" : 1},
		success:function(data){
			if(data.code == 200){
				//alert(data.code);
				$("#videoList").empty();
				for (var i = 0; i < data.data.length; i++) {
					var levelStr = null;
					if(data.data[i].level == 0){
						level = "<span style='color: #1E9FFF'>初级</span>";
					}else if(data.data[i].level == 1){
						level = "<span style='color: #FFB800'>中级</span>";
					}else{
						level = "<span style='color: #FF5722'>高级</span>";
					}
					$("#videoList").append("<li style=''><a href='javascript:play(" + data.data[i].id + ")'>"
						+"<img src='/study_manage/images/"+data.data[i].image+"'>"
						+"<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
						+"<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
						+"<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
						+ level
						+"&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
						+"</p>"
						+"</a></li>");
				}
				//重新分页
				layui.use(['laypage', 'layer'], function(){
					  var laypage = layui.laypage
					  ,layer = layui.layer;
					  count = data.count;
					  //完整功能
					  laypage.render({
					    elem: 'demo7'
					    ,count: count
					    ,layout: ['count', 'prev', 'page', 'next', 'skip']
					    ,jump: function(obj, first){
					    	if(!first){
						    	$("#videoList").empty();
						    	$.ajax({
						    		url : "${proPath }/course/pageSelect2?time=" + new Date(),//请求的URL
						    		dataType : "json",//返回的类型
						    		type : "GET",//请求的类型,GET或者POST
						    		data : {"page_no" : obj.curr, "second_nav_name" : second_nav_name, "first_nav_name" : first_nav_name, "level" : level2},//请求携带的数据
						    		contentType: "application/json",//请求数据类型
						    		success : function(data) {//请求成功的数据
						    			if (data.code == 200) {
						    				//成功
						    				for (var i = 0; i < data.data.length; i++) {
						    					var level = null;
						    					if(data.data[i].level == 0){
						    						level = "<span style='color: #1E9FFF'>初级</span>";
						    					}else if(data.data[i].level == 1){
						    						level = "<span style='color: #FFB800'>中级</span>";
						    					}else{
						    						level = "<span style='color: #FF5722'>高级</span>";
						    					}
						    					$("#videoList").append("<li><a href='javascript:play("+data.data[i].id+")'>"
						    		    				+ "<img src='/study_manage/images/"+data.data[i].image+"'>"
						    		    				+ "<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
						    		    				+ "<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
						    		    				+ "<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
						    		    				+ "<span>"+level+"</span>"
						    		    				+ "&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
						    		    				+ "</p>"
						    		    				+ "</a></li>");
											}
						    			
						    			}else{
						    				layer.msg('获取视频列表失败!');
						    			}
						    		},
						    		error : function(data, type, err) {//该接口出错是执行的方法
						    				console.log("ajax错误类型："+type);
						    				console.log(err); 
						    			}
						    		});
						    }
					    }
					  });
					});
			}else{
				layer.msg(data.msg);
			}
		},
		error:function(data){
			layer.msg("获取视频列表失败!");
		}
	});
	
}

function getVideoListByType(type){
	var first_nav_name = $("#first_nav_name").val();
	var second_nav_name = $("#second_nav_name").val();
	var level2 = $("#level").val();
	$.ajax({
		url:"${proPath}/course/getVideoListByParam?time=" + new Date(),
		type:"POST",
		dataType:"json",
		data: {"first_nav_name" : first_nav_name, "second_nav_name": second_nav_name, "level" : level2, "page_no" : 1, "type" : type},
		success:function(data){
			if(data.code == 200){
				$("#videoList").empty();
				for (var i = 0; i < data.data.length; i++) {
					var levelStr = null;
					if(data.data[i].level == 0){
						level = "<span style='color: #1E9FFF'>初级</span>";
					}else if(data.data[i].level == 1){
						level = "<span style='color: #FFB800'>中级</span>";
					}else{
						level = "<span style='color: #FF5722'>高级</span>";
					}
					$("#videoList").append("<li style=''><a href='javascript:play(" + data.data[i].id + ")'>"
						+"<img src='/study_manage/images/"+data.data[i].image+"'>"
						+"<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
						+"<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
						+"<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
						+ level
						+"&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
						+"</p>"
						+"</a></li>");
				}
				//重新分页
				layui.use(['laypage', 'layer'], function(){
					  var laypage = layui.laypage
					  ,layer = layui.layer;
					  count = data.count;
					  //完整功能
					  laypage.render({
					    elem: 'demo7'
					    ,count: count
					    ,layout: ['count', 'prev', 'page', 'next', 'skip']
					    ,jump: function(obj, first){
					    	if(!first){
						    	$("#videoList").empty();
						    	$.ajax({
						    		url : "${proPath }/course/pageSelect2?time=" + new Date(),//请求的URL
						    		dataType : "json",//返回的类型
						    		type : "GET",//请求的类型,GET或者POST
						    		data : {"page_no" : obj.curr, "second_nav_name" : second_nav_name, "first_nav_name" : first_nav_name, "level" : level2, "type" : type},//请求携带的数据
						    		contentType: "application/json",//请求数据类型
						    		success : function(data) {//请求成功的数据
						    			if (data.code == 200) {
						    				//成功
						    				for (var i = 0; i < data.data.length; i++) {
						    					var level = null;
						    					if(data.data[i].level == 0){
						    						level = "<span style='color: #1E9FFF'>初级</span>";
						    					}else if(data.data[i].level == 1){
						    						level = "<span style='color: #FFB800'>中级</span>";
						    					}else{
						    						level = "<span style='color: #FF5722'>高级</span>";
						    					}
						    					$("#videoList").append("<li><a href='javascript:play("+data.data[i].id+")'>"
						    		    				+ "<img src='/study_manage/images/"+data.data[i].image+"'>"
						    		    				+ "<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
						    		    				+ "<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
						    		    				+ "<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
						    		    				+ "<span>"+level+"</span>"
						    		    				+ "&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
						    		    				+ "</p>"
						    		    				+ "</a></li>");
											}
						    			
						    			}else{
						    				layer.msg('获取视频列表失败!');
						    			}
						    		},
						    		error : function(data, type, err) {//该接口出错是执行的方法
						    				console.log("ajax错误类型："+type);
						    				console.log(err); 
						    			}
						    		});
						    }
					    }
					  });
					});
			}else{
				layer.msg(data.msg);
			}
		},
		error:function(data){
			layer.msg("获取视频列表失败!");
		}
	});
	
}


function getVideoListBySecNav(second_nav_name){
	//设置新的值
	$("#second_nav_name").val(second_nav_name);
	$.ajax({
		url:"${proPath}/course/getVideoListByParam?time=" + new Date(),
		type:"POST",
		dataType:"json",
		data: {"second_nav_name": second_nav_name, "page_no" : 1},
		success:function(data){
			if(data.code == 200){
				$("#videoList").empty();
				for (var i = 0; i < data.data.length; i++) {
					var levelStr = null;
					if(data.data[i].level == 0){
						level = "<span style='color: #1E9FFF'>初级</span>";
					}else if(data.data[i].level == 1){
						level = "<span style='color: #FFB800'>中级</span>";
					}else{
						level = "<span style='color: #FF5722'>高级</span>";
					}
					$("#videoList").append("<li style=''><a href='javascript:play(" + data.data[i].id + ")'>"
						+"<img src='/study_manage/images/"+data.data[i].image+"'>"
						+"<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
						+"<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
						+"<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
						+ level
						+"&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
						+"</p>"
						+"</a></li>");
				}
				//重新分页
				layui.use(['laypage', 'layer'], function(){
					  var laypage = layui.laypage
					  ,layer = layui.layer;
					  count = data.count;
					  //完整功能
					  laypage.render({
					    elem: 'demo7'
					    ,count: count
					    ,layout: ['count', 'prev', 'page', 'next', 'skip']
					    ,jump: function(obj, first){
					    	if(!first){
						    	$("#videoList").empty();
						    	$.ajax({
						    		url : "${proPath }/course/pageSelect2?time=" + new Date(),//请求的URL
						    		dataType : "json",//返回的类型
						    		type : "GET",//请求的类型,GET或者POST
						    		data : {"page_no" : obj.curr, "second_nav_name" : second_nav_name},//请求携带的数据
						    		contentType: "application/json",//请求数据类型
						    		success : function(data) {//请求成功的数据
						    			if (data.code == 200) {
						    				//成功
						    				for (var i = 0; i < data.data.length; i++) {
						    					$("#videoList").append();
						    					var level = null;
						    					if(data.data[i].level == 0){
						    						level = "<span style='color: #1E9FFF'>初级</span>";
						    					}else if(data.data[i].level == 1){
						    						level = "<span style='color: #FFB800'>中级</span>";
						    					}else{
						    						level = "<span style='color: #FF5722'>高级</span>";
						    					}
						    					$("#videoList").append("<li><a href='javascript:play("+data.data[i].id+")'>"
						    		    				+ "<img src='/study_manage/images/"+data.data[i].image+"'>"
						    		    				+ "<p style='margin-left: 15px; margin-top: 6px; font-size: 17px;'>"+data.data[i].name+"</p>"
						    		    				+ "<p style='margin-left: 15px; margin-top: 6px; color: #009688'>"
						    		    				+ "<span style='color: #009688'>实战</span>&nbsp;&nbsp;&nbsp;&nbsp;"
						    		    				+ "<span>"+level+"</span>"
						    		    				+ "&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: #009688'>浏览量:"+data.data[i].page_view+"</span>"
						    		    				+ "</p>"
						    		    				+ "</a></li>");
											}
						    			
						    			}else{
						    				layer.msg('获取视频列表失败!');
						    			}
						    		},
						    		error : function(data, type, err) {//该接口出错是执行的方法
						    				console.log("ajax错误类型："+type);
						    				console.log(err); 
						    			}
						    		});
						    }
					    }
					  });
					});
			}else{
				layer.msg(data.msg);
			}
		},
		error:function(data){
			layer.msg("获取视频列表失败!");
		}
	});
}

//获取地址栏中的参数
</script>
</body>
</html>