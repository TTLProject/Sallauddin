<%@page import="userbean.Userbean"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
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
		Userbean user = (Userbean) session.getAttribute("session2");
	%>
<%
String assignby=request.getParameter("assignby");
String assignto = request.getParameter("assignto");
String ticketid= request.getParameter("ticketid");
String empname= request.getParameter("ename");
int nid=Integer.parseInt(request.getParameter("nid"));
ConnectionSteps steps = new ConnectionSteps();
		Connection conn = steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("update notifications set status=?, executive=? ,subject=? where id=?");
			pstmt.setString(1, "approved");
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, "TicketApproved");
			pstmt.setInt(4, nid);
			
			
			PreparedStatement pstmt1 = conn.prepareStatement("update tickettable set editstatus=? where ticketid=? and username=?");
			pstmt1.setString(1, "approved");
			pstmt1.setString(2, ticketid);
			pstmt1.setString(3, empname);
			int n= pstmt1.executeUpdate();
		int i= pstmt.executeUpdate();
		if(i>0){
			System.out.println("success");
			response.sendRedirect("ExecutiveNotifications.jsp");
		}else{
		
			System.out.println("failed");
			response.sendRedirect("ExecutiveNotifications.jsp");
			
		}




%>


</body>
</html>