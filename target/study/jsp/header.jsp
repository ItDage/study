<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<script type="text/javascript" src="${proPath }/layui/layui.js"></script>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<style type="text/css">
#header {
	text-align: center;
}
body {
	width: 1200px;
	background-color: #dddddd;
	margin: auto;
	
}
.change_font_size{
	font-size: 15px;
}

</style>
</head>
<body>
	<div id="header">
		<div class="layui-nav" lay-filter="test">
			<ul>
				<li class="layui-nav-item"><a href="${proPath }/jsp/index.jsp"><span class="change_font_size">首页</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=前端开发&page_no=0"><span class="change_font_size">前端开发</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/jsp/list.jsp"><span class="change_font_size">后端开发</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/jsp/list.jsp"><span class="change_font_size">移动开发</span></a></li>
				<li class="layui-nav-item"><a href="javascript:;"><span class="change_font_size">数据库</span></a>
					<dl class="layui-nav-child" id="test">
						<dd>
							<a href="">选项1</a>
						</dd>
						<dd>
							<a href="">选项2</a>
						</dd>
						<dd>
							<a href="">选项3</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="${proPath }/jsp/list.jsp"><span class="change_font_size">云计算&大数据</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/jsp/list.jsp"><span class="change_font_size">运维&测试</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=UI设计&page_no=0"><span class="change_font_size">UI设计</span></a></li>
				<li class="layui-nav-item" style="float: right;"><a
					href="javascript:;">搜索</a></li>
				<li class="layui-nav-item" style="float: right;"><a
					href="javascript:;">登录</a></li>
			</ul>
		</div>
	</div>
	
<script type="text/javascript">
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