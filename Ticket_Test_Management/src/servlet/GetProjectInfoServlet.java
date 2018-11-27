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

import org.json.JSONObject;

import dao.ConnectionSteps;

@WebServlet("/GetProjectInfoServlet")
public class GetProjectInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("Entered into GetUserServlet method.....");
		String projectName = request.getParameter("projectName");
		String type        = request.getParameter("type");
		//System.out.println("projectName  "+projectName);
		System.out.println("type  "+type);
		JSONObject projectsInfo  = null;
		if("project".equalsIgnoreCase(type)) {
			projectsInfo =	getProjectInformation(projectName);
		}
		else {
			String modName = request.getParameter("modName");
			projectsInfo =	getProjectInformation(projectName,modName);
		}
		//System.out.println("projectsInfo   "+projectsInfo);
		response.setContentType("text/plain");

		response.getWriter().write(projectsInfo.toString());
	}
	
	/**
	 * fetching requirement and module information on project names.
	 * @param projectName
	 * @return
	 */
	private JSONObject getProjectInformation(String projectName,String modName)
	{
		Connection connection = null;
		String sqlQuery = "SELECT REQUIREMENTNAME,MODULENAME FROM tickettable"
				+ " where PROJECTNAME ='"+projectName+"' AND MODULENAME = '"+modName+"'";
		String reqName  = "";
		JSONObject projectInfo = new JSONObject();
		try
		{
			connection   = new ConnectionSteps().connection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sqlQuery);
			while(rs.next()){
				if(!rs.getString("REQUIREMENTNAME").trim().isEmpty()) {
					reqName += rs.getString("REQUIREMENTNAME")+",";
		           }
			}
			if(reqName.lastIndexOf(",")>0) {
				reqName = reqName.substring(0, reqName.lastIndexOf(","));
			}
			projectInfo.put("requirement", reqName);

		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("Error while occured retriving project information  "+e.getMessage());
		}
		return projectInfo;
	}


	/**
	 * fetching requirement and module information on project names.
	 * @param projectName
	 * @return
	 */
	private JSONObject getProjectInformation(String projectName)
	{
		Connection connection = null;
		String sqlQuery = "SELECT REQUIREMENTNAME,MODULENAME FROM tickettable"
				+ " where PROJECTNAME ='"+projectName+"'";
//		String reqName  = "";
		String modName  = "";
		JSONObject projectInfo = new JSONObject();
		try
		{
			connection   = new ConnectionSteps().connection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sqlQuery);
			while(rs.next()){
/*				if(!rs.getString("REQUIREMENTNAME").trim().isEmpty()) {
					reqName += rs.getString("REQUIREMENTNAME")+",";
		           }
*/ 				if(!rs.getString("MODULENAME").trim().isEmpty()) {
					modName += rs.getString("MODULENAME")+",";
				}
		}

			if(modName.lastIndexOf(",")>0) {
				modName =modName.substring(0, modName.lastIndexOf(","));
			}


			projectInfo.put("module", modName);


		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("Error while occured retriving project information  "+e.getMessage());
		}
		return projectInfo;
	}



}