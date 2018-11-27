package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectionSteps;

@WebServlet("/GetTestCaseIDServlet")
public class GetTestCaseIDServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String projectName = request.getParameter("projectName");
		String moduleName = request.getParameter("moduleName");
		String reqName = request.getParameter("reqName");
		//System.out.println("Project Name  "+projectName+" Mod Name  "+moduleName+" req Name  "+reqName);
		String testCaseID  = getTestCaseID(projectName,moduleName,reqName);
		response.setContentType("text/plain");
		System.out.println("testCaseID   "+testCaseID);
		response.getWriter().write(testCaseID);
	}

	private String getMaxValue(String testID) {
		if(null != testID && !testID.trim().isEmpty()) {
			System.out.println(testID.split("-")[0]);
			System.out.println(testID.split("-")[1]);
			Integer val = Integer.parseInt(testID.split("-")[1])+1;
			if(val.toString().length()==1) {
				testID = testID.split("-")[0]+"-0"+val;
			}else
				testID = testID.split("-")[0]+"-"+val;

		}
		return testID;
	}

	private String frameSQLQuery(String projectName,String modName,String reqName) {
		String sqlQuery = "select MAX(testcaseid) from testreporttable ";
		String whereClass = " where ";
		if(null != projectName)
			whereClass += "PROJECTNAME = '"+projectName+"' AND ";
		if(null != reqName)
			whereClass += "REQUIREMENTNAME = '"+reqName+"' AND ";
		if(null != modName)
			whereClass += "MODULENAME = '"+modName+"' AND ";
		
		if(whereClass.lastIndexOf("AND")>0)
			whereClass = whereClass.substring(0,whereClass.lastIndexOf("AND"));
		sqlQuery = sqlQuery+whereClass;
	  return sqlQuery;
	}

	private String getTestCaseID(String projectName,String modName,String reqName) {
		Connection connection = null;
		String testcaseID = "";
		String sqlQuery = frameSQLQuery(projectName, modName, reqName);
		System.out.println("sqlQuery  "+sqlQuery);
		try {
			connection   = new ConnectionSteps().connection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sqlQuery);
			while(rs.next())
			{
				testcaseID = rs.getString(1);
				if(null == testcaseID)
					testcaseID = "TC-01";
				else
					testcaseID = getMaxValue(testcaseID);
			}

		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("Error while occured retrieving project information  "+e.getMessage());
		}
		//System.out.println("testcaseID  "+testcaseID);
		return testcaseID;
	}



}