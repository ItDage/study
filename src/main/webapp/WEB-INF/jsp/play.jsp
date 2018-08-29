<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${requestScope.video.name }</title>
<script type="text/javascript" src="${proPath }/layui/layui.js"></script>
<script type="text/javascript" src="${proPath }/js/jquery.js"></script>
<link rel="stylesheet" href="${proPath }/layui/css/layui.css"
	media="all">
<style type="text/css">
body {
	background-color: #dddddd;
	width: 1200px;
	margin: auto;
}
.indent{
	margin:5px 0 10px 20px
}
.floor{
	float:right;
	margin-right:20px;
}

.switch{
	background-color: #f2f2f2;
	width: 100%;
}

</style>
</head>
<body>
	<%-- <%@include file="/jsp/header.jsp"%> --%>
	<div style="margin-top: 15px;">
		<blockquote class="layui-elem-quote">
		<c:if test="${requestScope.collection == 0 }">
			<span id = "collFont">收藏</span>:&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:collection(${requestScope.video.id })"><i id = "collection" class="layui-icon" style="font-size: 25px; color: #1E9FFF;">&#xe600;</i></a>
		</c:if>
		<c:if test="${requestScope.collection == 1 }">
			<span id = "collFont">已收藏</span>:&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:collection(${requestScope.video.id })"><i id = "collection" class="layui-icon" style="font-size: 25px; color: red;">&#xe600;</i></a>
		</c:if>
		
		</blockquote>
	</div>
	<div style="background-color: black">
		<video
			src="/study_manage/videos/${requestScope.video.src }"
			width="1200px" height="500px;" controls="controls"
			autoplay="autoplay">
		</video>
	</div>
	<br>
	<blockquote class="layui-elem-quote">评论</blockquote>
	<div style="background-color: white;">
		<textarea class="layui-textarea" id="LAY_demo2" style="display: none"></textarea>
	</div>
	<BR>
	<div class="layui-form-item" align="center">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
	<input type="hidden" value="${requestScope.video.id }" id = "v_id">
	<div>
		<ul id="message_list">
		<c:forEach var="comment" items="${requestScope.commentList }" varStatus="idxStatus">
			<span id="comment_${comment.id }"><li><hr class='layui-bg-green'></li>
				<li class='indent'><img alt='' src='${proPath }/images/user/register_0.jpg' style='width: 35px; height: 35px; border-radius: 200px;'>&nbsp;&nbsp;${comment.mail }<span class='floor'>2018-02-02&nbsp;&nbsp;&nbsp;&nbsp;${idxStatus.count }楼</span></li>
				<li class='indent' style='color:black'>${comment.content }</li>
				<c:if test="${sessionScope.user.mail == comment.mail }">
					<li class='indent' style='color:black'><a href="javascript:deleteComment(${comment.id })">删除</a></li>
				</c:if>
				</span>
		</c:forEach>
		</ul>
	</div>


	<script type="text/javascript">
		layui.use([ 'form', 'layedit' ], function() {
			var form = layui.form;
			var layedit = layui.layedit, $ = layui.jquery;
			var index = layedit.build('LAY_demo2', {
				tool : [ 'strong', 'italic', '|', 'face', '|', 'left' ],
				height : 150
			});
			form.on('submit(formDemo)', function(data){
				 	var content = layedit.getContent(index);
				 	var text = layedit.getText(index);
				 	var v_id = $("#v_id").val();
				 	if(text == null || text == ""){
				 		layer.msg("评论不能为空!")
				 	}else{
				 		$.ajax({
							url : "${proPath }/comment/add",//请求的URL
							dataType : "json",//返回的类型
							type : "GET",//请求的类型,GET或者POST
							//contentType: "application/json",//请求数据类型
							data : {"v_id" : v_id, "content" : content},//请求携带的数据
							success : function(data) {//请求成功的数据
								if (data.code == 200) {
									//成功,改变颜色和状态
									layer.msg(data.msg);
									$("#message_list").append("<span id = ''><li><hr class='layui-bg-green'></li>"
											+" <li class='indent'><img alt='' src='${proPath }/images/user/register_0.jpg' style='width: 35px; height: 35px; border-radius: 200px;'>&nbsp;&nbsp;" + data.data.username + "<span class='floor'>" + data.data1 + "&nbsp;&nbsp;&nbsp;&nbsp;" + data.count + "楼</span></li>"
											+" <li class='indent' style='color:black'>" + content + "</li>"
											+" </span>");
								}else{
									layer.msg(data.msg);
						}
					},
					error : function(data, type, err) {//该接口出错是执行的方法
						console.log("ajax错误类型："+type);
						console.log(err); 
					}
					});
				 	}
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
		});
		
		function collection(id){
			layui.use([ 'layer'], function() {
				var layer = layui.layer;
			
			var test = $('#collection').css('color');
			if(test == 'rgb(30, 159, 255)'){
				//未收藏,改为收藏
				$.ajax({
					url : "${proPath }/collection/add",//请求的URL
					dataType : "json",//返回的类型
					type : "GET",//请求的类型,GET或者POST
					//contentType: "application/json",//请求数据类型
					data : {"v_id" : id},//请求携带的数据
					success : function(data) {//请求成功的数据
						if (data.code == 200) {
							//成功,改变颜色和状态
							$('#collFont').html('已收藏');
							$('#collection').css('color','red');
							layer.msg(data.msg);
						}else{
							layer.msg(data.msg);
				}
			},
			error : function(data, type, err) {//该接口出错是执行的方法
				console.log("ajax错误类型："+type);
				console.log(err); 
			}
		});
			}else{
				$.ajax({
					url : "${proPath }/collection/delete",//请求的URL
					dataType : "json",//返回的类型
					type : "GET",//请求的类型,GET或者POST
					//contentType: "application/json",//请求数据类型
					data : {"v_id" : id},//请求携带的数据
					success : function(data) {//请求成功的数据
						if (data.code == 200) {
							//成功,改变颜色和状态
							$('#collFont').html('收藏');
							$('#collection').css('color','#1E9FFF');
							layer.msg(data.msg);
						}else{
							layer.msg(data.msg);
				}
			},
			error : function(data, type, err) {//该接口出错是执行的方法
				console.log("ajax错误类型："+type);
				console.log(err); 
			}
		});
				
			}
		});
		}
		function deleteComment(id){
			$.ajax({
				url : "${proPath }/comment/delete",//请求的URL
				dataType : "json",//返回的类型
				type : "POST",//请求的类型,GET或者POST
				data : {"id" : id},//请求携带的数据
				success : function(data) {//请求成功的数据
					if (data.code == 200) {
						//成功,改变颜色和状态
						layer.msg("删除成功!");
						$("#comment_" + id).remove();
					}else{
						layer.msg("删除失败!");
			}
		},
		error : function(data, type, err) {//该接口出错是执行的方法
			console.log("ajax错误类型："+type);
			console.log(err); 
		}
	});
		}
	</script>
</body>
</html>