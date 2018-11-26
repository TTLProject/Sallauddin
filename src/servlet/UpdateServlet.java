package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EditTicketDao;
import dao.FunctionalityNotification;
import userbean.Userbean;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id=Integer.parseInt(request.getParameter("id"));
		String column_name=request.getParameter("column_name");
		String value=request.getParameter("value");
		System.out.println(id+"  "+column_name+"  "+value);
		
		Userbean user= new Userbean();
		user.setId(id);
		user.setColumn_name(column_name);
		user.setValue(value);
		
		if(user.getValue().equals("--select--")) {
			
		}else {
		EditTicketDao.update(user);
		}
		if(column_name.equals("testassignedto")) {
			FunctionalityNotification.notify(user);
		}
		boolean status = user.isValid();
		if(status) {
			String greetings = "Update success";
			
			response.setContentType("text/plain");
			response.getWriter().write(greetings);
			
		}
	}
	
	

}
