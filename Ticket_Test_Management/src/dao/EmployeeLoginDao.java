package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userbean.Userbean;

public class EmployeeLoginDao {

	public static void insert(Userbean user) {
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("select * from registrationtable where username=? and password=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword()); 
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				 user.setValid(true);
				 user.setId(rs.getInt("ID"));
				 user.setName(checkIsNull(rs.getString("name")));
				 user.setUsername(checkIsNull(rs.getString("username")));
				 user.setPassword(checkIsNull(rs.getString("password")));
				 user.setConfirmpassword(checkIsNull(rs.getString("confirmpassword")));
				 user.setDomain(checkIsNull(rs.getString("domain")));
				 user.setDesignation(checkIsNull(rs.getString("designation")));
				user.setEmail(checkIsNull(rs.getString("email")));
				user.setMobile(Long.parseLong(rs.getString("mobile")));
				user.setEmpid(checkIsNull((rs.getString("empid"))));
				user.setWebmail(checkIsNull(rs.getString("webmail")));
			}
			else {
				
				user.setValid(false);
			}
			
		} catch (Exception e) {

			System.out.println(e);
		}
		
	}
	
	private static String checkIsNull(String paramValue) {
		if(null == paramValue || paramValue.trim().isEmpty())
			return "-";
		return paramValue;
	}

}
