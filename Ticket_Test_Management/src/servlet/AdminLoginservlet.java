package servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Admindao;
import userbean.Userbean;


@WebServlet("/AdminLoginservlet")
public class AdminLoginservlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

	
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Userbean user=new Userbean();
	
			if ((username != null) && (password != null)) {
				user.setUsername(username);
				user.setPassword(password);
				Admindao.insert(user);
				Boolean status = user.isValid();
				// System.out.println("adminstatus:::"+adminstatus);
				if (status) {
					HttpSession session = request.getSession(true);
					session.setAttribute("Admin", user);
					response.sendRedirect("EmployeeDetails.jsp");
				} else {
					response.sendRedirect("AdminLoginFailure.jsp");
				}


		}
	}
}
