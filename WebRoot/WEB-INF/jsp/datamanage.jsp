<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'programanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
  .formsubmit{
    width: 800px;
    height:200px;
    position: relative;
    top:20px;
  }
  #filename{
  width: 200px;
  height:30px;
  }
    #excelFile{
     display: none;
  }
  #button{
    width: 50px;
  height:30px;
  }
  #warn{
  font-size:12px;
  color:RGB(192,192,192);
  }
  #subBtn{
  position:absolute;
  top:60px;
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
  #danger{
  display: block;
  font-size:12px;
  color:RGB(255,99,71);
  }
  .dangerspan{
  width:600px;
  height:10px;
  position:relative;
  top:-7px;
  }
</style>
<script type="text/javascript">
function callOther(){
$('#excelFile').click();
}
function getFileName(){
var filepath=$('#excelFile').val();
var index=filepath.lastIndexOf('\\');
var filename=filepath.substring(index+1);
$('#filename').val(filename);
}
function conf(){
$('#danger').text('');
var file=$('#filename').val();
var index=file.lastIndexOf('.');
var filetype=file.substring(index+1);
if(file==null||file==""){
$('#danger').text('请选择文件');
}
else if(filetype!="xlsx"&&filetype!="xls"){
$('#danger').text('文件格式不正确');
}
else{
$('#excelform').submit();
}

}

</script>

  </head>
  
  <body>
  <div>
   <fieldset>
   <legend>数据信息上传</legend>
   <div class="formsubmit">
    <form id="excelform" action="${pageContext.request.contextPath}/excelparse" enctype="multipart/form-data" method="post">
    <div class="dangerspan">
    <span id="danger"></span>
    </div>
    <div>
    <input id="filename" name="filename"type="text" readonly="readonly"/><input id="button" type="button" onclick="callOther()" value="浏览"/>
    <input id="excelFile" type="file"  onchange="getFileName()" name="excelFile" />
    </div>
    <div>
      <span id="warn">该文件上传只支持excel</span>
    </div>
     <div id="subBtn">
     <input  class="button" id="confBtn" type="button" value="确定" onclick="conf()"/>
     </div>
    </form>
    </div>
   </fieldset>
   </div>
  </body>
</html>
