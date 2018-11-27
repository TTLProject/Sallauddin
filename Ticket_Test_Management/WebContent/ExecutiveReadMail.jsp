<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@page errorPage="500.jsp"%>
<html lang="en">
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
%>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="images/favicon.png">

    <title>Ticket&Test Management</title>

    <!--Core CSS -->
    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style1.css" rel="stylesheet">
    <link href="css/style1-responsive.css" rel="stylesheet" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    <style>
    span.item{
    display:block;
    height:5px;
    text-align:center; 
    width:80px;
    font-size:11pt;
    }
    </style>
    
    
</head>

<body>
<%
		Userbean user = (Userbean) session.getAttribute("session2");
	%>
<section id="container" >
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

   <a href="ExecutiveIndex.jsp" class="logo">
        <h4 style="color:white;"><b><i>Ticket&Test Management</i></b></h4>
    </a>
	
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
	
</div>
<!--logo end-->
<div class="nav notify-row" id="top_menu">
    <!--  notification start -->
    <ul class="nav top-menu">
        <!-- settings start -->
        <!-- settings end -->
        <!-- inbox dropdown start-->
        <div>
       <h2 style="color:white; align:center; padding-left:100%"><b><i>Notifications</i></b></h2>	
</div>
<!-- inbox dropdown end -->
        <!-- notification dropdown start-->
        
        <!-- notification dropdown end -->
    </ul>
    <!--  notification end -->
</div>
<!-- <h5 align="right"><a style="color:white;" href="Logout.jsp"><i class="fa fa-key"></i><b> Log Out</b></a></h5> -->
<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
       
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            
                <%try {
                	ConnectionSteps steps = new ConnectionSteps();
                	Connection conn=steps.connection();
                	
        PreparedStatement pstmt = conn.prepareStatement("select * from registrationtable where username=?");
        pstmt.setString(1,user.getUsername());
        ResultSet rs = pstmt.executeQuery();
       
        while ( rs.next()) { %>
 
                  
        
                           <img width='50' height='50' src=DisplayPhotoServlet?id=<%=rs.getString("username")%> style="width: 50px">     
                <span class="username"><%=user.getUsername() %></span>
                <b class="caret"></b>
            </a>
            
        <% }

        
    }
    catch(Exception ex) {
ex.printStackTrace();
    } %>            
            
            <ul class="dropdown-menu extended logout">
                <!-- <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li> -->
                <li><a href="Logout.jsp"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
        
    </ul>
    <!--search & user info end-->
</div>

