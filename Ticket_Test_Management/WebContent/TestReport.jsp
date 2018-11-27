<!DOCTYPE html>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>

<!-- project filter js files includes when user select project name in drop down -->
<script src="js/ion.rangeSlider-1.8.2/js/vendor/jquery-1.10.2.min.js"
	type="text/javascript"></script>
<!--  Custom js file for displaying requirement and module information based on project -->
<script src="js/projectInfo.js" type="text/javascript"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>



<style>
body {
	margin: 0;
	padding: 0;
	background-color: #fff;
}

.box {
	width: 1270px;
	padding: 20px;
	background-color: #fff;
	border: 2px solid #ccc;
	border-radius: 5px;
	margin-top: 25px;
	box-sizing: border-box;
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
	Userbean user = (Userbean) session.getAttribute("session1");
	Userbean user1 = (Userbean) session.getAttribute("testsession");
	String pname=request.getParameter("projectname");
	String rname=request.getParameter("requirementname");
	String mname= request.getParameter("modulename");
	String table= request.getParameter("table");
	if(pname==null){
		pname="none";
	}
	if(rname==null){
		rname="";
	}
	if(mname==null){
		mname="none";
	}
	if(table==null){
		table="none";
	}
%>
	<section id="container">
		<!--header start-->
		<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

   <a href="EmployeeIndex.jsp" class="logo">
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
       <h2 style="color:white; align:center; padding-left:120%"><b><i>TestReport</i></b></h2>	
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

</header>

		<!--header end-->
		<aside>
			<div id="sidebar" class="nav-collapse">
				<!-- sidebar menu start-->
				<div class="leftside-navigation">
					<ul class="sidebar-menu" id="nav-accordion">
						<li><a class="active" href="EditProfile.jsp"> <i
								class="fa fa-pencil"></i> <span>EditProfile</span>
						</a></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-laptop"></i> <span>Ticket Management</span>
						</a>
							<ul class="sub">
								<li><a href="AddEmployeeTicket.jsp">Add Ticket</a></li>
								<li><a href="EditEmployeeTicket.jsp">Edit Ticket</a></li>
								<li><a href="ViewEmployeeTicket.jsp">View Ticket</a></li>
							</ul></li>


						<%
                String desig=user.getDesignation();
				if(desig.equals("qualityanalyst")) {
					%>
					  <li class="sub-menu">
	                    <a href="javascript:;">
	                        <i class="fa fa-check-square-o"></i>
	                        <span>Test Management</span>
	                    </a>
	                    <ul class="sub">
	                        <li><a href="TestReport.jsp">Prepare TestReport</a></li>
	                        <li><a href="TestData.jsp">Prepare TestData </a></li>
	                        <li><a href="BugReport.jsp">Prepare BugReport</a></li>
	                        <li><a href="ViewTestReport.jsp">ViewTestReport</a></li>
							 <li><a href="ModifyTestReport.jsp">ModifyTestReport</a></li>
							
	                    </ul>
	                </li>
				<% }
				
                %>

						<li><a href="EmployeeNotifications.jsp"> <i
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
			<section class="wrapper">
				<!-- page start-->


<div id="alert_message"></div>
				<br />
				<div class="container">
				
				      <div>
					<%
						
						String  modulename = "none", requirementname = "none", projectname = "none";
			
					%>
					<%
						ConnectionSteps steps = new ConnectionSteps();
						Connection conn = steps.connection();
						
					%>
				
					<div class="card-header">


						Project Name:&emsp;&emsp;&nbsp;&emsp;<select id="meetingPlace1" style="width:200px; overflow:hidden">
							<option>---Select---</option>
							<table>
								<%
									PreparedStatement pstmt2 = conn.prepareStatement("select * from testreporttable1 where assignedto=?");
									pstmt2.setString(1, user.getUsername());
									ResultSet rs2 = pstmt2.executeQuery();
									HashSet<String> hs1 = new HashSet();
									while (rs2.next()) {
										hs1.add(rs2.getString("projectname"));
									}
									Iterator<String> itr1 = hs1.iterator();
									while (itr1.hasNext()) {
										String proname = itr1.next();
								%>
								<tr>
									<option value=<%=proname%>><%=proname%></option>
								</tr>
								<%
									}
								%>
							</table>
						</select> &emsp;&emsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
						if (user1.getProjectName().equals("none")) {
							} else {
						%>
						
							<br>
							<span  style="color:blue">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%=user1.getProjectName() %></span>
						<%
							}
						%>
						
						
						<br> <br> Module Name:&emsp;&emsp;&nbsp;&nbsp;
						<select id="meetingPlace2" style="width:200px; overflow:hidden">
							<option>---Select---</option>
							<table>
								<%
									PreparedStatement pstmt3 = conn
											.prepareStatement("select * from testreporttable1 where assignedto=? and projectname=?");
									pstmt3.setString(1, user.getUsername());

									// System.out.print(user2.getProjectName());
									if (user1 == null) {
										pstmt3.setString(2, projectname);
									} else if (user1.getProjectName().equals("none")) {

										pstmt3.setString(2, projectname);
									} else {
										pstmt3.setString(2, user1.getProjectName());
									}

									ResultSet rs3 = pstmt3.executeQuery();
									HashSet<String> hs2 = new HashSet();
									while (rs3.next()) {
										hs2.add(rs3.getString("modulename"));
									}
									Iterator<String> itr2 = hs2.iterator();
									while (itr2.hasNext()) {
										String modname = itr2.next();
								%>
								<tr>
									<option value=<%=modname%>><%=modname%></option>
								</tr>
								<%
									}
								%>
							</table>
						</select> 
						
						&emsp;&emsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							if (user1 == null) {

							} else if (user1.getModuleName().equals("none")) {
							} else {
						%>
						<%-- <input type="text" value=<%=user1.getModuleName()%>
							readonly="readonly"> --%>
							<br>
							<span  style="color:blue">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%=user1.getModuleName() %></span>
						<%
							}
						%>
		<form action="TestReport.jsp" method="post">
						<br>   Requirement
						Name:&nbsp;<select id="meetingPlace3" style="width:200px; overflow:hidden">
							<option>--Select--</option>
							<%
								PreparedStatement pstmt4 = conn.prepareStatement(
										"select * from testreporttable1 where assignedto=? and projectname=? and modulename=? ");
								pstmt4.setString(1, user.getUsername());
								if (user1 == null) {
									pstmt4.setString(2, projectname);
								} else if (user1.getProjectName().equals("none")) {
									pstmt4.setString(2, projectname);

								} else {
									pstmt4.setString(2, user1.getProjectName());
								}

								if (user1 == null) {
									pstmt4.setString(3, modulename);
								} else if (user1.getModuleName().equals("none")) {
									pstmt4.setString(3, modulename);
								} else {
									pstmt4.setString(3, user1.getModuleName());
								}
								ResultSet rs4 = pstmt4.executeQuery();
								HashSet<String> hs3 = new HashSet();
								while (rs4.next()) {
									hs3.add(rs4.getString("requirementname"));
								}
								Iterator<String> itr3 = hs3.iterator();
								while (itr3.hasNext()) {
									String reqname = itr3.next();
							%>
							<tr>
								<option value=<%=reqname%>><%=reqname%></option>
							</tr>
							<%
								}
							%>
							</table>

						</select>
				
							&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%
								if (user1 == null) {

								} else if (user1.getRequirementName().equals("none")) {
								} else {
							%>
							
								<br>
							<span  style="color:blue">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%=user1.getRequirementName() %></span>
							<%
								}
							%>
							<br>
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" name="submit" />
							<input type="hidden" name="projectname"
								value=<%=user1.getProjectName()%>> <input type="hidden"
								name="modulename" value=<%=user1.getModuleName()%>> <input
								type="hidden" name="username" value=<%=user1.getUname()%>>
							<input type="hidden" value=<%=user1.getRequirementName()%> name="requirementname"
								readonly="readonly">
							<input type="hidden" name="table" value="ok">
							
						</form>
					</div>
				</div>
				<br>
				
				

					<br />
					<%
						if ((table.equals("none"))) {
					%>


					<%
						} else {
					%>



					<form method="post" id="insert_form">
						<div class="table-repsonsive">
						
						 	<input type="submit" name="Delete" class="btn btn-info"
								value="DeleteRecord" form="insert_form" />&emsp;&emsp; <br>
								
							<%-- <br> <b>ProjectName:::</b>
							<%=user1.getProjectName()%>
							&emsp; &emsp;&emsp;&emsp;<b>ModuleName:::</b>
							<%=user1.getModuleName()%>
							&emsp;&emsp;&emsp;<b>RequirementName:::</b>
							<%=user1.getRequirementName()%>  --%>

							<br>

							<table class="table table-bordered" id="item_table">
								<tr>
									<th>Select</th>
									<th>TestCase Id</th>
									<th>Test Description</th>
									<th>PreCondition</th>
									<th>Test DesignSteps</th>
									<th>Expected Result</th>
									<th>Actual Result</th>
									<th>Status</th>
									<th>Comment</th>
									<th></th>
								</tr>
								<%
									PreparedStatement pstmt1 = conn.prepareStatement(
												"select * from testreporttable where projectname=? and requirementname=? and modulename=?  order by testcaseid");
										pstmt1.setString(1, user1.getProjectName());
										pstmt1.setString(2, user1.getRequirementName());
										pstmt1.setString(3,user1.getModuleName() );
									
										ResultSet rs1 = pstmt1.executeQuery();
										while (rs1.next()) {
								%>
								<tr>
									<td contentedible="false"><input type="checkbox"
										name="test" value=<%=rs1.getString("testcaseid")%>></td>
									<td><div contenteditable class="update"
											data-id=<%=rs1.getInt("id")%> data-column="testcaseid"><%=rs1.getString("testcaseid")%></div></td>
									<td>
										<div contenteditable class="update"
											data-id=<%=rs1.getInt("id")%> data-column="testdescription"><%=rs1.getString("testdescription")%></div>
									</td>
									<td>
										<div contenteditable class="update"
											data-id=<%=rs1.getInt("id")%> data-column="precondition"><%=rs1.getString("precondition")%></div>
									</td>
									<td>
										<div contenteditable class="update"
											data-id=<%=rs1.getInt("id")%> data-column="testdesign"><%=rs1.getString("testdesign")%></div>
									</td>
									<td>
										<div contenteditable class="update"
											data-id=<%=rs1.getInt("id")%> data-column="expectedresult"><%=rs1.getString("expectedresult")%></div>
									</td>
									<td>
										<div contenteditable="false" class="update">
											<%-- data-id=<%=rs1.getInt("id")%> data-column="actualresult"><%=rs1.getString("actualresult")%> --%>
										</div>
									</td>
									<td>
										<div contenteditable="false" class="update">
											<%-- data-id=<%=rs1.getInt("id")%> data-column="status"><%=rs1.getString("status")%> --%>
										</div>
									</td>
									<td>
										<div contenteditable="false" class="update">
											<%-- data-id=<%=rs1.getInt("id")%> data-column="comments"><%=rs1.getString("comments")%> --%>
										</div>
									</td>

								</tr>
								<%
									}
								%>

							</table>
</form>
							
							
							<div align="right">
							
                           		<input type="submit"
									name="insert" class="btn btn-info" value="Save"
									id="insert_form" />

                       
								<button type="button" name="add"
									class="btn btn-info btn-sm add">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
									</div>
							
							<form action="TestReportNotification" method="post">
                              <input type="hidden" name="projectname" value=<%=user1.getProjectName() %>>
                               <input type="hidden" name="modulename" value=<%=user1.getModuleName() %>>
                                <input type="hidden" name="requirementname" value=<%=user1.getRequirementName() %>>
								<input type="submit" name="submit" value="Submit"
									class="btn btn-success" />&emsp; 
							</form>	
						
		 

						</div>

						<%
							}
						%>

					


					<div class="row">
						<div class="col-sm-12"></div>
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
					<li class="widget-collapsible"><a href="#"
						class="head widget-head red-bg active clearfix"> <span
							class="pull-left">work progress (5)</span> <span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
						<ul class="widget-container">
							<li>
								<div class="prog-row side-mini-stat clearfix">
									<div class="side-graph-info">
										<h4>Target sell</h4>
										<p>25%, Deadline 12 june 13</p>
									</div>
									<div class="side-mini-graph">
										<div class="target-sell"></div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									<div class="side-graph-info">
										<h4>product delivery</h4>
										<p>55%, Deadline 12 june 13</p>
									</div>
									<div class="side-mini-graph">
										<div class="p-delivery">
											<div class="sparkline" data-type="bar" data-resize="true"
												data-height="30" data-width="90%" data-bar-color="#39b7ab"
												data-bar-width="5"
												data-data="[200,135,667,333,526,996,564,123,890,564,455]">
											</div>
										</div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									<div class="side-graph-info payment-info">
										<h4>payment collection</h4>
										<p>25%, Deadline 12 june 13</p>
									</div>
									<div class="side-mini-graph">
										<div class="p-collection">
											<span class="pc-epie-chart" data-percent="45"> <span
												class="percent"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									<div class="side-graph-info">
										<h4>delivery pending</h4>
										<p>44%, Deadline 12 june 13</p>
									</div>
									<div class="side-mini-graph">
										<div class="d-pending"></div>
									</div>
								</div>
								<div class="prog-row side-mini-stat">
									<div class="col-md-12">
										<h4>total progress</h4>
										<p>50%, Deadline 12 june 13</p>
										<div class="progress progress-xs mtop10">
											<div style="width: 50%" aria-valuemax="100" aria-valuemin="0"
												aria-valuenow="20" role="progressbar"
												class="progress-bar progress-bar-info">
												<span class="sr-only">50% Complete</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
					<li class="widget-collapsible"><a href="#"
						class="head widget-head terques-bg active clearfix"> <span
							class="pull-left">contact online (5)</span> <span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
						<ul class="widget-container">
							<li>
								<div class="prog-row">
									<div class="user-thumb">
										<a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
									</div>
									<div class="user-details">
										<h4>
											<a href="#">Jonathan Smith</a>
										</h4>
										<p>Work for fun</p>
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
										<h4>
											<a href="#">Anjelina Joe</a>
										</h4>
										<p>Available</p>
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
										<h4>
											<a href="#">John Doe</a>
										</h4>
										<p>Away from Desk</p>
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
										<h4>
											<a href="#">Mark Henry</a>
										</h4>
										<p>working</p>
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
										<h4>
											<a href="#">Shila Jones</a>
										</h4>
										<p>Work for fun</p>
									</div>
									<div class="user-status text-danger">
										<i class="fa fa-comments-o"></i>
									</div>
								</div>
								<p class="text-center">
									<a href="#" class="view-btn">View all Contacts</a>
								</p>
							</li>
						</ul></li>
					<li class="widget-collapsible"><a href="#"
						class="head widget-head purple-bg active"> <span
							class="pull-left"> recent activity (3)</span> <span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
						<ul class="widget-container">
							<li>
								<div class="prog-row">
									<div class="user-thumb rsn-activity">
										<i class="fa fa-clock-o"></i>
									</div>
									<div class="rsn-details ">
										<p class="text-muted">just now</p>
										<p>
											<a href="#">Jim Doe </a>Purchased new equipments for zonal
											office setup
										</p>
									</div>
								</div>
								<div class="prog-row">
									<div class="user-thumb rsn-activity">
										<i class="fa fa-clock-o"></i>
									</div>
									<div class="rsn-details ">
										<p class="text-muted">2 min ago</p>
										<p>
											<a href="#">Jane Doe </a>Purchased new equipments for zonal
											office setup
										</p>
									</div>
								</div>
								<div class="prog-row">
									<div class="user-thumb rsn-activity">
										<i class="fa fa-clock-o"></i>
									</div>
									<div class="rsn-details ">
										<p class="text-muted">1 day ago</p>
										<p>
											<a href="#">Jim Doe </a>Purchased new equipments for zonal
											office setup
										</p>
									</div>
								</div>
							</li>
						</ul></li>
					<li class="widget-collapsible"><a href="#"
						class="head widget-head yellow-bg active"> <span
							class="pull-left"> shipment status</span> <span
							class="pull-right widget-collapse"><i class="ico-minus"></i></span>
					</a>
						<ul class="widget-container">
							<li>
								<div class="col-md-12">
									<div class="prog-row">
										<p>Full sleeve baby wear (SL: 17665)</p>
										<div class="progress progress-xs mtop10">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 40%">
												<span class="sr-only">40% Complete</span>
											</div>
										</div>
									</div>
									<div class="prog-row">
										<p>Full sleeve baby wear (SL: 17665)</p>
										<div class="progress progress-xs mtop10">
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 70%">
												<span class="sr-only">70% Completed</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
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
	<script type="text/javascript">
		<script src="//code.jquery.com/jquery-3.1.0.min.js" type="text/javascript">
	</script>









	<!-- 	<script>
	
	
    // Create a new option element.
    var optionNode = document.createElement("option");
 
    // Set the value
    optionNode.value = "huge";
 
    // create a text node and append it to the option element
    optionNode.appendChild(document.createTextNode(""));
 
    // Add the optionNode to the datalist
    document.getElementById("hosting-plan").appendChild(optionNode);
</script>
	


 -->




</body>
</html>

<script>
	$(document)
			.ready(
					function() {

						function update_data(id, column_name, value) {
							$.ajax({
								url : "UpdateTestReportServlet",
								method : "POST",
								data : {
									id : id,
									column_name : column_name,
									value : value
								},
								success : function(data) {
									$('#alert_message').html(
											'<div class="alert alert-success">'
													+ data + '</div>');

								}
							});
							setInterval(function() {
								$('#alert_message').html('');
							}, 5000);
						}

						$(document).on('blur', '.update', function() {
							var id = $(this).data("id");
							var column_name = $(this).data("column");
							var value = $(this).text();
							update_data(id, column_name, value);
						});
						
						$(document)
						.on(
								'click',
								'.add',
								function() {

									var maxId = "";
									$
											.get(
													'GetTestCaseIDServlet',
													{
														projectName : "<%=user1.getProjectName()%>",
														moduleName  :  "<%=user1.getModuleName()%>",
														reqName  :  "<%=user1.getRequirementName()%>"
													},
													function(responseText) {
														maxId = responseText;
														
													
													
														 console.log("maxId  INNER ", maxId); 
														
														var html = '';
														html += '<tr>';
														html += '<td contentedible="false"><input type="checkbox"/></td>';
														html += '<td ><input type="text" name="testcaseid[]" class="form-control item_name" value="'+maxId+'"/></td>';
														html += '<td><textarea rows="1" name="testdescription[]" class="form-control item_name" ></textarea></td>';
														html += '<td><textarea rows="1" name="precondition[]" class="form-control item_name" /></td>';
														html += '<td><textarea rows="1" name="testdesign[]" class="form-control item_name" /></td>';
														html += '<td><textarea rows="1" name="expectedresult[]" class="form-control item_name" /></td>';
														html += '<td class="unselectable"></td>';
														html += '<td class="unselectable"></td>';
														html += '<td class="unselectable"></td>';
														html += '<td><button name="Delete"  class="remove" ><i class="fa fa-trash-o"></i></button></td>';
                                                          
														$('#item_table').append(html);

													});
													console.log("maxId  ", maxId);

								});

						$(document).on('click', '.remove', function() {
							$(this).closest('tr').remove();
						});

						$('#insert_form')
								.on(
										'submit',
										function(event) {
											event.preventDefault();
											var error = '';
											$('.item_name')
													.each(
															function() {
																var count = 1;
																if ($(this)
																		.val() == '') {
																	error += "<p>Enter Item Name at "
																			+ count
																			+ " Row</p>";
																	return false;
																}
																count = count + 1;
															});

											$('.item_quantity')
													.each(
															function() {
																var count = 1;
																if ($(this)
																		.val() == '') {
																	error += "<p>Enter Item Quantity at "
																			+ count
																			+ " Row</p>";
																	return false;
																}
																count = count + 1;
															});

											$('.item_unit')
													.each(
															function() {
																var count = 1;
																if ($(this)
																		.val() == '') {
																	error += "<p>Select Unit at "
																			+ count
																			+ " Row</p>";
																	return false;
																}
																count = count + 1;
															});
											var form_data = $(this).serialize();
											console.log("form_data 122  ",
													form_data);
											var isDeleteRecord = form_data
													.includes("test=");
											if (isDeleteRecord == true) {
												var reqParam = form_data
														.split("&");
												var request = "test=";
												for (var i = 0; i < reqParam.length; i++) {
													request = request
															+ reqParam[i]
																	.replace(
																			"test=",
																			"")
															+ ",";
												}
												console.log("response val ",
														request);
												console.log("response   ",
														request);
												form_data = request;
												console.log("form_data  ",
														form_data);
											}

											if (error == '') {
												$
														.ajax({
															url : "TestReportInsertServlet",
															method : "POST",
															data : form_data,
															success : function(
																	data) {

																location
																		.reload();

															}
														});
											} else {
												$('#error').html(
														'<div class="alert alert-danger">'
																+ error
																+ '</div>');
											}
										});

						$('#delete_Items')
								.on(
										'submit',
										function(event) {
											alert("Data  ");
											event.preventDefault();
											var error = '';
											$('.item_name')
													.each(
															function() {
																var count = 1;
																if ($(this)
																		.val() == '') {
																	error += "<p>Enter Item Name at "
																			+ count
																			+ " Row</p>";
																	return false;
																}
																count = count + 1;
															});

											$('.item_quantity')
													.each(
															function() {
																var count = 1;
																if ($(this)
																		.val() == '') {
																	error += "<p>Enter Item Quantity at "
																			+ count
																			+ " Row</p>";
																	return false;
																}
																count = count + 1;
															});
											$('.item_unit')
													.each(
															function() {
																var count = 1;
																if ($(this)
																		.val() == '') {
																	error += "<p>Select Unit at "
																			+ count
																			+ " Row</p>";
																	return false;
																}
																count = count + 1;
															});
											var form_data = $(this).serialize();
											console.log("form_data   ",
													form_data);
											if (error == '') {
												$
														.ajax({
															url : "TestReportInsertServlet",
															method : "POST",
															data : form_data,
															success : function(
																	data) {

																location
																		.reload();

															}
														});
											} else {
												$('#error').html(
														'<div class="alert alert-danger">'
																+ error
																+ '</div>');
											}
										});

					});
</script>






				

<script>
$(document)
.ready(
		function() {
$("#meetingPlace").on("change", function() {
var value = $(this).val();

update_data1(value);
});
function update_data1(value) {
$.ajax({
url : "Report1.jsp",
method : "POST",
data : {
value : value
},
success : function(data) {
// 	$("#div1").load("NewFile.jsp #div1");

location.reload();

}
});

}

$("#meetingPlace1").on("change", function() {
var value1 = $(this).val();

update_data(value1);
});
function update_data(value1) {
$.ajax({
url : "Report2.jsp",
method : "POST",
data : {
value1 : value1
},
success : function(data) {
location.reload();

}
});

}

$("#meetingPlace2").on("change", function() {
var value2 = $(this).val();

update_data2(value2);
});
function update_data2(value2) {
$.ajax({
url : "Report3.jsp",
method : "POST",
data : {
value2 : value2
},
success : function(data) {
location.reload();

}
});

}
$("#meetingPlace3").on("change", function() {
var value2 = $(this).val();

update_data3(value2);
});
function update_data3(value2) {
$.ajax({
url : "Report4.jsp",
method : "POST",
data : {
value2 : value2
},
success : function(data) {
location.reload();

}
});

}
		});


</script>


