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
Userbean user1 = (Userbean) session.getAttribute("testsession");
String proname=request.getParameter("value1");
Userbean user =  new Userbean();
user.setProjectName(proname);
user.setRequirementName("none");
user.setModuleName("none");
user.setTable("none");
user.setUsername(user1.getUsername());
session.setAttribute("testsession", user);
%>
</body>
</html>