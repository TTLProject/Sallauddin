package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import userbean.Userbean;

public class ExecutiveTestReportNotificationDao {

	public static void executive(Userbean user2) {
		// TODO Auto-generated method stub

		
		ConnectionSteps steps =new ConnectionSteps();
		try {
			java.sql.Date dt1 = new java.sql.Date(System.currentTimeMillis());
			String dt1Text = dt1.toString();
			
			
			SimpleDateFormat inSDF = new SimpleDateFormat("yyyy-mm-dd");
			  SimpleDateFormat outSDF = new SimpleDateFormat("mm/dd/yyyy");
			
			  
			  String outDate = "";
			    if (dt1Text != null) {
			        try {
			            java.util.Date date = inSDF.parse(dt1Text);
			            outDate = outSDF.format(date);
			            user2.setData(outDate);
			        } catch (ParseException ex){ 
			        }
			    }
			
			System.out.println("Current Date1 : " + dt1Text);
			LocalDate date=java.time.LocalDate.now();
			System.out.println(date);
			Connection conn= steps.connection();
			PreparedStatement pstmt=conn.prepareStatement("Insert into notifications(subject,assignedto,projectname,requirementname,modulename,assignedby,status,domain,dateofissue,ticketdescription,empname) values(?,?,?,?,?,?,?,?,?,?,?)");
			{
				
				PreparedStatement pstmt1=conn.prepareStatement("select * from tickettable where projectname=? and requirementname=? and modulename=? and assignedto=?");
		     	pstmt1.setString(1, user2.getProjectName());	
		     	pstmt1.setString(2, user2.getRequirementName());		
		     	pstmt1.setString(3, user2.getModuleName());
	     		pstmt1.setString(4, user2.getAssignedTo());
		    	ResultSet rs = pstmt1.executeQuery();
		    	
	     		if(rs.next()) {
	     			
				user2.setEmpname(rs.getString("assignedby"));
				user2.setTicketDescription(rs.getString("ticketdescription"));
				
				
		    	}
			}
			System.out.println(user2.getTicketDescription());
			System.out.println(user2.getEmpname());
			pstmt.setString(1, "TestCases");
			pstmt.setString(2, user2.getEmpname());		
			pstmt.setString(3, user2.getProjectName());	
			pstmt.setString(4, user2.getRequirementName());		
			pstmt.setString(5, user2.getModuleName());
			pstmt.setString(6, user2.getUsername());
			pstmt.setString(7,"testissued");
			pstmt.setString(8,"testing");
			pstmt.setString(9, user2.getData());
			pstmt.setString(10, user2.getTicketDescription());
			pstmt.setString(11, user2.getUsername());
			
			int i = pstmt.executeUpdate();
			if(i>0) {
				System.out.println("notification sent");
			}
			else {
				System.out.println("notification sending failed");
			}	
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	
		
	}


