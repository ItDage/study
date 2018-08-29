<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<script src="${proPath }/layui/layui.js" charset="utf-8"></script>
<style type="text/css">
body {
	width: 1200px;
}

#myArticleList li {
	margin-top: 10px;
}

a.changeColor:hover {
	color: red !important;
}

#s_content {
	width: 1000px;
	margin: auto;
	margin-top: 20px;
}

#verticle_nav {
	width: 200px;
	float: left;
	height: 500px;
	background-color: #2F4056;
}

#verticle_nav ul li a.showPointer:hover {
	cursor: pointer;
}

#verticle_right {
	float: left;
	margin-left: 20px;
	width: 775px;
	height: 500px;
	background-color: white;
	border-radius: 5px;
}

#myArticleList li {
	margin-top: 10px;
}
</style>
</head>
<body class="layui-bg-gray" style="align: center; margin: auto">
	<%@include file="/header.jsp"%>
	<div id="s_content">
		<div id="verticle_nav">
			<ul class="layui-nav layui-nav-tree layui-bg-cyan layui-inline"
				lay-filter="demo">
				<li class="layui-nav-item layui-nav-itemed"><a
					onclick="userinfo();" class="showPointer">个人信息</a></li>
				<li class="layui-nav-item"><a onclick="article();"
					class="showPointer">观看历史</a></li>
				<li class="layui-nav-item"><a href="javascript:collection()">我的收藏</a></li>
			</ul>
		</div>
		<div id="verticle_right">
			<div class='layui-container fly-marginTop register0'
				style="width: 600px">
				<div class='fly-panel fly-panel-user' pad20>
					<div class='layui-tab layui-tab-brief' lay-filter='user'>
						<ul class='layui-tab-title'>
							<li class='layui-this' onclick='userinfo()'>我的资料</li>
						</ul>
						<div class='layui-form layui-tab-content' id='LAY_ucm'
							style='padding: 20px 0;'>
							<div class="layui-upload">
								<button type="button" class="layui-btn" id="test1">上传头像</button>
								<div class="layui-upload-list">
									<img class="layui-upload-img" id="demo1" width="100px" height="100px">
									<p id="demoText"></p>
								</div>
							</div>
							<form class="layui-form layui-form-pane">
								<div class="layui-form-item">
									<label class="layui-form-label">昵称</label>
									<div class="layui-input-inline">
										<input id="username" name="username" placeholder="请输入"
											lay-verify="user" autocomplete="off" class="layui-input"
											type="text" value="${requestScope.user.username }">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">年龄</label>
									<div class="layui-input-inline">
										<input id="age" name="age" lay-verify="required"
											placeholder="请输入" autocomplete="off" class="layui-input"
											type="text" value="${requestScope.user.age }">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">性别</label>
									<div class="layui-input-block">
										<c:if test="${requestScope.user.gender == 1 }">
											<input type="radio" name="gender" value="1" title="男" checked>
											<input type="radio" name="gender" value="2" title="女">
										</c:if>
										<c:if test="${requestScope.user.gender == 2 }">
											<input type="radio" name="gender" value="1" title="男">
											<input type="radio" name="gender" value="2" title="女" checked>
										</c:if>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">电话</label>
									<div class="layui-input-inline">
										<input id="tel" name="tel" placeholder="请输入"
											lay-verify="phone" autocomplete="off" class="layui-input"
											type="text" value="${requestScope.user.tel }">
									</div>
								</div>
								<div class="layui-form-item" style="width: 600px">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit="" lay-filter="formDemo">立即提交</button>
										<button type="reset" class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<script type="text/html" id="levelTpl">
  {{#  if(d.level == 0){ }}
    <span style="color: #01AAED">初级</span>
  {{#  } else if(d.level == 1) { }}
 	<span style="color: #FFB800">中级</span>
  {{#  } else { }}
	<span style="color: #FF5722">高级</span>
  {{#  } }}
   
</script>
	<script type="text/html" id="optionBar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
</script>
	<script type="text/javascript">
		layui.use('upload', function() {
			var $ = layui.jquery, upload = layui.upload;

			//普通图片上传
			var uploadInst = upload.render({
				elem : '#test1',
				url : '${proPath}/upload/image',
				size : 100 //限制文件大小，单位 KB
				,
				before : function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#demo1').attr('src', result); //图片链接（base64）
					});
				},
				done : function(data) {
					if (data.code > 0) {
						//上传成功
						return layer.msg('头像上传成功!');
					} else {
						return layer.msg('上传失败');
					}
				},
				error : function() {

				}
			});
		});

		layui.use('form', function() {
			var form = layui.form;
			//验证
			form.verify({
					user : function(value) {
						if (value.length <= 0) {
							return '昵称不能为空!';
						}else if(value.length > 8){
							return '昵称最多为8个字符!';
						}
					}
				});
			  
			//监听提交
			form.on('submit(formDemo)', function(data) {
				$.ajax({
					url : "${proPath}/user/update",
					dataType : "json",
					type : "PUT",
					contentType : "application/json",
					data : JSON.stringify(data.field),
					success : function(data) {
						layer.msg(data.msg);
					},
					error : function(data, type, err) {
						console.log("ajax错误类型：" + type);
						console.log(err);
					}
				});
				return false;
			});
		});
		layui.use([ 'element', 'layer', 'table' ], function() {
			var table = layui.table;
			var element = layui.element;
			var layer = layui.layer;

		});

		function article() {
			layui
					.use(
							[ 'element', 'layer', 'table', 'form' ],
							function() {
								var table = layui.table;
								var element = layui.element;
								var layer = layui.layer;
								var form = layui.form;
								$("#verticle_right").empty();
								$("#verticle_right")
										.append(
												"<table id='scanList' lay-filter='myArticleListFilter'></table>");
								layui
										.use(
												[ 'element', 'layer', 'table' ],
												function() {
													var table = layui.table;
													var element = layui.element;
													var layer = layui.layer;
													//执行渲染
													table
															.render({
																elem : '#scanList' //指定原始表格元素选择器（推荐id选择器）
																,
																url : '${proPath}/video/scan_history'
																//,height: 315 //容器高度
																,
																page : true
																//,limit: 10
																,
																cols : [ [ //标题栏
																           {
																				field : 'id',
																				title : 'ID',
																				width : 70
																			},
																			{
																				field : 'first_nav_name',
																				title : '一级导航',
																				width : 91
																			},
																			{
																				field : 'second_nav_name',
																				title : '二级导航',
																				width : 91
																			},
																			{
																				field : 'name',
																				title : '视频名',
																				width : 100
																			},
																			{
																				field : 'level',
																				title : '难度',
																				width : 90,
																				sort : true,
																				templet: '#levelTpl'
																			},
																			{
																				field : 'scan_time',
																				title : '上次观看时间',
																				width : 135,
																				sort : true
																			},
																			{
																				field : 'teacher',
																				title : '讲师',
																				width : 100,
																			},
																			{
																				fixed : 'right',
																				width : 80,
																				align : 'center',
																				toolbar : '#optionBar'
																			} ] ],
																request : {
																	pageName : 'page_no' //页码的参数名称，默认：page
																// ,limitName: 'nums' //每页数据量的参数名，默认：limit
																},
																response : {
																	statusName : 'code' //数据状态的字段名称，默认：code
																	,
																	statusCode : 200 //成功的状态码，默认：0
																	//,msgName: 'hint' //状态信息的字段名称，默认：msg
																	//,countName: 'total' //数据总数的字段名称，默认：count
																	,
																	dataName : 'data' //数据列表的字段名称，默认：data
																}

															});
													//监听工具条
													table
															.on(
																	'tool(myArticleListFilter)',
																	function(
																			obj) {
																		var data = obj.data;
																		if (obj.event === 'detail') {
																			var index = layer
																					.open({
																						type : 2,
																						title : data.title,
																						shadeClose : true,
																						shade : false,
																						maxmin : true, //开启最大化最小化按钮
																						area : [
																								'893px',
																								'600px' ],
																						content : '${proPath}/video/play?id=' + obj.data.id
																					});
																			layer.full(index);
																		}
																	});

													$('.demoTable .layui-btn')
															.on(
																	'click',
																	function() {
																		var type = $(
																				this)
																				.data(
																						'type');
																		active[type] ? active[type]
																				.call(this)
																				: '';
																	});
												});

							});
		}
		
		function collection(){
			layui
					.use(
							[ 'element', 'layer', 'table', 'form' ],
							function() {
								var table = layui.table;
								var element = layui.element;
								var layer = layui.layer;
								var form = layui.form;
								$("#verticle_right").empty();
								$("#verticle_right")
										.append(
												"<table id='scanList' lay-filter='myArticleListFilter'></table>");
								layui
										.use(
												[ 'element', 'layer', 'table' ],
												function() {
													var table = layui.table;
													var element = layui.element;
													var layer = layui.layer;
													//执行渲染
													table
															.render({
																elem : '#scanList' //指定原始表格元素选择器（推荐id选择器）
																,
																url : '${proPath}/collection/getCollection'
																//,height: 315 //容器高度
																,
																page : true
																//,limit: 10
																,
																cols : [ [ //标题栏
																           {
																				field : 'id',
																				title : 'ID',
																				width : 70
																			},
																			{
																				field : 'first_nav_name',
																				title : '一级导航',
																				width : 91
																			},
																			{
																				field : 'second_nav_name',
																				title : '二级导航',
																				width : 91
																			},
																			{
																				field : 'name',
																				title : '视频名',
																				width : 100
																			},
																			{
																				field : 'level',
																				title : '难度',
																				width : 90,
																				sort : true,
																				templet: '#levelTpl'
																			},
																			{
																				field : 'coll_time',
																				title : '收藏时间',
																				width : 135,
																				sort : true
																			},
																			{
																				field : 'teacher',
																				title : '讲师',
																				width : 100,
																			},
																			{
																				fixed : 'right',
																				width : 80,
																				align : 'center',
																				toolbar : '#optionBar'
																			} ] ],
																request : {
																	pageName : 'page_no' //页码的参数名称，默认：page
																// ,limitName: 'nums' //每页数据量的参数名，默认：limit
																},
																response : {
																	statusName : 'code' //数据状态的字段名称，默认：code
																	,
																	statusCode : 200 //成功的状态码，默认：0
																	//,msgName: 'hint' //状态信息的字段名称，默认：msg
																	//,countName: 'total' //数据总数的字段名称，默认：count
																	,
																	dataName : 'data' //数据列表的字段名称，默认：data
																}

															});
													//监听工具条
													table
															.on(
																	'tool(myArticleListFilter)',
																	function(
																			obj) {
																		var data = obj.data;
																		if (obj.event === 'detail') {
																			var index = layer
																					.open({
																						type : 2,
																						title : data.title,
																						shadeClose : true,
																						shade : false,
																						maxmin : true, //开启最大化最小化按钮
																						area : [
																								'893px',
																								'600px' ],
																						content : '${proPath}/video/play?id=' + obj.data.id
																					});
																			layer.full(index);
																		}
																	});

													$('.demoTable .layui-btn')
															.on(
																	'click',
																	function() {
																		var type = $(
																				this)
																				.data(
																						'type');
																		active[type] ? active[type]
																				.call(this)
																				: '';
																	});
												});

							});
		}

		function userinfo() {
			window.location.reload();
		}
	</script>
</body>
</html>