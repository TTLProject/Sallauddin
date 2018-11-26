package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

import dao.ConnectionSteps;
import userbean.Userbean;



@WebServlet("/ExecutiveBugReport3")
public class ExecutiveBugReport3 extends HttpServlet {
	private static final String SAVE_DIR="";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 HttpSession hsh=request.getSession();
		 Userbean user1 = (Userbean) hsh.getAttribute("testsession");
		 System.out.println(user1);
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id[]=request.getParameterValues("id");
		String status0[]=request.getParameterValues("status0");
		String severity[]=request.getParameterValues("severity");
		String priority[]=request.getParameterValues("priority");
		String assignto[]=request.getParameterValues("assignto");
		String reportto[]=request.getParameterValues("reportto");
		String comments[]=request.getParameterValues("comments");
		
	
		
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn = steps.connection();
			int i=0;
			 HttpSession hts=request.getSession();
			  int sumlen=(Integer)hts.getAttribute("sumlen");
			
			    System.out.println(sumlen+"---sumlen");
					    
			    
				for(int a=0;a<=sumlen-1;a++)
				{
					 System.out.println(id[a]+"-------------->");
				String tid=id[a];
				String sts= status0[a];
				String sev=severity[a];
				String pri=priority[a];
				String assign=assignto[a];
				String rep=reportto[a];
				String com=comments[a];
				System.out.println(tid+"\n"+sts+"\n"+sev+"\n"+pri+"\n"+assign+"\n"+rep);
				if(tid!=null && !assign.equals("none") && !sts.equals("fail") && !rep.equals("none")  )
				{
				
			PreparedStatement ps12 = conn.prepareStatement(
					"update TESTREPORTTABLE set STATUS=? , SEVERITY=?, PRIORITY=?,ASSIGNEDTO=? , REPORTEDBY=? ,COMMENTS=?, SCREENSHOT=? where TESTCASEID=? ");
			ps12.setString(1, sts);
			ps12.setString(2, sev);
			ps12.setString(3, pri);
			ps12.setString(4, assign);
			ps12.setString(5, rep);
			ps12.setString(6, com);
			ps12.setString(7, tid);
			ps12.setString(8, tid);
			 i = ps12.executeUpdate();
				
			if (i >0) 
			{
				
				 System.out.println("Super Success");
					
						PreparedStatement ps4=conn.prepareStatement("Insert into notifications(ASSIGNEDBY, SUBJECT,DATEOFISSUE,STATUS,ASSIGNEDTO,DOMAIN,PROJECTNAME,REQUIREMENTNAME,MODULENAME,TICKETDESCRIPTION,EXECUTIVE,EMPNAME,TESTCASEID) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
						
						ps4.setString(1, rep);//reported
						ps4.setString(2, "Test Send to Fix the Bug");//sub
						ps4.setString(3,"");//doi
						ps4.setString(4, sts);//status
						ps4.setString(5,assign);//assign
						ps4.setString(6, "testing");
						
						ps4.setString(7, user1.getProjectName());
						ps4.setString(8, user1.getRequirementName());
						ps4.setString(9, user1.getModuleName());
						ps4.setString(10, user1.getTicketDescription());
						ps4.setString(11, "executive name");
						ps4.setString(12, assign);
						ps4.setString(13, tid);
						int i1 = ps4.executeUpdate();
					if(i1>0)
					{
	    					out.println("<script type=\"text/javascript\">");
						   out.println("alert('Notification Sent Successfully.');");
						  
						   out.println("location='ExecutiveBugReport.jsp';");
						   out.println("</script>");
					}
					
			}				
					
				
			}
			else
			{
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('Update not success , Fields are Empty.');");
				  
				   out.println("location='ExecutiveBugReport5.jsp';");
				   out.println("</script>");
			}
				}
				    
				// RequestDispatcher rr=request.getRequestDispatcher("ExecutiveBugReport.jsp");
				
				
			} 
		 catch (Exception e) 
		{
			System.out.println(e);
		}
			}

}
