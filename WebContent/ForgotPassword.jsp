<%@page import="servlet.Email1"%>
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
   	try {
   										String name=request.getParameter("email");
   										Userbean user=new Userbean();
   										
   										ConnectionSteps steps = new ConnectionSteps();
   										Connection conn = steps.connection();
   										PreparedStatement pstmt = conn.prepareStatement("select * from registrationtable where email=?");
   								
   										pstmt.setString(1, name);	
   									ResultSet rs=pstmt.executeQuery();
   									if(rs.next()){
   										user.setUsername(rs.getString("username"));
   										user.setPassword(rs.getString("password"));
   										user.setName(rs.getString("name"));
   										user.setEmail(name);												
   									 Email1.mail(user);
   									  response.sendRedirect("Login1.jsp");
   									
   									}else{
   %>
											<h1>Invalid Email.. Please enter valid email address</h1>
											
											<%
											  RequestDispatcher rd=request.getRequestDispatcher("Forgot.jsp");
											  rd.include(request, response);
											}
											}catch(Exception e){
												e.printStackTrace();
											}
														%>
</body>
</html>