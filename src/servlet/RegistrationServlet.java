package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.ConnectionSteps;

import userbean.Userbean;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet{
	private static final String SAVE_DIR="";

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            /*String savePath =getServletContext().getRealPath("images") + File.separator + SAVE_DIR;
                File fileSaveDir=new File(savePath);
                if(!fileSaveDir.exists()){
                    fileSaveDir.mkdir();
                }*/
        ConnectionSteps steps = new ConnectionSteps();
		String name = request.getParameter("name");
		String domain=request.getParameter("domain");
		String id =request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmpassword=request.getParameter("confirmpassword");
		String email = request.getParameter("email");
		String webmail=request.getParameter("webmail");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String designation=request.getParameter("designation");
		/*Part part=request.getPart("path");
        String fileName=extractFileName(part);
        part.write(savePath + File.separator + fileName);
        */
		/* author - Venkatesh
		 * Description - Upload image
		 * 
		 */
		InputStream inputStream = null;
		Part filePart = request.getPart("photo");
        if (filePart != null) {
           
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
		Userbean user=new Userbean();
		user.setName(name);
		user.setDomain(domain);
		user.setEmpid(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setConfirmpassword(confirmpassword);
		user.setEmail(email);
		user.setWebmail(webmail);
		user.setMobile(mobile);
		user.setDesignation(designation);
		
	//	RegistrationDao.insert(user);
		try {
		/*	String username=user.getUsername();
			String email=user.getEmail();
			String webmail=user.getWebmail();
			*/
			
			if(password.equals(confirmpassword)) 
			{	
			Connection conn=steps.connection();
			PreparedStatement pstmt1 =conn.prepareStatement("select * from registrationtable");
			ResultSet rs = pstmt1.executeQuery();
			HashSet<String> hs = new HashSet<>();
			while (rs.next()) {
				hs.add(rs.getString("username"));
			}
			if(hs.contains(username)) {
				user.setValid(false);
			}else {
				user.setValid(true);
				PreparedStatement pstmt2 =conn.prepareStatement("select * from registrationtable");
				ResultSet rs1 = pstmt2.executeQuery();
				HashSet<String> hs1= new HashSet<>();
				while(rs1.next())
				{
					hs1.add(rs1.getString("email"));
				}
				/*Iterator<String> itr=hs1.iterator();  
				  while(itr.hasNext()){  
				   System.out.println(itr.next()); */
			if(hs1.contains(email)) 
			{
				user.setValid1(false);
			}else {
				user.setValid1(true);
				PreparedStatement pstmt3 =conn.prepareStatement("select * from registrationtable");
				ResultSet rs2 = pstmt3.executeQuery();
				HashSet<String> hs2= new HashSet<>();
				while(rs2.next())
				{
					hs2.add(rs2.getString("webmail"));
				}
				
			if(hs2.contains(webmail)) 
			{
				user.setValid2(false);
				
			}
			else {
				user.setValid2(true);
				PreparedStatement pstmt = conn.prepareStatement("insert into registrationtable(name,empid,domain,username,password,confirmpassword,email,webmail,mobile,designation,photo) values(?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getEmpid());
				pstmt.setString(3,user.getDomain());
				pstmt.setString(4,user.getUsername());
				pstmt.setString(5,user.getPassword());
				pstmt.setString(6,user.getConfirmpassword());
				pstmt.setString(7,user.getEmail());
				pstmt.setString(8,user.getWebmail());
				pstmt.setLong(9,user.getMobile());
				pstmt.setString(10,user.getDesignation());
				   System.out.println("blob");
		            pstmt.setBinaryStream(11, inputStream,(int) filePart.getSize());
				int i =pstmt.executeUpdate();
				if(i==1)
				{
					System.out.println("success");
					user.setValid2(true);
				}
				else
				{
					System.out.println("not success");
					user.setValid2(false);
				}
			}
			}
		}
			}else {
				response.sendRedirect("Registration4.jsp");
			}
		 boolean status = user.isValid();
		 System.out.println("adminstatus:::"+status);
		 if (status)
		 {
			boolean status1=user.isValid1();
			if(status1) {
				boolean status2=user.isValid2();
				System.out.println(status2);
				if(status2) {
					System.out.println(status2);
				    HttpSession session=request.getSession(true);
					session.setAttribute("registration", user);
					response.sendRedirect("Login.jsp");
					
				}
				else {
					
					response.sendRedirect("Registration3.jsp");
				}
				
			}else {
				response.sendRedirect("Registration2.jsp");
			}
		} else 
		{
			response.sendRedirect("Registration1.jsp");
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
     	}
}
	
