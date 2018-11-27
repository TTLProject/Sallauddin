 	package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectionSteps;
import userbean.Userbean;



@WebServlet("/TestReportInsertServlet")
public class TestReportInsertServlet extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("test Report Insertservlet class..");

		
		String caseId = request.getParameter("test");
		if(null == caseId || caseId.trim().isEmpty()) {
			System.out.println("insert record.....");
			insertRecord(request);
		}else {
			System.out.println("Delete record....");
			deleteRecord(caseId);
		}
	}
	
	private void deleteRecord(String caseId)
	{
		System.out.println("Case ID "+caseId);
		
		String[] caseIDS = caseId.split(",");
		String wherClasuse = "where ";
		for (String caseID : caseIDS){
			if(null != caseID && !caseID.trim().isEmpty())
			wherClasuse = wherClasuse + "TESTCASEID =  '"+caseID+"' OR ";
		}
		
		wherClasuse = wherClasuse.substring(0,wherClasuse.lastIndexOf("OR")).trim();
		System.out.println("Where Clause  =  "+wherClasuse);
		String deleteSQLQuery = "delete from testreporttable "+wherClasuse;
		String deleteSQLQuery1 = "delete from duplicatetable "+wherClasuse;
		ConnectionSteps conn = new ConnectionSteps();
		try
		{
			Connection connection = conn.connection();
			PreparedStatement ps = connection.prepareStatement(deleteSQLQuery);
			PreparedStatement ps1 = connection.prepareStatement(deleteSQLQuery1);
			int updateCount = ps.executeUpdate();
			int updateCount1 = ps1.executeUpdate();
			connection.commit();
			System.out.println("Update Count  "+updateCount);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void insertRecord(HttpServletRequest request)
	{
		String testcaseid[]=request.getParameterValues("testcaseid[]");
		String testdescription[]=request.getParameterValues("testdescription[]");
		String precondition[]=request.getParameterValues("precondition[]");
		String testdesign[]=request.getParameterValues("testdesign[]");
		String expectedresult[]=request.getParameterValues("expectedresult[]");
		/*String actualresult[]=request.getParameterValues("actualresult[]");
		String status[]=request.getParameterValues("status[]");
		String comment[]=request.getParameterValues("comment[]");*/
		HttpSession session= request.getSession();
		Userbean user1=(Userbean) session.getAttribute("testsession");
		
		
		
		
	try {
		for(int i=0;i<=testcaseid.length-1;i++)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ttm", "ttm");
			String insertQuery = "insert into testreporttable(testcaseid,testdescription,precondition,testdesign,expectedresult,projectname,requirementname,modulename,username) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(insertQuery);
			
			
			
			/*System.out.println("testcaseid[i]  "+testcaseid[i]);
			System.out.println("testdescription[i]  "+testdescription[i]);
			System.out.println("precondition[i]  "+precondition[i]);
			System.out.println("testdesign[i]  "+testdesign[i]);
			System.out.println("expectedresult[i]  "+expectedresult[i]);
			System.out.println("user.getProjectName()  "+user.getProjectName());
			System.out.println("user.getProjectName()  "+user.getRequirementName());
			System.out.println("user.getProjectName()  "+user.getModuleName());*/
			System.out.println("Username  "+user1.getUsername());
			
			//int id = Integer.parseInt(testcaseid[i].split("TC-")[1]);
			
			pstmt.setString(1, testcaseid[i]); 
			pstmt.setString(2, testdescription[i]);
			pstmt.setString(3, precondition[i]); 
			pstmt.setString(4, testdesign[i]);
			pstmt.setString(5, expectedresult[i]); 
		/*	pstmt.setString(6, actualresult[i]);
			pstmt.setString(7, status[i]); 
			pstmt.setString(8, comment[i]);*/
			pstmt.setString(6, user1.getProjectName());
			pstmt.setString(7, user1.getRequirementName());
			pstmt.setString(8, user1.getModuleName());
			pstmt.setString(9, user1.getUsername());
			
			int n =pstmt.executeUpdate();
			if(n>0) {
				
				System.out.println("success");
				PreparedStatement pstmt2 = conn.prepareStatement("select * from testreporttable where projectname=? and requirementname=? and testcaseid=? and username=? and modulename=?");
				
				pstmt2.setString(1, user1.getProjectName());
				pstmt2.setString(2, user1.getRequirementName());
				pstmt2.setString(3, testcaseid[i]); 
				pstmt2.setString(5, user1.getModuleName());
				pstmt2.setString(4, user1.getUsername());
				ResultSet rs = pstmt2.executeQuery();
				if(rs.next())
				{
				PreparedStatement pstmt1 = conn.prepareStatement("insert into duplicatetable(projectname,modulename,requirementname,username,testcaseid,id,testdescription,precondition,testdesign,expectedresult ) values(?,?,?,?,?,?,?,?,?,?)");
				
				pstmt1.setString(1, user1.getProjectName());
				
				pstmt1.setString(2, user1.getModuleName());
				pstmt1.setString(3, user1.getRequirementName());
				
				pstmt1.setString(4, user1.getUsername());
				
				pstmt1.setString(5, testcaseid[i]); 
				pstmt1.setInt(6, rs.getInt("id"));
				pstmt1.setString(7,"white");
				pstmt1.setString(8,"white");
				pstmt1.setString(9,"white");
				pstmt1.setString(10,"white");
				int n1=pstmt1.executeUpdate();
				
			}}
			else {
				
				System.out.println("fails");
			}
	
		
		
		
		
		}
	}catch (Exception e) {
System.out.println(e);
	}
		

	}
	
}