</header><!--header end-->
<!--header end-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="EditExecutiveProfile.jsp">
                        <i class="fa fa-pencil"></i>
                        <span>EditProfile</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-laptop"></i>
                        <span>Ticket Management</span>
                    </a>
                    <ul class="sub">
                        <li><a href="AddExecutiveTicket.jsp">Add Ticket</a></li>
                        <li><a href="EditExecutiveTicket.jsp">Edit Ticket</a></li>
                        <li><a href="ViewExecutiveTicket.jsp">View Ticket</a></li>
                    </ul>
                </li>
                
                
                 <%
                String desig=user.getDesignation();
				if((desig.equals("executivequalityanalyst"))) {
					%>
					  <li class="sub-menu">
	                    <a href="javascript:;">
	                        <i class="fa fa-check-square-o"></i>
	                        <span>Test Management</span>
	                    </a>
	                    <ul class="sub">
	                        <li><a href="ExecutiveTestReport.jsp">Prepare TestReport</a></li>
	                        <li><a href="ExecutiveTestData.jsp">Prepare TestData </a></li>
	                        <li><a href="ExecutiveBugReport.jsp">Prepare BugReport</a></li>
	                        <li><a href="ViewExecutiveTestReport.jsp">ViewTestReport</a></li>
							 <li><a href="ModifyExecutiveTestReport.jsp">ModifyTestReport</a></li>
							
	                    </ul>
	                </li>
				<% }
				
                %>
                
               <li>
                    <a href="ExecutiveNotifications.jsp">
                        <i class="fa fa-bell-o"></i>
                        <span>Notifications </span>
                    </a>
                </li>
               
               
                
                
            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
    <!--main content start-->
    <section id="main-content" >
        <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-sm-8">
 <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
             
      
              
            </div>
            <!-- /.box-header -->
           <%
          
          /*  String assignby=request.getParameter("assignby");
           String assignto=request.getParameter("assignto");
          
           String tid=request.getParameter("ticketid"); */
           int nid=Integer.parseInt(request.getParameter("notificationid"));
           
           
           ConnectionSteps steps = new ConnectionSteps();
  			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("select * from notifications where id=?");
           pstmt.setInt(1, nid);
         
           ResultSet rs = pstmt.executeQuery();
           
           if(rs.next()){
        	   String subject=rs.getString("subject");
        	   if(subject.equals("AskingforApproval")){
        	   
       
           %>
        
           
           
            
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3>Asking for Approval..</h3><br>
                <h5>From: <%=rs.getString("empname") %>
                  
              </div>
              <!-- /.mailbox-read-info -->
             <br><hr>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <p>Hello <%=user.getUsername() %>,</p>

                <p style=color:navy><%=rs.getString("empname") %> issued ticket to <%=rs.getString("assignedto") %></p>
          
           <div id="table"  class="table-editable">
             <table  class="table" border="3">
           <tr>
         
        <th>Ticket Description</th>
		<th>Project Name</th>
		<th>Module Name</th>
		<th>Requirement Name</th>
		<th>Ticket Assigned By</th>
		<th>Ticket Assigned To</th>
		<th>Date of Issue</th>
		</tr>
		<tr>
		
		<td><%=rs.getString("ticketdescription") %></td>
		<td><%=rs.getString("projectname") %></td>
		<td><%=rs.getString("modulename") %></td>
		<%if(rs.getString("requirementname")==null){ %>
		<td></td>
		<%}else{ %>
		<td><%=rs.getString("requirementname") %></td>
		<%} %>
		<td><%=rs.getString("assignedby")%></td>
		<td><%=rs.getString("assignedto")%></td>
		<td><%=rs.getString("dateofissue")%></td>
		
		</tr>
           
           
           
           </table>
           </div><br>
               <form action="ApproveNotifications.jsp" method="post" id="form1">
            <input type="hidden" name="ename" value=<%=rs.getString("empname") %>>
                <input type="hidden" name="assignto" value=<%=rs.getString("assignedto") %>>
               <input type="hidden" name="assignby" value=<%=rs.getString("assignedby") %>>
                <input type="hidden" name="ticketid" value=<%=rs.getString("ticketid") %>>
             <input type="hidden" name="nid" value=<%=nid %>>
            
                 </form>
                  <form action="DeclineNotifications.jsp" method="post" id="form2"> 
               <input type="hidden" name="assignto" value=<%=rs.getString("assignedto") %>>
               <input type="hidden" name="assignby" value=<%=rs.getString("assignedby") %>>
                <input type="hidden" name="ticketid" value=<%=rs.getString("ticketid") %>>
               
                 </form>
               <input type="submit" value="Approve"  form="form1">&emsp;&emsp;
            
               
                      <input type="submit" value="Decline" form="form2">
    
                <br><br>

                <p >Regards,    <%=rs.getString("empname") %></p>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <%}else if(subject.equals("FunctionalityTesting")){ %>
            <div id="alert_message"></div>
             <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3>Asking for FuctionalityTesting</h3><br>
                <h5>From: <%=rs.getString("assignedby") %>
                  
              </div>
              <!-- /.mailbox-read-info -->
             <br><hr>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <p>Hello <%=user.getUsername() %>,</p>

                <p style=color:navy><%=rs.getString("assignedby") %> sent project for FunctionalityTesting</p>
          
           <div id="table"  class="table-editable">
             <table  class="table" border="3">
           <tr>
         
        <th>Ticket Description</th>
		<th>Project Name</th>
		<th>Module Name</th>
		<th>Requirement Name</th>
		<th>Assigned By</th>
		<th>Assigned To</th>
		<th>Date of Issue</th>
		</tr>
		<tr>
		
		<td><%=rs.getString("ticketdescription") %></td>
		<td><%=rs.getString("projectname") %></td>
		<td><%=rs.getString("modulename") %></td>
		<%if(rs.getString("requirementname")==null){ %>
		<td></td>
		<%}else{ %>
		<td><%=rs.getString("requirementname") %></td>
		<%} %>
		<td><%=rs.getString("assignedby")%></td>
		<td><%=rs.getString("assignedto")%></td>
		<td><%=rs.getString("dateofissue")%></td>
		
		</tr>
           
           
           
           </table>
           </div><br>
             <p >Choose ..............................</p> 
     
    Select Employee:::<select style="width:200px; overflow:hidden" name="empname" id="empname">
    <option>--select--</option>
    <%PreparedStatement pstmt1 =conn.prepareStatement("select * from registrationtable where designation=?");
    pstmt1.setString(1, "qualityanalyst");
    
    ResultSet rs1 = pstmt1.executeQuery();
    while(rs1.next()){
   
     %>
    
<option value=<%=rs1.getString("username") %>><%=rs1.getString("username") %></option>


<% }%>


    </select>
    
    <input type="hidden" name="nid" value=<%=nid %> id="nid">
    
    
    <button type="button" name="save" id="save" class="btn btn-info" >Submit</button>
                <br><br>
 


                <p >Regards,    <%=rs.getString("assignedby") %></p>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            
            
            
            
            
            
            <%}else{ %>
            
              <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <h3>Message Subject Is Placed Here</h3><br>
                <h5>From: help@example.com
                  
              </div>
              <!-- /.mailbox-read-info -->
             <br><hr>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <p>Hello John,</p>

                <p style=color:navy>Ticket was Approved</p>
                <p>Message body palced here</p>
                

                <p >Regards,<br>sana</p>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <%} }%>
            
            <!-- /.box-body -->
            
            <!-- /.box-footer -->
            
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>
            </div>
        </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<!--right sidebar start-->
