<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="userbean.Userbean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
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

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<style>
@import
	url('http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css')
	;

@import
	url('https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800')
	;
@import
url('scss/style.css')
</style>
<style>
div.scrollmenu {
	background-color: #fff;
	overflow: auto;
	white-space: nowrap;
	width: 100%
}

div.scrollmenu a {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px;
	text-decoration: none;
}

div.scrollmenu a:hover {
	background-color: #777;
}
</style>


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
	
	Userbean user=(Userbean)session.getAttribute("session1");
		Userbean user1 = (Userbean) session.getAttribute("session2");
	Userbean user2 = (Userbean) session.getAttribute("view");
	%>


	<section id="container">
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
       <h2 style="color:white; align:center; padding-left:120%"><b><i>ViewTicket</i></b></h2>	
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
        pstmt.setString(1,user1.getUsername());
        ResultSet rs = pstmt.executeQuery();
       
        while ( rs.next()) { %>
 
                  
        
                           <img width='50' height='50' src=DisplayPhotoServlet?id=<%=rs.getString("username")%> style="width: 50px">     
                <span class="username"><%=user1.getUsername() %></span>
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
						<li><a class="active" href="EditExecutiveProfile.jsp"> <i
								class="fa fa-pencil"></i> <span>EditProfile</span>
						</a></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-laptop"></i> <span>Ticket Management</span>
						</a>
							<ul class="sub">
								<li><a href="AddExecutiveTicket.jsp">Add Ticket</a></li>
								<li><a href="EditExecutiveTicket.jsp">Edit Ticket</a></li>
								<li><a href="#">View Ticket</a></li>
							</ul></li>


						 <%
                String desig=user1.getDesignation();
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
						<li><a href="ExecutiveNotifications.jsp"> <i
								class="fa fa-bell-o"></i> <span>Notifications </span>
						</a></li>




					</ul>
				</div>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		<!--main content start-->
				<section id="main-content">
			<div class="scrollmenu">
				<section class="wrapper">
					<!-- page start-->

	<form id="form1" method="post">
							

								<select id="emp" >
									<option>Select Emp</option>

									<%
										try {
											ConnectionSteps steps = new ConnectionSteps();
											Connection conn = steps.connection();
											PreparedStatement pstmt = conn.prepareStatement("select * from tickettable");
											
											ResultSet rs = pstmt.executeQuery();
											HashSet<String> hs1 = new HashSet();
											while (rs.next()) {
												hs1.add(rs.getString("username"));
											}
											Iterator<String> itr1 = hs1.iterator();
											while (itr1.hasNext()) {
												String empid = itr1.next();
												
												
									%>
									<option value=<%=empid%> ><%=empid%></option>
									<%
										}

										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</select> <br> <br>
								
								<%String empid;
								if(user2==null){
									empid="none";
								}else{
								 %>
								<table class="table" border="3">

									<tr>
										<th>Ticket Id</th>
										<th>Ticket Description</th>
										<th>Project Name</th>
										<th>Module Name</th>
										<th>Requirement Name</th>
										<th>Date of Issue</th>
										<th>Date of Completion</th>
										<th>Status</th>
										<th>Test Assigned to</th>
									
									</tr>

									<%
										try {

											ConnectionSteps steps = new ConnectionSteps();
											Connection conn = steps.connection();
											PreparedStatement pstmt2 = conn.prepareStatement("select * from tickettable where username=? and editstatus=? order by id");
											pstmt2.setString(1, user2.getEmpid());
											pstmt2.setString(2,"approved");
											ResultSet rs2 = pstmt2.executeQuery();

											while (rs2.next()) {
												
									%>

									<tr>
										<td><%=rs2.getString("ticketid")%></td>
										<td><%=rs2.getString("ticketdescription")%></td>
										<td><%=rs2.getString("projectname")%></td>
										<td><%=rs2.getString("modulename")%></td>
										<td><%=rs2.getString("requirementname")%></td>
										<td><%=rs2.getString("dateofissue")%></td>
										<td><%=rs2.getString("dateofcompletion")%></td>
										
										 <td><select>
												<option>issued</option>
												<option>Development</option>
												<option id="review">Review</option>
												<option>Functionality Testing</option></td>  
										<td class='unselectable'></td>




									</tr>
									<%
										}

										} catch (Exception e) {
											System.out.println(e);
										}
									%>


								</table>
								<%} %>
						</form>


						<br> <br>

						<table class="table" border="3">
							<tr>
								<th>Ticket Id</th>
								<th>Ticket Description</th>
								<th>Project Name</th>
								<th>Module Name</th>
								<th>Requirement Name</th>
								<th>Assigned To</th>
								<th>Assigned By</th>
								<th>Date of Issue</th>
								<th>Date of Completion</th>
								<th>Status</th>

							</tr>
							<%
								try {
									ConnectionSteps steps = new ConnectionSteps();
									Connection conn = steps.connection();
									PreparedStatement pstmt = conn.prepareStatement("select * from tickettable where username=?");
									pstmt.setString(1,user1.getUsername());
									ResultSet rs = pstmt.executeQuery();
									while (rs.next()) {
							%>

							<%
								if (rs.getString("username").equals(rs.getString("assignedto"))
												&& rs.getString("assignedto").equals(rs.getString("assignedby"))) {

											if (rs.getString("status").equals("Completed")) {
							%>
							<tr bgcolor="#42F445">
								<td><%=rs.getString("ticketid")%></td>
								<td><%=rs.getString("ticketdescription")%></td>
								<td><%=rs.getString("projectname")%></td>
								<td><%=rs.getString("modulename")%></td>
								<td><%=rs.getString("requirementname")%></td>
								<td><%=rs.getString("assignedto")%></td>
								<td><%=rs.getString("assignedby")%></td>
								<td><%=rs.getString("dateofissue")%></td>
								<td><%=rs.getString("dateofcompletion")%></td>
								<td><%=rs.getString("status")%></td>


							</tr>

							<%
								} else if ((rs.getString("status").equals("Development"))
													|| (rs.getString("status").equals("Deploy"))
													|| (rs.getString("status").equals("Design"))
													|| (rs.getString("status").equals("Review"))
													|| (rs.getString("status").equals("UnitTest"))
													|| (rs.getString("status").equals("FunctionalityTesting"))) {
							%>
							<tr bgcolor="red">
								<td><%=rs.getString("ticketid")%></td>
								<td><%=rs.getString("ticketdescription")%></td>
								<td><%=rs.getString("projectname")%></td>
								<td><%=rs.getString("modulename")%></td>
								<td><%=rs.getString("requirementname")%></td>
								<td><%=rs.getString("assignedto")%></td>
								<td><%=rs.getString("assignedby")%></td>
								<td><%=rs.getString("dateofissue")%></td>
								<td><%=rs.getString("dateofcompletion")%></td>
								<td><%=rs.getString("status")%></td>


							</tr>


							<%
								} else {
							%>
							<tr bgcolor="yellow">
								<td><%=rs.getString("ticketid")%></td>
								<td><%=rs.getString("ticketdescription")%></td>
								<td><%=rs.getString("projectname")%></td>
								<td><%=rs.getString("modulename")%></td>
								<td><%=rs.getString("requirementname")%></td>
								<td><%=rs.getString("assignedto")%></td>
								<td><%=rs.getString("assignedby")%></td>
								<td><%=rs.getString("dateofissue")%></td>
								<td><%=rs.getString("dateofcompletion")%></td>
								<td><%=rs.getString("status")%></td>


							</tr>

							<%
								}
										}

									}

								} catch (Exception e) {
									System.out.println(e);

								}
							%>


						</table>


					



					<div class="input-color">

						<p>
						<div class="color-box" style="background-color: #FF0000"></div>
						&nbsp;&nbsp;&nbsp;&nbsp; ::: Design (or) Development (or) UnitTest
						(or) Functionality Test (or) Review state
						</p>
						<!-- Replace "#FF850A" to change the color -->
					</div>

					<div class="input-color">

						<p>
						<div class="color-box" style="background-color: #00FF7F;"></div>
						&nbsp;&nbsp;&nbsp;&nbsp; ::: Completed state
						</p>
						<!-- Replace "#FF850A" to change the color -->
					</div>



					<div class="input-color">

						<p>
						<div class="color-box" style="background-color: #FFFF00;"></div>
						&nbsp;&nbsp;&nbsp;&nbsp; ::: assigned state
						</p>
						<!-- Replace "#FF850A" to change the color -->
					</div>




					<div class="row">
						<div class="col-sm-12"></div>
					</div>
					<!-- page end-->
				</section>
			</div>
		</section>
		<!--main content end-->
		<!--right sidebar start-->
		<div class="right-sidebar">
			<div class="search-row">
				<input type="text" placeholder="Search" class="form-control">
			</div>
			<div class="right-stat-bar">
				<ul class="right-side-accordion">
					<li class="widget-collapsible"><a href="#"
						class="head widget-head red-bg active clearfix"> <<span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
						<ul class="widget-container">
							<li>
								<div class="prog-row side-mini-stat clearfix">
									
									<div class="side-mini-graph">
										<div class="target-sell"></div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									
									<div class="side-mini-graph">
										<div class="p-delivery">
											
										</div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									
									<div class="side-mini-graph">
										<div class="p-collection">
											<span class="pc-epie-chart" data-percent="45"> <span
												class="percent"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									
									<div class="side-mini-graph">
										<div class="d-pending"></div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									
								</div>
							</li>
						</ul></li>
					<li class="widget-collapsible"><a href="#"
						class="head widget-head terques-bg active clearfix">  <span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
						<ul class="widget-container">
							<li>
								<div class="prog-row">
									<div class="user-thumb">
										<a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
									</div>
								
									<div class="user-status text-danger">
										<i class="fa fa-comments-o"></i>
									</div>
								</div>
								<div class="prog-row">
									<div class="user-thumb">
										<a href="#"><img src="images/avatar1.jpg" alt=""></a>
									</div>
									
									<div class="user-status text-success">
										<i class="fa fa-comments-o"></i>
									</div>
								</div>
								<div class="prog-row">
									<div class="user-thumb">
										<a href="#"><img src="images/chat-avatar2.jpg" alt=""></a>
									</div>
									
									<div class="user-status text-warning">
										<i class="fa fa-comments-o"></i>
									</div>
								</div>
								<div class="prog-row">
									<div class="user-thumb">
										<a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
									</div>
									
									<div class="user-status text-info">
										<i class="fa fa-comments-o"></i>
									</div>
								</div>
								<div class="prog-row">
									<div class="user-thumb">
										<a href="#"><img src="images/avatar1.jpg" alt=""></a>
									</div>
									
									<div class="user-status text-danger">
										<i class="fa fa-comments-o"></i>
									</div>
								</div>
								
							</li>
						</ul></li>
					<li class="widget-collapsible"><a href="#"
						class="head widget-head purple-bg active"> <span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
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
	<script class="include" type="text/javascript"
		src="js/jquery.dcjqaccordion.2.7.js"></script>
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

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://ajax.googleapis.com/table/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
	<script
		src='https://netdna.bootstrapcdn.com/bootstrap/3.1.1/table/js/bootstrap.min.js'></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/table/libs/underscore.js/1.6.0/underscore.js'></script>



	<script src="table/js/index.js"></script>
	
</body>
</html>
<script type="text/javascript" language="javascript" >
 $(document).ready(function(){
 
	 function emp_data(value)
	  {
	   $.ajax({
	    url:"ViewExecutiveTicket1.jsp",
	    method:"POST",
	    data:{value:value},
	    success:function(data)
	    {
	    	location.reload();
	    	
	    }
	   });
	  
	  }
	 
	 $("#emp").on("change", function() {
			var value = $(this).val();
			
			emp_data(value);
			
		});
 });


</script>


