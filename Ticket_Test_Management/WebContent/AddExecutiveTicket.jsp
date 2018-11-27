<!DOCTYPE html>
<%@page errorPage="500.jsp"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
	<link rel="stylesheet" href="edit/css/jquery-ui.css"/>
	
	
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
       <h2 style="color:white; align:center; padding-left:120%"><b><i>AddTicket</i></b></h2>	
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
                        <li><a href="#">Add Ticket</a></li>
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
    
	   <section id="main-content" style="background: url(edit/images/bg3.jpg)"no-repeat;>
        <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-sm-12">
               
<div class="w3l-main">
<div class="w3l-from">
		<form action="TicketServlet" method="post">	
		
		<%
		ConnectionSteps steps = new ConnectionSteps();
		Connection conn = steps.connection();
PreparedStatement pstmt = conn.prepareStatement("select * from tickettable where   username=? and id=(select MAX(id) from tickettable where username=?)");
pstmt.setString(1, user.getUsername());
pstmt.setString(2, user.getUsername());

ResultSet rs = pstmt.executeQuery();
String s;
if(rs.next()){
s=rs.getString("ticketid");	
int n1=s.length();
//System.out.println(s.substring(3));
int r=Integer.parseInt(s.substring(4)) + 1;
 String s2="TID-00"+r;
 //System.out.println(s2);
 //System.out.println(s2.length());
 int n2=s2.length();
 int n3=n1+1;

if(n1==n2){
	
	 %>
	 	<div class="w3l-user">
				<label class="head">Ticket-Id<span class="w3l-star"> * </span></label>
				<input type="text" name="ticketid" placeholder=""  required="" value=<%=s2%>>
				</div>
			
		<%
  } 

else if(n3==n2){
	int r1=Integer.parseInt(s.substring(4)) + 1;
	 String s3="TID-0"+r1;
	// System.out.println(s3);
	 %>
	 	<div class="w3l-user">
				<label class="head">Ticket-Id<span class="w3l-star"> * </span></label>
				<input type="text" name="ticketid" placeholder=""  required="" value=<%=s3%>>
				</div>
	 <% 
}else{
	int r2=Integer.parseInt(s.substring(4)) + 1;
	 String s4="TID-"+r2;
	 //System.out.println(s4);
	 %>
	 	<div class="w3l-user">
				<label class="head">Ticket-Id<span class="w3l-star"> * </span></label>
				<input type="text" name="ticketid" placeholder=""  required="" value=<%=s4%>>
				</div>
	 <% 
	
}

}
else{
	 String id ="TID-001";
	
	%>

	<div class="w3l-user" contenteditable="false">
	<label class="head">Ticket-Id<span class="w3l-star"> * </span></label>
	<input type="text" name="ticketid" placeholder=""  required="" value=<%=id%> readonly="readonly">
	</div>
<%} %>
			<div class="w3l-rem">
				<div class="w3l-right">
					<label class="head">Ticket-description<span class="w3l-star"> * </span></label>
					<textarea name="ticketdescription"></textarea>
				</div>	
			
			</div>
			<!--<div  class="w3l-options1">
				<label class="head">Domain<span class="w3l-star"> * </span></label>	
					<select class="category1" required="">
						<option></option>
						<option>java</option>
					    <option>dotnet</option>
                        <option>testing</option>						
                        						
					
						
					</select>
			</div>-->
			<input type="hidden" name="username" value=<%=user.getUsername() %>>
			<div class="w3l-user">
				<label class="head">Project Name<span class="w3l-star"> * </span></label>
				<input type="text" name="projectname" placeholder=""  "required="">
			</div>
			<div class="w3l-user">
				<label class="head">Module Name<span class="w3l-star"> * </span></label>
				<input type="text" name="modulename"  placeholder="" required="">
			</div>
			<div class="w3l-user">
				<label class="head">Requirement Name</label>
				<input type="text" name="requirementname"  placeholder="">
			</div>
		
			<div  class="w3l-options1">
				<label class="head">Assigned To<span class="w3l-star"> * </span></label>	
					<select class="category1" required="" name="assignedto">
						<option>select</option>
							  <% 
					    ConnectionSteps steps2 = new ConnectionSteps();
						Connection conn2 = steps2.connection();
				PreparedStatement pstmt2 = conn2.prepareStatement("select * from registrationtable where domain=?");
			
			  pstmt2.setString(1, user.getDomain());
			  ResultSet rs2 = pstmt2.executeQuery();
			  while(rs2.next()){%>
						<option value=<%=rs2.getString("username")%>><%=rs2.getString("username")%></option>
				<%
			  }

                %>	   		
						
					 					
                  <%--  <%
			  }

%> --%>
					</select>
			</div>
			
			
			<div  class="w3l-options1">
				<label class="head">Assigned By<span class="w3l-star"> * </span></label>	
					<select class="category1" required="" name="assignedby">
					
						<option value=<%=user.getUsername() %>><%=user.getUsername() %></option>
					   				
                        						
					
						
					</select>
			</div>
			<div class="w3l-date">
					<label class="head">Date of Issue<span class="w3l-star"> * </span></label>
						<div class="styled-input">
							<input  class="date datepicker" name="dateofissue" type="text" placeholder="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}" required="">
						</div><br>
					</div>
			
			<input type="hidden" name="empname" value=<%=user.getUsername()%>>
		
		         <div class="w3l-rem"  >
				
				<div class="btn center-block"  >
				
					<input type="submit" name="submit" value="Submit"/>
				
				</div>
			</div>
			
		</form>
	</div>
		
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
		$( ".datepicker" ).datepicker();
		});
	</script>
		<script type="text/javascript" src="edit/js/jquery-2.1.4.min.js"></script>
	<script src="edit/js/jquery-ui.js"></script>
</body>
</html>
<!-- <script>


$(document).ready(function(){
	
	 function Insert_Ticket(id, column_name, value)
	  {
	   $.ajax({
	    url:"UpdateServlet",
	    method:"POST",
	    data:{id:id, column_name:column_name, value:value},
	    success:function(data)
	    {
	     $('#alert_message').html('<div class="alert alert-success">'+data+'</div>');
	   
	     
	    }
	   });
	 /*   setInterval(function(){
	    $('#alert_message').html('');
	   }, 5000); */
	  }

	  $(document).on('submit', '.submit', function(){
	   var ticketid = $('.ticketid').val();
	   var ticketdescription = $('.ticketdescription').val();
	   var ticketdescription = $('.ticketdescription').val();
	   var ticketdescription = $('.ticketdescription').val();
	   var ticketdescription = $('.ticketdescription').val();
	   var ticketdescription = $('.ticketdescription').val();
	   var ticketdescription = $('.ticketdescription').val();
	  
	   update_data(id, column_name, value);
	  });
	
	

	
});
</script> -->
