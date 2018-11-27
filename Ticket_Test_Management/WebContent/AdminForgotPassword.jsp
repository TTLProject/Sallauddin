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
   										String name=request.getParameter("emailid");
   										Userbean user=new Userbean();
   										
   										ConnectionSteps steps=new ConnectionSteps();
   										Connection conn = steps.connection();
   										PreparedStatement pstmt = conn.prepareStatement("select * from admin where email=?");
   										
   										pstmt.setString(1, name);
   								
   									ResultSet rs1=pstmt.executeQuery();
   									System.out.println("nnn");
   									if(rs1.next()){
   										user.setUsername(rs1.getString("username"));
   										user.setPassword(rs1.getString("password"));
   									 	//user.setName(rs.getString("name")); 
   										user.setEmail(name)	;										
   									 Email1.mail(user);
   									
   									  response.sendRedirect("AdminMail.jsp");
   									
   									}else{
   %>
											<h1>Invalid Email.. Please enter valid email address</h1>
											
											<%
											  RequestDispatcher rd=request.getRequestDispatcher("AdminForgot.jsp");
											  rd.include(request, response);
											}
											}catch(Exception e){
												e.printStackTrace();
											}
														%>
</body>
</html>