<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
	<script type="text/javascript">
	window.onload=function(){
		//1.获取a节点,并为其添加onclick响应函数
		document.getElementsByTagName("a")[0].onclick=function(){
		//3.创建一个XMLHttpRsquest对象
		var request =new XMLHttpRequest();
		
		//4准备发送请求的数据:url url后拼接了一个时间戳用来禁用缓存
		var url=this.href+"?time="+new Date().getTime();;
		var method="get";
		//5调用XMLHttpRequest	对象的open方法
		request.open(method,url);
		
	
		
		//6调用XMLHttpRequest对象的send方法
		request.send(null);
		
		//7为XMLHttpRequest对象添加onreadystatechange函数
		request.onreadystatechange=function(){
		//8判断响应是否完成;XMLHttp对象的redyState属性值为4的时候表示响应完成
			if(request.readyState==4){
		//9再判断响应是否可用:XMLHttpRequest对象status属性值为200;
				if(request.status==200||request.status==304){
		//10打印响应结果:responseText
					alert(request.responseText);
				}
			}
		}
			//2.取消a节点的默认行为
			return false;
		}
		
	}
	
	</script>
  </head>
  
  
  <body>
    <a href="helloAjax.txt">helloAjax</a>
  </body>
</html>
