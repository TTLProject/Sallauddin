package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectionSteps;
import dao.TestReportNotificationDao;
import userbean.Userbean;

/**
 * Servlet implementation class TestReportNotification
 */
@WebServlet("/TestReportNotification")
public class TestReportNotification extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entered into TestReportNotification method...");
		 Userbean user2= new Userbean();
        String projectname=request.getParameter("projectname");
        System.out.println(projectname);
        String modulename=request.getParameter("modulename");
        System.out.println(modulename);
        String requirementname=request.getParameter("requirementname");
        
		try {

			ConnectionSteps	steps = new ConnectionSteps();
			Connection conn=steps.connection();
			System.out.println("notification class");
			PreparedStatement pstmt = conn.prepareStatement("update testreporttable set test=? where projectname=? and modulename=? and requirementname=?");
			
			pstmt.setString(1, "notify");
			pstmt.setString(2, projectname);
			pstmt.setString(3, modulename);
			pstmt.setString(4, requirementname);
			
			int i=pstmt.executeUpdate();
			if(i>0) {
               
				System.out.println("update success");
                
                 HttpSession session = request.getSession();
                 Userbean user1 = (Userbean) session.getAttribute("session1");
                
                 user2.setProjectName(projectname);
                 user2.setRequirementName(requirementname);
                 user2.setModuleName(modulename);
                 user2.setUsername(user1.getUsername());
                 user2.setUsername(user1.getUsername());
                 TestReportNotificationDao.employee(user2);
                 user2.setValid(true);
              
                 
			}else {
				
				System.out.println("update failed");

			}
			boolean status=user2.isValid();
if(status) {
    response.sendRedirect("TestReport.jsp");

}else {
    response.sendRedirect("TestReport.jsp");

}
		
		}catch(Exception e) {

			System.out.println(e);
			
		}
		}




}


