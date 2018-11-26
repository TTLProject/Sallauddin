package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import userbean.Userbean;

public class EditProfileDao {

	public static void insert(Userbean user) {


		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			System.out.println(user.getName());
			System.out.println(user.getEmpid());
			System.out.println(user.getDomain());
			System.out.println(user.getPassword());
			System.out.println(user.getConfirmpassword());
			System.out.println(user.getEmail());
			System.out.println(user.getWebmail());
			System.out.println(user.getMobile());
			System.out.println(user.getDesignation());
			System.out.println(user.getId());

			String updateQuery = "update registrationtable set name=?,empid=?,domain=?,password=?,"
					+ "confirmpassword=?,email=?,webmail=?,mobile=?,designation=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(updateQuery);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmpid());
			pstmt.setString(3, user.getDomain());
			pstmt.setString(4, user.getPassword());
			pstmt.setString(5, user.getConfirmpassword());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getWebmail());
			pstmt.setLong(8, user.getMobile());
			pstmt.setString(9, user.getDesignation());
			pstmt.setInt(10, user.getId());


			int n =pstmt.executeUpdate();
			System.out.println("n Value "+n);
			if(n==1)
			{
				System.out.println("success");
				user.setValid(true);
			}
			else
			{
				System.out.println(" failed");
				user.setValid(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}



	}
}





