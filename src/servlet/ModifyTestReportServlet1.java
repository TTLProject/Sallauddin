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
import dao.ExecutiveModifyNotification1;
import userbean.Userbean;

/**
 * Servlet implementation class ModifyTestReportServlet
 */
@WebServlet("/ModifyTestReportServlet1")
public class ModifyTestReportServlet1 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Userbean user =new Userbean();
		
		String testdescription[]=request.getParameterValues("testdescription[]");
		String precondition[]=request.getParameterValues("precondition[]");
		String testdesign[]=request.getParameterValues("testdesign[]");
		String expectedresult[]=request.getParameterValues("expectedresult[]");
		
		String comments[]=request.getParameterValues("comments[]");
		String assignedto[]=request.getParameterValues("assignedto[]");
		String id1[]=request.getParameterValues("id[]");
		
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			for(int i=0;i<=id1.length-1;i++)
			{
				
				String insertQuery = "update  testreporttable set report=?,testdescription=?,precondition=?,testdesign=?,expectedresult=?, comments=? where id=?";
				PreparedStatement pstmt = conn.prepareStatement(insertQuery);
				String insertQuery1 = "update  duplicatetable set testdescription=?,precondition=?,testdesign=?,expectedresult=?, comments=? where id=?";
				PreparedStatement pstmt1 = conn.prepareStatement(insertQuery1);
				int id=Integer.parseInt(id1[i]);
				
				
				
				//int id = Integer.parseInt(testcaseid[i].split("TC-")[1]);
				
				
				pstmt.setString(1, "modified");
				pstmt.setString(2, testdescription[i]);
				pstmt.setString(3, precondition[i]); 
				pstmt.setString(4, testdesign[i]);
				pstmt.setString(5, expectedresult[i]); 
				pstmt.setString(6, comments[i]); 
				pstmt.setInt(7, id);
				int n =pstmt.executeUpdate();
				
			
				pstmt1.setString(1,"white");
				pstmt1.setString(2, "white"); 
				pstmt1.setString(3, "white");
				pstmt1.setString(4, "white"); 
				pstmt1.setString(5, "white"); 
				pstmt1.setInt(6, id);
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
				user.setAssignedTo(assignedto[0]);
				ExecutiveModifyNotification1.insert(user);
				
				
				String greetings = "Approved Successfully";
				
				response.setContentType("text/plain");
				response.getWriter().write(greetings);
				
			}
			
		}catch (Exception e) {
	System.out.println(e);
		}
		
		
	}

}
