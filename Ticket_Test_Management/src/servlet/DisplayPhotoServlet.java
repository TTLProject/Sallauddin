package servlet;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ConnectionSteps;
@WebServlet("/DisplayPhotoServlet")
public class DisplayPhotoServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
        	ConnectionSteps steps = new ConnectionSteps();
        	Connection conn=steps.connection();
        	
            PreparedStatement ps = conn.prepareStatement("select photo from registrationtable where username=?");
            String id = request.getParameter("id");
            ps.setString(1,id);
            System.out.println("1");
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
    			//System.out.println("rs next enter");
    			Blob blob= rs.getBlob("photo");
    			byte byteArray[]=blob.getBytes(1, (int)blob.length());
    			response.setContentType("image/gif");
    			 OutputStream os = response.getOutputStream(); 
    			 os.write(byteArray); 
    			 os.flush(); 
    			 os.close();
    			 
    		}
    	
           /* rs.next();
            System.out.println("2");
            Blob  b = rs.getBlob("photo");
            response.setContentType("image/jpeg");
            System.out.println("3");
            response.setContentLength( (int) b.length());
            System.out.println("6");
            InputStream is = b.getBinaryStream();
            OutputStream os = response.getOutputStream();
            System.out.println("4");
            byte buf[] = new byte[(int) b.length()];
            is.read(buf);
            os.write(buf);
            os.close();
            System.out.println("5");
       */ }
        catch(Exception ex) {
             System.out.println(ex.getMessage());
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}
