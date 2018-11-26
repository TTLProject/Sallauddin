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
String modname=request.getParameter("value2");
//System.out.print(modname);
Userbean user2 = (Userbean) session.getAttribute("viewsession");
Userbean user =  new Userbean();
user.setUname(user2.getUname());
user.setProjectName(user2.getProjectName());
user.setModuleName(modname);
user.setRequirementName("none");
user.setTable("none");
session.setAttribute("viewsession", user);

%>
</body>
</html>