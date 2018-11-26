package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import userbean.Userbean;

public class ExecutiveNotification {

	public static void insert(Userbean user) {


		ConnectionSteps steps =new ConnectionSteps();
		try {
			Connection conn= steps.connection();
			PreparedStatement pstmt=conn.prepareStatement("Insert into notifications(assignedby,subject,assignedto,dateofissue,domain,ticketid,projectname,requirementname,modulename,ticketdescription,status,empname) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getAssignedBy());
			pstmt.setString(2, "TicketAssigned");
		
			pstmt.setString(3,user.getAssignedTo());
			pstmt.setString(4, user.getDateOfIssue());
			pstmt.setString(5, user.getDomain());
			pstmt.setString(6, user.getTicketId());
			pstmt.setString(7, user.getProjectName());
			pstmt.setString(8, user.getRequirementName());
			pstmt.setString(9, user.getModuleName());
			pstmt.setString(10, user.getTicketDescription());
			pstmt.setString(11, "issued");
			pstmt.setString(12, user.getEmpname());
			int i = pstmt.executeUpdate();
			if(i>0) {
				System.out.println("notification sent to employee");
			}
			else {
				System.out.println("notification sending failed");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
