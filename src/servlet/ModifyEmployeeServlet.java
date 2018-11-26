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
 * Servlet implementation class ModifyEmployeeServlet
 */
@WebServlet("/ModifyEmployeeServlet")
public class ModifyEmployeeServlet extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Userbean user =new Userbean();
			//String testcaseid[]=request.getParameterValues("testcaseid[]");
			String testdescription[]=request.getParameterValues("testdescription[]");
			String precondition[]=request.getParameterValues("precondition[]");
			String testdesign[]=request.getParameterValues("testdesign[]");
			String expectedresult[]=request.getParameterValues("expectedresult[]");
			/*String actualresult[]=request.getParameterValues("actualresult[]");
			String status[]=request.getParameterValues("status[]");
			String comment[]=request.getParameterValues("comment[]");*/
			String id1[]=request.getParameterValues("id[]");
			try {
				ConnectionSteps steps = new ConnectionSteps();
				Connection conn=steps.connection();
				for(int i=0;i<=testdescription.length-1;i++)
				{
					
					String insertQuery = "update  testreporttable set testdescription=?,precondition=?,testdesign=?,expectedresult=? where id=?";
					PreparedStatement pstmt = conn.prepareStatement(insertQuery);
					
					PreparedStatement pstmt1 = conn.prepareStatement("update  duplicatetable set testdescription=?,precondition=?,testdesign=?,expectedresult=? where id=?");
					
					
					//int id = Integer.parseInt(testcaseid[i].split("TC-")[1]);
					
					
					pstmt.setString(1, testdescription[i]);
					pstmt.setString(2, precondition[i]); 
					pstmt.setString(3, testdesign[i]);
					pstmt.setString(4, expectedresult[i]); 
					pstmt.setString(5, id1[i]);
					
					pstmt1.setString(1, "white");
					pstmt1.setString(2, "white"); 
					pstmt1.setString(3, "white");
					pstmt1.setString(4, "white"); 
					pstmt1.setString(5, id1[i]);
					
					int n =pstmt.executeUpdate();
					int n1 =pstmt1.executeUpdate();
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
				response.sendRedirect("ModifyTestReport.jsp");
			}else {
				response.sendRedirect("ModifyTestReport.jsp");
			}
		
	}

}
