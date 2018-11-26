<%@page import="userbean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String reqname=request.getParameter("value2");
/* System.out.print(reqname); */
Userbean user3 = (Userbean) session.getAttribute("testsession"); 
Userbean user =  new Userbean();
user.setUname(user3.getUname());
user.setProjectName(user3.getProjectName());
user.setModuleName(user3.getModuleName());
user.setRequirementName(reqname);
user.setUsername(user3.getUsername());
session.setAttribute("testsession", user);
%>
</body>
</html>