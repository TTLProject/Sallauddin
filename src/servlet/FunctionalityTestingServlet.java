package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectionSteps;
import dao.FunctionalityTestingDao;
import userbean.Userbean;

/**
 * Servlet implementation class FunctionalityTestingServlet
 */
@WebServlet("/FunctionalityTestingServlet")
public class FunctionalityTestingServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String empname=request.getParameter("empname");
		System.out.println(empname);
		System.out.println(request.getParameter("nid"));
		int id= Integer.parseInt(request.getParameter("nid"));
		Userbean user = new Userbean();
		HttpSession session =  request.getSession();
		Userbean user1 = (Userbean) session.getAttribute("session2");
		user.setEmpname(empname);
		user.setUsername(user1.getUsername());
       
        {
        	ConnectionSteps steps =new ConnectionSteps();
    		try {
    			Connection conn= steps.connection();
    			PreparedStatement pstmt=conn.prepareStatement("select * from notifications where id=?");
    			pstmt.setInt(1, id);
    			ResultSet rs = pstmt.executeQuery();
    			if(rs.next()) {
    				user.setProjectName(rs.getString("projectname"));
    				user.setModuleName(rs.getString("modulename"));
    				user.setRequirementName(rs.getString("requirementname"));
    				user.setTicketDescription(rs.getString("ticketdescription"));
    			
    			}
    					
    					
    					
    		} catch (ClassNotFoundException | SQLException e) {
    		
    			e.printStackTrace();
    		}
    		
    		
        }
		FunctionalityTestingDao.insert(user);
		boolean status=user.isValid();
		if(status) {
			
			String greetings = "Notification sent to employee";
			
			response.setContentType("text/plain");
			response.getWriter().write(greetings);
		}
		
	}

}
