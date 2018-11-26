<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.io.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.servlet.http.Part"%>

<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page errorPage="500.jsp"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<% 
HttpSession hsh=request.getSession();
Userbean user1 = (Userbean) hsh.getAttribute("testsession");
System.out.println(user1);

String id=request.getParameter("tcid");

System.out.println(id);


try {
	ConnectionSteps steps = new ConnectionSteps();
	Connection conn = steps.connection();
	int i=0;
	 HttpSession hts=request.getSession();
	  int sumlen=(Integer)hts.getAttribute("sumlen");
	
	    System.out.println(sumlen+"---sumlen");
			  
	    //
	    
	     File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i1 = fileItems.iterator();

       
         
         while ( i1.hasNext () ) {
            FileItem fi = (FileItem)i1.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               System.out.println("Uploaded Filename: " + filePath + 
               fileName );
            }
         }
        
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
     
	   System.out.println("File not uploaded");
   }
	    
	    

		    
		// RequestDispatcher rr=request.getRequestDispatcher("ExecutiveBugReport.jsp");
		
		
	} 
catch (Exception e) 
{
	System.out.println(e);
}%>
