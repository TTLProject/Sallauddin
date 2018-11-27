<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

String projectName=request.getParameter("projectname");
String requirementName=request.getParameter("requirementname");
String moduleName=request.getParameter("modulename");

System.out.println(projectName);
System.out.println(requirementName);
System.out.println(moduleName);

 Userbean user1=new Userbean();
 
 user1.setProjectName(projectName);
 user1.setRequirementName(requirementName);
 user1.setModuleName(moduleName);
 
  user1.setTable("ok");
  
 session.setAttribute("testsession",user1);
 response.sendRedirect("ExecutiveBugReport.jsp");

%>



</body>
</html>