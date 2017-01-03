<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'onlineuser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.js" ></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/js/china.js"></script>

  </head>
  
  <body>
    <h1 id="warning"></h1>
    <div id="EverProvinceOnlineUser" style="width: 1000px;height:600px;">
    </div>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/onlineuser.js"></script>
      
</html>
