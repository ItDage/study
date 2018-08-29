<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${proPath }/layui/layui.js"></script>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<title>修改密码</title>
</head>
<body style="background-color: #f5f5f5;">
	<form class="layui-form" style="margin-top:5%;">
		<table class="layui-table">
			<thead>
				<tr>
					<th>新密码:</th>
					<td><input type="password" name="password" class="layui-input" lay-verify="password"
						id="password"></td>
				</tr>
				<tr>
					<th>确认密码:</th>
					<td><input type="password" class="layui-input" lay-verify="confrim_pass"
						id="confirm_password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<button class="layui-btn layui-btn-small" lay-submit="" lay-filter="demo1">保存</button>
					<button class="layui-btn  layui-btn-small layui-btn-danger" type="reset">重置</button>
					</td>
				</tr>
			</thead>
		</table>
		<input type="hidden" name="username" value="${sessionScope.user.username }">
	</form>
</body>
<script>
	layui.use('table', function() {
		var table = layui.table;
	});
	//获取表单输入的值
	var kind = $("#password").val();
	var money = $("#confrim_pass").val();
	layui.use(['form', 'layer'], function() {
		var form = layui.form, layer = layui.layer;
		form.verify({
			password : [ /(.+){6,12}$/, '密码必须6到12位' ],
			confrim_pass : function(value) {
				var passvalue = $("#password").val();
				if (passvalue != value) {
					return '两次密码不一致!';
				}
			}
		});

		form.on('submit(demo1)', function(data) {
		$.ajax({
				url : "${proPath}/user/update",
				dataType : "json",
				type : "PUT",
				contentType: "application/json",
				data : JSON.stringify(data.field),
				success : function(data) {
					if (data.code == 200) {
						//成功,关闭页面
						layer.msg('修改成功!', {
							icon : 1
						});
					}else{
						layer.msg('修改失败!', {
							icon : 2
						});
					}
				},
				error : function(data, type, err) {
					layer.msg("修改失败!");
					console.log("ajax错误类型："+type);  
		            console.log(err);  
				}
			});
			return false;
		});
	});

</script>
</html>