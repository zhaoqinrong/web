<%@page import="cn.bdqn.entity.IpTimeStamp"%>
<%@page import="org.lxh.smart.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>Insert title here</title>
</head>
<body>

<%

//1.实例化SmartUpload对象
SmartUpload smart=new SmartUpload();
//2.初始化上传操作
smart.initialize(pageContext);
//3.上传准备
smart.upload();
//获取客户端的 IP地址
String ip=request.getRemoteAddr();
/*IpTimeStamp是自己定义的一个类,类
中有一个获得(IP+时间戳+三位随机数)字符串的方法*/
IpTimeStamp its=new IpTimeStamp(ip);
/*获取文件的扩展名.smart.getFiles()是获取我们上传的多
个文件,getFile(0).这里面的0是下标getFileExt()是获取文件的扩展名*/
String ext =smart.getFiles().getFile(0).getFileExt();
//拼接文件名称
String fileName=its.getIpTimeRand()+"."+ext;
//java.io.File.separator是系统分隔符,win7是"\";
smart.getFiles().getFile(0).saveAs(this.getServletContext().getRealPath("/")+"upload"+java.io.File.separator+fileName);

String name=smart.getRequest().getParameter("uname");
name=new String(name.getBytes(),"UTF-8");
//保存文件
smart.save("upload");
%>
<%="姓名是"+name %>
</body>
</html>