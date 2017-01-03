<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'datashow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	a{
       text-decoration:none;
     } 
 	#atag{
	position: relative;
	top:5px;
	}
	</style>
	<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script type="text/javascript">
	function changePage(url){
	$("#iframepage").attr("src",url);
	}
	</script>

  </head>
  
  <body>
  <div id="atag">
  <a href="javascript:void(0);" onclick="changePage('${pageContext.request.contextPath}/onlineuser')">全国在网用户数</a>
  <a href="javascript:void(0);" onclick="changePage('${pageContext.request.contextPath}/invokeuser')">各省激活用户走势图</a>
  </div>
  <div class="main">
        <iframe  id="iframepage"  width=100%  height=100% frameborder=no scrolling=no  src="${pageContext.request.contextPath}/onlineuser"></iframe>
    </div>

  </body>
</html>
