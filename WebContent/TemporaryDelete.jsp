<%@page import="dao.ConnectionSteps"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 
	response.setDateHeader("Expires", 0); 
	response.setHeader("Pragma", "no-cache");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("check1");
	
	%>

	<%
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn = steps.connection();
			
				PreparedStatement pstmt = conn.prepareStatement("update registrationtable set status=? where empid=?");

				pstmt.setString(1, "draft");
				pstmt.setString(2, id);
				int l = pstmt.executeUpdate();


			response.sendRedirect("EmployeeDetails.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
</body>
</html>