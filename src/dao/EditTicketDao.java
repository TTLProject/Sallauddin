package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import userbean.Userbean;

public class EditTicketDao {

	public static void update(Userbean user) {
        try {
       
        	ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
		PreparedStatement pstmt = conn.prepareStatement("update tickettable set "+user.getColumn_name()+"=?"+"where id=?");
		pstmt.setString(1, user.getValue());
		pstmt.setInt(2, user.getId());
		
		
		int i=pstmt.executeUpdate();
		if(i>0) {
			
			System.out.println("update success");
			user.setValid(true);
		}else {
			System.out.println("update failed");
			user.setValid(false);
		}
	 	
        }catch(Exception e) {
        	
        	System.out.println(e);
        }
	}

}