<div class="right-sidebar">
<div class="search-row">
    <input type="text" placeholder="Search" class="form-control">
</div>
<div class="right-stat-bar">
<ul class="right-side-accordion">
<li class="widget-collapsible">
    <a href="#" class="head widget-head red-bg active clearfix">
        <span class="pull-left">work progress (5)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row side-mini-stat clearfix">
                <div class="side-graph-info">
                    <h4>Target sell</h4>
                    <p>
                        25%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="target-sell">
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info">
                    <h4>product delivery</h4>
                    <p>
                        55%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="p-delivery">
                        <div class="sparkline" data-type="bar" data-resize="true" data-height="30" data-width="90%" data-bar-color="#39b7ab" data-bar-width="5" data-data="[200,135,667,333,526,996,564,123,890,564,455]">
                        </div>
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info payment-info">
                    <h4>payment collection</h4>
                    <p>
                        25%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="p-collection">
						<span class="pc-epie-chart" data-percent="45">
						<span class="percent"></span>
						</span>
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info">
                    <h4>delivery pending</h4>
                    <p>
                        44%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="d-pending">
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="col-md-12">
                    <h4>total progress</h4>
                    <p>
                        50%, Deadline 12 june 13
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div style="width: 50%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-info">
                            <span class="sr-only">50% Complete</span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head terques-bg active clearfix">
        <span class="pull-left">contact online (5)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Jonathan Smith</a></h4>
                    <p>
                        Work for fun
                    </p>
                </div>
                <div class="user-status text-danger">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Anjelina Joe</a></h4>
                    <p>
                        Available
                    </p>
                </div>
                <div class="user-status text-success">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/chat-avatar2.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">John Doe</a></h4>
                    <p>
                        Away from Desk
                    </p>
                </div>
                <div class="user-status text-warning">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Mark Henry</a></h4>
                    <p>
                        working
                    </p>
                </div>
                <div class="user-status text-info">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Shila Jones</a></h4>
                    <p>
                        Work for fun
                    </p>
                </div>
                <div class="user-status text-danger">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <p class="text-center">
                <a href="#" class="view-btn">View all Contacts</a>
            </p>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head purple-bg active">
        <span class="pull-left"> recent activity (3)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        just now
                    </p>
                    <p>
                        <a href="#">Jim Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        2 min ago
                    </p>
                    <p>
                        <a href="#">Jane Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        1 day ago
                    </p>
                    <p>
                        <a href="#">Jim Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head yellow-bg active">
        <span class="pull-left"> shipment status</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="col-md-12">
                <div class="prog-row">
                    <p>
                        Full sleeve baby wear (SL: 17665)
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            <span class="sr-only">40% Complete</span>
                        </div>
                    </div>
                </div>
                <div class="prog-row">
                    <p>
                        Full sleeve baby wear (SL: 17665)
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                            <span class="sr-only">70% Completed</span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</li>
</ul>
</div>
</div>
<!--right sidebar end-->

</section>

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
<script src="js/jquery.js"></script>
<script src="bs3/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--Easy Pie Chart-->
<script src="js/easypiechart/jquery.easypiechart.js"></script>
<!--Sparkline Chart-->
<script src="js/sparkline/jquery.sparkline.js"></script>
<!--jQuery Flot Chart-->
<script src="js/flot-chart/jquery.flot.js"></script>
<script src="js/flot-chart/jquery.flot.tooltip.min.js"></script>
<script src="js/flot-chart/jquery.flot.resize.js"></script>
<script src="js/flot-chart/jquery.flot.pie.resize.js"></script>


<!--common script init for all pages-->
<script src="js/scripts.js"></script>


<script>
		$(function() {
		$( "#datepicker,#datepicker" ).datepicker();
		});
	</script>
		<script type="text/javascript" src="edit/js/jquery-2.1.4.min.js"></script>
	<script src="edit/js/jquery-ui.js"></script>
	


</body>
</html>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
	
	$('#save').click(function(){
	/* var nid;
	var empname;
		 $('.nid').each(function(){
				  nid.push($(this).value());
			  });
	     $('.empname').each(function(){
				  empname.push($(this).value());
			  }); */
			  var nid= document.getElementById("nid").value;
			  var empname= document.getElementById("empname").value;
			   $.ajax({
				   url:"FunctionalityTestingServlet",
				   method:"POST",
				   
				   data:{nid:nid, empname:empname},
				   success:function(data){
					   $('#alert_message').html('<div class="alert alert-success" align="center">'+data+'</div>');
					   
				  
				   }
				  });
			  setInterval(function(){
				     $('#alert_message').html('');
				    }, 5000);
				 });
	
		});
</script>