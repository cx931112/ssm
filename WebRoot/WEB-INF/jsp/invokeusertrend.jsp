<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'invokeusertrend.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link href="${pageContext.request.contextPath}/css/lyz.calendar.css" rel="stylesheet" type="text/css" />

<script src="http://www.jq22.com/jquery/1.4.4/jquery.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.js" ></script>

<script src="${pageContext.request.contextPath}/js/lyz.calendar.min.js" type="text/javascript"></script>

<style>

body {

font-size: 18px;

font-family: "微软雅黑", "宋体", "Arial Narrow";

}
.province{
position:relative;
width:100px;
height:30px;
font-size: 18px;
font-weight:900;
top:2.2px;
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
	background-color: RGB(30,144,255);
	border-color: RGB(30,144,255);
	color:white;
}

</style>

<script>

    $(function () {

 
        $("#txtBeginDate").calendar();
        $("#txtEndDate").calendar();

    });
    function conf(){
    var beginDate=$('#txtBeginDate').val();
    var endDate=$('#txtEndDate').val();
    var province=$('#province').val();
    if(beginDate==null||beginDate==""||endDate==null||endDate==""||province==null||province==""){
    alert('信息填写不完整');
    }
    else{
    var settings={
    url:'${pageContext.request.contextPath}/getInvokeUserData',
    data:{beginDate:beginDate,endDate:endDate,province:province},
    dataType:'json',
    type:'post',
    success:function(data){
    
    }
    };
    }
    };

</script>

</head>

<body>


<div>
  开始日期:<input id="txtBeginDate" style="width:170px;padding:7px 10px;border:1px solid #ccc;margin-right:10px;"/>

  结束日期:<input id="txtEndDate" style="width:170px;padding:7px 10px;border:1px solid #ccc;" />
周期:<select id="step" class="step">
  <option ></option>
  <option value="1">天</option>
  <option value="7">周</option>
  <option value="30">月</option>
  <option value="365">年</option>
  
</select>
 省份:<select id="province" class="province" >
      <option ></option>
      <option value="江西">江西</option>
      <option value="陕西">陕西</option>
      <option value="四川">四川</option>
      <option value="重庆">重庆</option>
      <option value="云南">云南</option>
      <option value="新疆">新疆</option>
      <option value="安徽">安徽</option>
      <option value="广东">广东</option>
      <option value="吉林">吉林</option>
      <option value="宁夏">宁夏</option>
      <option value="江苏">江苏</option>
      <option value="湖北">湖北</option>
      <option value="浙江">浙江</option>
      <option value="河北铁通">河北铁通</option>
      <option value="河北移动">河北移动</option>
      <option value="广西联通">广西联通</option>
      <option value="广西移动">广西移动</option>
      <option value="湖南">湖南</option>
      <option value="海南">海南</option>
      <option value="山西">山西</option>
      <option value="西藏">西藏</option>
      <option value="北京">北京</option>
      <option value="福建">福建</option>
      <option value="贵州联通">贵州联通</option>
      <option value="贵州移动">贵州移动</option>
      <option value="辽宁">辽宁</option>
      <option value="青海">青海</option>
      <option value="黑龙江">黑龙江</option>
      <option value="易视腾">易视腾</option>
      <option value="浙江丽水">浙江丽水</option>
      <option value="其他">其他</option>
      <option value="总计">总计</option>
     </select>
     <input  class="button" id="confBtn" type="button" value="确定" onclick="conf()"/>
     </div>

</body>

</html>
