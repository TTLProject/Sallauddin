package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.EmployeeNotification;
import dao.TicketDao;
import userbean.Userbean;

/**
 * Servlet implementation class TicketServlet
 */
@SuppressWarnings("serial")
@WebServlet("/EmployeeTicketServlet")
public class EmployeeTicketServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entered into EmployeeTicketServlet servlet method...");

		String ticketId=request.getParameter("ticketid");
		String ticketDescription=request.getParameter("ticketdescription");
		String projectName=request.getParameter("projectname");
		String moduleName=request.getParameter("modulename");
		String requirementName=request.getParameter("requirementname");
		String assignedTo = request.getParameter("assignedto");
		String assignedBy=request.getParameter("assignedby");
		String dateOfIssue=request.getParameter("dateofissue");
		String username=request.getParameter("username");
		String empname =request.getParameter("empname");
		Userbean user  = new Userbean();
		
		if((ticketId!=null)&&(ticketDescription != null)&&(projectName != null)&&(moduleName != null)&&(assignedTo != null)&&(assignedBy != null)&&(dateOfIssue != null)){
			
			user.setTicketId(ticketId);
			user.setTicketDescription(ticketDescription);
			user.setProjectName(projectName);
			user.setRequirementName(requirementName);
			user.setModuleName(moduleName);
			user.setAssignedTo(assignedTo);
			user.setAssignedBy(assignedBy);
			user.setDateOfIssue(dateOfIssue);
			user.setUsername(username);
			user.setEmpname(empname);
			TicketDao.insert(user);
			boolean status=user.isValid();
			if(status) {
				if((user.getDesignation().equals("softwaretrainee"))||(user.getDesignation().equals("hrdepartment"))||(user.getDesignation().equals("qualityanalyst"))||(user.getDesignation().equals("softwaredeveloper"))) {
					
					EmployeeNotification.insert(user);
					
			response.sendRedirect("AddEmployeeTicketSuccess.jsp");
				}
				else {
					
					response.sendRedirect("AddEmployeeTicketSuccess.jsp");
				}
			}else {
				response.sendRedirect("AddEmployeeTicket.jsp");
			}
		}
		
		
	}

}
