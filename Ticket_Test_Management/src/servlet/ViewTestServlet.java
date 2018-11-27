package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectionSteps;
import userbean.Userbean;

/**
 * Servlet implementation class ViewEmployeeTestServlet
 */
@WebServlet("/ViewTestServlet")
public class ViewTestServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 Userbean user =new Userbean();
			
			String actualresult[]=request.getParameterValues("actualresult[]");
			String status[]=request.getParameterValues("status[]");
			String emporexc =request.getParameter("decide");
			
			String id1[]=request.getParameterValues("id[]");
			try {
				ConnectionSteps steps = new ConnectionSteps();
				Connection conn=steps.connection();
				for(int i=0;i<=actualresult.length-1;i++)
				{
					
					String insertQuery = "update  testreporttable set actualresult=?,status=?,status1=? where id=?";
					PreparedStatement pstmt = conn.prepareStatement(insertQuery);
					
					
					
					
					pstmt.setString(1, actualresult[i]);
					pstmt.setString(2, status[i]); 
					pstmt.setString(3, "view"); 
					
					pstmt.setString(4, id1[i]);
					int n =pstmt.executeUpdate();
					if(n>0) {
						
						System.out.println("success");
						user.setValid(true);
					
					}
					else {
						
						System.out.println("fails");
						user.setValid(false);
						
					}
			
				
				
				
				
				}
			}catch (Exception e) {
		System.out.println(e);
			}
			boolean state = user.isValid();
			if(state) {
				if(emporexc.equals("employee")) {
				response.sendRedirect("ViewTestReport.jsp");
				}else {
					response.sendRedirect("ViewExecutiveTestReport.jsp");
				}
			}else {
				if(emporexc.equals("employee")) {
					response.sendRedirect("ViewTestReport.jsp");
					}else {
						response.sendRedirect("ViewExecutiveTestReport.jsp");
					}
			}
	}

}
