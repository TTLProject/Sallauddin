package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import userbean.Userbean;

public class FunctionalityTestingDao {

	public static void insert(Userbean user) {
		ConnectionSteps steps =new ConnectionSteps();
		try {
			Connection conn= steps.connection();
			PreparedStatement pstmt=conn.prepareStatement("insert into testreporttable1(projectname,modulename,requirementname,assignedby,assignedto,ticketdescription) values(?,?,?,?,?,?)");
			pstmt.setString(1, user.getProjectName());		
			pstmt.setString(2, user.getModuleName());
			pstmt.setString(3, user.getRequirementName());
			pstmt.setString(4, user.getUsername());		
			pstmt.setString(5, user.getEmpname());
			pstmt.setString(6, user.getTicketDescription());
			int i = pstmt.executeUpdate();
			if(i>0) {
				System.out.println("success");
				user.setValid(true);
				{
					
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
						
						    PreparedStatement pstmt1=conn.prepareStatement("Insert into notifications(subject,assignedto,projectname,requirementname,modulename,assignedby,status,domain,dateofissue,ticketdescription,empname) values(?,?,?,?,?,?,?,?,?,?,?) ");					
					        pstmt1.setString(1, "EmployeeFunctionalityTesting");
						    pstmt1.setString(2, user.getEmpname());
						    pstmt1.setString(3, user.getProjectName());
						    pstmt1.setString(4, user.getRequirementName());
						    pstmt1.setString(5, user.getModuleName());
						    pstmt1.setString(6, user.getUsername());
						    pstmt1.setString(7, "empfunctionality");
						    pstmt1.setString(8, "testing");
						    pstmt1.setString(9, user.getData());
						    pstmt1.setString(10, user.getTicketDescription());
						    pstmt1.setString(11, user.getUsername());
						    pstmt1.executeUpdate();
						
				}
				
			}
			else {
				System.out.println("failed");
				user.setValid(false);
			}
					
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
