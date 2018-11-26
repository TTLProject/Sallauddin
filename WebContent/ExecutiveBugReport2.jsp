<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page import="dao.ConnectionSteps"%>
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
HttpSession hts=request.getSession();
user1.setProjectName(user1.getProjectName());
 user1.setRequirementName(user1.getRequirementName());
 user1.setModuleName(user1.getModuleName());
 user1.setTable("ok");
 

String sum="";
	HttpSession hsh=request.getSession();
hsh.setAttribute("testsession",user1);
	
            String check=request.getParameter("select1");

            if(check==null)
       	 {
       		 response.sendRedirect("ExecutiveBugReport.jsp");
       	 }
      else
     {
    	 
            	String items[] = request.getParameterValues("select1");
	 
            	hts.setAttribute("sumlen", items.length);
            	System.out.println(items.length+"-size");
            	System.out.println("============================");
	
            	
     for(int i = 0; i < items.length; i++)
     {
         
    	  sum+=items[i]+"#";
    	  
      	
     }
     System.out.println(sum.length()+"--- sum length Total cases");
    
 
     hts.setAttribute("sum", sum);
    
     
     response.sendRedirect("ExecutiveBugReport.jsp");
	 }
 /* user1.setTestcaseid(testcaseid);
 user1.setProjectName(user1.getProjectName());
 user1.setRequirementName(user1.getRequirementName());
 user1.setModuleName(user1.getModuleName());
 
 user1.setTable("ok");
 
	
 session.setAttribute("testsession",user1);
 response.sendRedirect("ExecutiveBugReport.jsp"); */

%>
</body>
</html>