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

<title>My JSP 'new.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
*{
margin:0;
padding:0;
font-size:15px;
}
.ul{
list-style:none;
width:100px;
background-color:#ccc;
}

.nav li a{
text-decoration:none;
color:#333;
height:33px;
width:100px;
line-height:33px;
margin-bottom:1px;
background-color:#efefef;
display:block;
text-indent:20px;
}
.nav li a:hover{
background-color:#f66;
color:#fff;
}
.username{
position:absolute;
left: 1200px;
top:50px;

}
.username a{

font-size:18px;
text-decoration:none;
color:black;

}
.userimg{
position:relative;
top:7px;
width: 30px;
height:30px ;
}
.username a:hover{
color:blue;
text-decoration:underline;
}
.main{
width:1500px;
position:absolute;
left:120px;
top:100px;
}
.nav{
position:relative;
top:30px;
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script>
function changePage(url){
	$("#iframepage").attr("src",url);
}
</script>

</head>

<body>

	<header> <img class="titleimg" src="${pageContext.request.contextPath}/images/titleimg.png" />
	</header>
	<div class="username"><img class="userimg" src="${pageContext.request.contextPath}/images/username.png"/><label>${sessionScope.user.username}</label>&nbsp;<a id="exitHref" href="${pageContext.request.contextPath}/exit">退出</a>
	</div>
	<div class="nav">
	<ul class="ul">
	   <li><a href="javascript:void(0);" onclick="changePage('${pageContext.request.contextPath}/datashow')">数据显示</a></li>
       <li><a href="javascript:void(0);" onclick="changePage('${pageContext.request.contextPath}/datamanage')">数据管理</a></li>
    </ul>   
    </div>
    <div class="main">
        <iframe  id="iframepage"  width=100%  height=100% frameborder=no scrolling=no  src="${pageContext.request.contextPath}/datashow"></iframe>
    </div>
	
</body>
</html>
