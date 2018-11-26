package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import userbean.Userbean;

public class ExecutiveModifyNotification1 {

	public static void insert(Userbean user) {

		
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
			            user.setData(outDate);
			        } catch (ParseException ex){ 
			        }
			    }
			
			System.out.println("Current Date1 : " + dt1Text);
			LocalDate date=java.time.LocalDate.now();
			System.out.println(date);
			Connection conn= steps.connection();
			PreparedStatement pstmt=conn.prepareStatement("Insert into notifications(subject,assignedto,projectname,requirementname,modulename,assignedby,status,domain,dateofissue,empname) values(?,?,?,?,?,?,?,?,?,?) ");
			pstmt.setString(1, "ApprovedReport");
			pstmt.setString(2, user.getAssignedTo());		
			pstmt.setString(3, user.getProjectName());	
			pstmt.setString(4, user.getRequirementName());		
			pstmt.setString(5, user.getModuleName());
			pstmt.setString(6, user.getUsername());
			pstmt.setString(7,"issued");
			pstmt.setString(8,user.getDomain());
			pstmt.setString(9, user.getData());
			pstmt.setString(10, user.getEmpname());
			
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
