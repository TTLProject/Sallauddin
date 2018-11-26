package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import userbean.Userbean;

public class EmployeeNotification {

	public static void insert(Userbean user) {

		ConnectionSteps steps =new ConnectionSteps();
		try {
			Connection conn= steps.connection();
			PreparedStatement pstmt=conn.prepareStatement("Insert into notifications(assignedby,subject,assignedto,dateofissue,domain,ticketid,projectname,requirementname,modulename,ticketdescription,empname,status) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getAssignedBy());//reported
			pstmt.setString(2, "AskingforApproval");//sub
		
			pstmt.setString(3,user.getAssignedTo());//assign
			pstmt.setString(4, user.getDateOfIssue());
			pstmt.setString(5, user.getDomain());
			pstmt.setString(6, user.getTicketId());
			pstmt.setString(7, user.getProjectName());
			pstmt.setString(8, user.getRequirementName());
			pstmt.setString(9, user.getModuleName());
			pstmt.setString(10, user.getTicketDescription());
			pstmt.setString(11, user.getEmpname());
			pstmt.setString(12, "approval");//status
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
