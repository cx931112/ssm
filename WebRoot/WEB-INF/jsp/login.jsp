<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.titleimg {
	position: absolute;
	width: 300px;
	height: 50px;
	left: 220px;
}

.backgroundimg {
	position: absolute;
	height: 500px;
	width: 1350px;
	top: 50px;
}

.formdiv {
	position: absolute;
	width: 350px;
	height: 250px;
	left: 120px;
	top: 170px;
	background-color: white;
}

.text {
	width: 250px;
	height: 30px;
}

.loginlabel {
	position: absolute;
	left: 40px;
	top: 20px;
	font-size: 25px;
}

.usernamediv {
	position: absolute;
	left: 40px;
	top: 50px;
}

.passwordiv {
	position: absolute;
	left: 40px;
	top: 85px;
}

.submitdiv {
	position: absolute;
	left: 40px;
	top: 200px;
}

.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}

.usernamelogo {
	position: absolute;
	height: 30px;
	width: 30px;
	top: 50px;
	left: 3px;
}
.select{
position:absolute;
top:140px;
left:40px;

}
#status{
height:25px;
}

.passwordlogo {
	position: absolute;
	height: 30px;
	width: 30px;
	top: 90px;
	left: 3px;
}
.warning{
font-size:20px;
color:red;
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">
	function login() {
	
		var settings = {
			url : '${pageContext.request.contextPath}/tologin',
			dataType:'json',
			type : 'post',
			data : {username:$('#username').val(),password:$('#password').val(),status:$('#status').val()},
			success : function(data) {//不管是否有数据返回都进入回掉函数
			
            if(data.result){
            $('#loginform').submit();
               
            }
            else{
                          
               $('#warning').text("用户名或者密码错误！");
            }
          
			}

		};
		$.ajax(settings);
	}
</script>
</head>
<body>
	<header> <img class="titleimg" src="${pageContext.request.contextPath}/images/titleimg.png" />
	</header>
	<div>
		<img class="backgroundimg" src="${pageContext.request.contextPath}/images/loginbackgroundimg.png"/>
	</div>
	<div class="formdiv">
		<form id="loginform" action="${pageContext.request.contextPath}/tomain" method="post">
			<legend class="loginlabel">登录</legend>
			<sapn class="warning" id="warning"></sapn>
			<img class="usernamelogo" src="${pageContext.request.contextPath}/images/username.png" />
			<div class="usernamediv">

				<input class="text" id="username" name="username" type="text" />
			</div>
			<img class="passwordlogo" src="${pageContext.request.contextPath}/images/password.png" />
			<div class="passwordiv">

				<input class="text" id="password" name="password" type="password" />
			</div>
			<div class="select" id="select">
			  <select id="status" name="status">
			  <option  value="1">Super Admin</option>
			  <option  value="2">Common Admin</option>
			  </select>
			</div>
			<div class="submitdiv">
				<input class="button" onclick="login()" type="button" value="登录" />
			</div>

		</form>
	</div>

</body>
</html>
