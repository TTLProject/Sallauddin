package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userbean.Userbean;

public class TicketDao {

	public static void insert(Userbean user) {
		
		try {
			
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("insert into tickettable(ticketid,ticketdescription,projectname,modulename,requirementname,assignedto,assignedby,dateofissue,status,username,empname,editstatus,testassignedto) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getTicketId());
			pstmt.setString(2, user.getTicketDescription());
			pstmt.setString(3, user.getProjectName());
			pstmt.setString(4, user.getModuleName());
			pstmt.setString(5, user.getRequirementName());
			pstmt.setString(6, user.getAssignedTo());
			pstmt.setString(7, user.getAssignedBy());
			pstmt.setString(8, user.getDateOfIssue());
			pstmt.setString(9, "Assign");
			pstmt.setString(10, user.getUsername());
			pstmt.setString(11, user.getEmpname());
			{
				PreparedStatement pstmt1=conn.prepareStatement("select * from registrationtable where username=?");
				pstmt1.setString(1, user.getUsername());
				ResultSet rs1 = pstmt1.executeQuery();
				if(rs1.next()) {
					
					user.setDesignation(rs1.getString("designation"));
					user.setDomain(rs1.getString("domain"));
				}
				
				
			}
			System.out.println(user.getDesignation());
			if(user.getDesignation().equals("executivequalityanalyst")||user.getDesignation().equals("executivesoftwaredeveloper")) {
				
				pstmt.setString(12, "approved");
			}else {
			
			pstmt.setString(12, "pending");
			}
			pstmt.setString(13, "0");
			int i=pstmt.executeUpdate();
			if(i>0) {
				
				System.out.println("insert success");
				user.setValid(true);
			}else {
				System.out.println("insert failed");
				user.setValid(false);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
