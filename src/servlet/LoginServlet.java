package servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeLoginDao;
import userbean.Userbean;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("Entered into LoginServlet servlet method...");
		
		/*String name = request.getParameter("name");
		String domain=request.getParameter("domain");
		String id =request.getParameter("id");*/
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		/*String confirmpassword=request.getParameter("confirmpassword");
		String email = request.getParameter("email");
		String webmail=request.getParameter("webmail");
		long mobile = Long.parseLong(request.getParameter("mobile"));*/
		String designation=request.getParameter("designation");

		Userbean user = new Userbean();
		Userbean user1 = new Userbean();

		
			if ((username != null) && (password != null)) {
				user.setUsername(username);
				user.setPassword(password);
				EmployeeLoginDao.insert(user);
				
				user1.setProjectName("none");
				user1.setRequirementName("none");
				user1.setModuleName("none");
				user1.setTestcaseid("empty");
				user1.setUsername(username);
				
				Boolean employeestatus = user.isValid();
				// System.out.println("status:::"+employeestatus);
				 
				if (employeestatus) {
					String desig=user.getDesignation();
					if((desig.equals("softwaretrainee"))||(desig.equals("qualityanalyst"))||(desig.equals("softwaredeveloper"))||(desig.equals("hrdepartment"))) {
					
					HttpSession session = request.getSession(true);
					session.setAttribute("session1", user);
					session.setAttribute("testsession", user1);
					response.sendRedirect("EmployeeIndex.jsp");
					}else {
						HttpSession session = request.getSession(true);
						session.setAttribute("session2", user);
						session.setAttribute("testsession", user1);
						response.sendRedirect("ExecutiveIndex.jsp");
					}
				} else {
					response.sendRedirect("LoginFailure.jsp");
				}
			} else {

				response.sendRedirect("LoginFailure.jsp");

			}
	
		} 
			

	
	
	}
		
		
		
		
		
		

