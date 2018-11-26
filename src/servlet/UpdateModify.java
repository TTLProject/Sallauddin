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

import dao.ConnectionSteps;

/**
 * Servlet implementation class UpdateModify
 */
@WebServlet("/UpdateModify")
public class UpdateModify extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int  id = Integer.parseInt(request.getParameter("id"));
		String color= request.getParameter("color");
		String column =request.getParameter("column_name");
		String column1;
		System.out.println(id);
		System.out.println(color);
		System.out.println(column);
		if(column.equals("testcaseid")){
			 column1="testid";
		}
		try {
		    
			ConnectionSteps
			steps = new ConnectionSteps();
			Connection conn=steps.connection();
		PreparedStatement pstmt = conn.prepareStatement("update duplicatetable set "+column+"=?"+"where projectname=? and modulename=? and requirementname=? and testcaseid=? and username=?");
		pstmt.setString(1, color);

			PreparedStatement pstmt1 = conn.prepareStatement("select * from testreporttable where id=?");
			pstmt1.setInt(1, id);
			ResultSet rs = pstmt1.executeQuery();
			if(rs.next()){
				System.out.println(rs.getString("projectname"));
				System.out.println(rs.getString("modulename"));
				System.out.println(rs.getString("requirementname"));
				System.out.println(rs.getString("username"));
			pstmt.setString(2, rs.getString("projectname"));
				pstmt.setString(3, rs.getString("modulename"));
				pstmt.setString(4, rs.getString("requirementname"));
				pstmt.setString(5, rs.getString("testcaseid"));
				pstmt.setString(6, rs.getString("username")); 
			
		}



		int i=pstmt.executeUpdate();
		if(i>0) {
			
			System.out.println("update success");
			
		}else {
			System.out.println("update failed");
			
		}
			
		}catch(Exception e) {
			
			System.out.println(e);
		}
		
		
	}

}
