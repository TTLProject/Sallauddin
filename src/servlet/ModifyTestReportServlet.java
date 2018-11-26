package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectionSteps;
import dao.ExecutiveModifyNotification;
import userbean.Userbean;

/**
 * Servlet implementation class ModifyTestReportServlet
 */
@WebServlet("/ModifyTestReportServlet")
public class ModifyTestReportServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Userbean user =new Userbean();
		String testcaseid[]=request.getParameterValues("testcaseid[]");
		String testdescription[]=request.getParameterValues("testdescription[]");
		String precondition[]=request.getParameterValues("precondition[]");
		String testdesign[]=request.getParameterValues("testdesign[]");
		String expectedresult[]=request.getParameterValues("expectedresult[]");
		String actualresult[]=request.getParameterValues("actualresult[]");
		String status[]=request.getParameterValues("status[]");
		String comment[]=request.getParameterValues("comments[]");
		String id1[]=request.getParameterValues("id[]");
		String assignedto[]=request.getParameterValues("assignedto[]");
		String color1[]=request.getParameterValues("color1[]");
		String color2[]=request.getParameterValues("color2[]");
		String color3[]=request.getParameterValues("color3[]");
		String color4[]=request.getParameterValues("color4[]");
		String color5[]=request.getParameterValues("color5[]");
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			for(int i=0;i<=testcaseid.length-1;i++)
			{
				
				String insertQuery = "update  testreporttable set testcaseid=?,testdescription=?,precondition=?,testdesign=?,expectedresult=?,actualresult=?,status=?,comments=?,report=? where id=?";
				PreparedStatement pstmt = conn.prepareStatement(insertQuery);
				PreparedStatement pstmt1 = conn.prepareStatement("update duplicatetable set testdescription=?,precondition=?,testdesign=?,expectedresult=?,comments=? where id=?");
				/*
				System.out.println("testcaseid[i]  "+testcaseid[i]);
				System.out.println("testdescription[i]  "+testdescription[i]);
				System.out.println("precondition[i]  "+precondition[i]);
				System.out.println("testdesign[i]  "+testdesign[i]);
				System.out.println("expectedresult[i]  "+expectedresult[i]);
				System.out.println("actualresult[i]  "+actualresult[i]);
				System.out.println("status[i]  "+status[i]);
				System.out.println("comment[i]  "+comment[i]);
				System.out.println("id"+id1[i]);*/
				
				//int id = Integer.parseInt(testcaseid[i].split("TC-")[1]);
				System.out.println(assignedto[0]);
				pstmt.setString(1, testcaseid[i]); 
				pstmt.setString(2, testdescription[i]);
				pstmt.setString(3, precondition[i]); 
				pstmt.setString(4, testdesign[i]);
				pstmt.setString(5, expectedresult[i]); 
				pstmt.setString(6, actualresult[i]);
				pstmt.setString(7, status[i]); 
				pstmt.setString(8, comment[i]);
				pstmt.setString(9, "modify");
				pstmt.setString(10, id1[i]);
				int n =pstmt.executeUpdate();
				
				pstmt1.setString(1, color1[i]); 
				pstmt1.setString(2, color2[i]);
				pstmt1.setString(3, color3[i]); 
				pstmt1.setString(4, color4[i]);
				pstmt1.setString(5, color5[i]); 
				
				pstmt1.setString(6, id1[i]);
				
				int n1 =pstmt1.executeUpdate();
				if(n>0) {
					
				
					user.setValid(true);
				
				}
				else {
					
					
					user.setValid(false);
					
				}
		
			
			
			
			
			}	
			boolean status1 = user.isValid();
			if(status1) {
				PreparedStatement pstmt2 = conn.prepareStatement("select * from testreporttable where id=?");
				System.out.println(assignedto[0]);
				pstmt2.setString(1, id1[0]);
				ResultSet rs= pstmt2.executeQuery();
				if(rs.next()) {
					user.setEmpname(rs.getString("username"));
					user.setProjectName(rs.getString("projectname"));
					user.setRequirementName(rs.getString("requirementname"));
					user.setModuleName(rs.getString("modulename"));
				
				}
				HttpSession session = request.getSession();
				Userbean user1 = (Userbean) session.getAttribute("session2");
				user.setUsername(user1.getUsername());
				user.setDomain(user1.getDomain());
				System.out.println(assignedto[0]);
				user.setAssignedTo(assignedto[0]);
				
				ExecutiveModifyNotification.insert(user);
			
				String greetings = "Modifications sent to employee";
				
				response.setContentType("text/plain");
				response.getWriter().write(greetings);
				
			}
			
		}catch (Exception e) {
	System.out.println(e);
		}
		
	}

}
