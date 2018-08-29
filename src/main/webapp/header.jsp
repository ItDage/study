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
				<li class="layui-nav-item"><a href="${proPath }/index.jsp"><span class="change_font_size">首页</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=前端开发&page_no=1"><span class="change_font_size">前端开发</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=后端开发&page_no=1"><span class="change_font_size">后端开发</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=移动开发&page_no=1"><span class="change_font_size">移动开发</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=数据库&page_no=1"><span class="change_font_size">数据库</span></a>
					</li>
				<%-- <li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=云计算&大数据&page_no=0"><span class="change_font_size">云计算&大数据</span></a></li> --%>
				<li class="layui-nav-item"><a href="${proPath }/list.jsp"><span class="change_font_size">运维和测试</span></a></li>
				<li class="layui-nav-item"><a href="${proPath }/course/list?first_nav_name=UI设计&page_no=1"><span class="change_font_size">UI设计</span></a></li>
				<li class="layui-nav-item" style="float: right;"><a
					href="javascript:;">搜索</a></li>
				<!-- 未登录显示登录按钮 -->
				<c:if test="${sessionScope.user == null }">
					<li class="layui-nav-item" style="float: right;"><a
					href="javascript:login();">登录</a></li>
				</c:if>
				<!-- 已登录显示个人信息按钮 -->
				<c:if test="${sessionScope.user != null }">
					<li class="layui-nav-item" style="float: right;"><a href="javascript:"><img
								alt="" src="${proPath }/images/user/${sessionScope.user.image }"
								width="33px;" height="33px;" class="layui-nav-img">${sessionScope.user.username }<span
								id="remind_bage"></span></a>
							<dl class="layui-nav-child" style="text-align: center;">
								<dd class="layui-this">
									<a href="${proPath }/user/userInfo">个人信息</a>
								</dd>
								<dd>
									<a href="javascript:changePassword();">修改密码</a>
								</dd>
								<dd>
									<a href="${proPath }/user/logout">退出</a>
								</dd>
							</dl>
					</li>
				</c:if>
				
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
function login(){
	layui.use('layer', function() {
		var layer = layui.layer;
		layer.open({
			type: 2,
			area: ['360px', '360px'],
			title: false, //不显示标题
			shadeClose: true, //点击遮罩层关闭窗口
			skin: 'layui-layer-rim', //加上边框
			content: '${proPath}/login.jsp'
	});
})
};
function changePassword() {
	layui.use('layer', function() {
		var layer = layui.layer;
	layer.open({
		type : 2,
		title : '修改密码',
		shadeClose : true,
		shade : 0.1,
		skin : 'layui-layer-molv', //加上边框
		area : [ '400px', '250px' ], //宽高
		content : '${proPath}/modify_password.jsp'
	});
	})
}
</script>
</body>
</html>