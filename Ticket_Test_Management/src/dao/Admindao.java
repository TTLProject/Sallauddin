package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import userbean.Userbean;

public class Admindao {

	public static void insert(Userbean user) {

		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("select * from admin where username=? and password=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword()); 
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				 user.setValid(true);
				System.out.println("login success");
			}
			else {
				
				user.setValid(false);
				System.out.println("login failed");
			}
			
		} catch (Exception e) {

			System.out.println(e);
		}
		
		
		
	}

}
