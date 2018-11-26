package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import userbean.Userbean;

public class FunctionalityNotification {

	public static void notify(Userbean user) {

		ConnectionSteps steps =new ConnectionSteps();
		try {
			Connection conn= steps.connection();
			PreparedStatement pstmt=conn.prepareStatement("select * from tickettable where id=?");
			pstmt.setInt(1, user.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
			
				if(rs.getString("status").equals("FunctionalityTesting")) {
					
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
				PreparedStatement pstmt1=conn.prepareStatement("Insert into notifications(assignedby,subject,assignedto,dateofissue,domain,projectname,requirementname,modulename,ticketdescription,empname,status) values(?,?,?,?,?,?,?,?,?,?,?)");
				pstmt1.setString(1, rs.getString("username"));
				pstmt1.setString(2, "FunctionalityTesting");
				pstmt1.setString(3, user.getValue());
				pstmt1.setString(4, user.getData());
				pstmt1.setString(5, "testing");
				pstmt1.setString(6, rs.getString("projectname"));
				pstmt1.setString(7, rs.getString("requirementname"));
				pstmt1.setString(8, rs.getString("modulename"));
				pstmt1.setString(9, rs.getString("ticketdescription"));
				pstmt1.setString(10, rs.getString("username"));
				pstmt1.setString(11, "funtionality");
				pstmt1.executeUpdate();
				
				
				
				}
			}
					
					
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}
