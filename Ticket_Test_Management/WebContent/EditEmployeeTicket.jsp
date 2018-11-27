<!DOCTYPE html>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
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
<link rel="stylesheet" href="edit/css/jquery-ui.css" />
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

<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<style>
span.item {
	display: block;
	height: 5px;
	text-align: center;
	width: 80px;
	font-size: 11pt;
}
</style>

</head>

<body>
	<%
		Userbean user = (Userbean) session.getAttribute("session1");
	%>
	<section id="container">
		<!--header start-->
		<header class="header fixed-top clearfix">
			<!--logo start-->
			<div class="brand">

				<a href="EmployeeIndex.jsp" class="logo">
					<h4 style="color: white;">
						<b><i>Ticket&Test Management</i></b>
					</h4>
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
						<h2 style="color: white; align: center; padding-left: 120%">
							<b><i>EditTicket</i></b>
						</h2>
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
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <%
 	try {
 		ConnectionSteps steps = new ConnectionSteps();
 		Connection conn = steps.connection();

 		PreparedStatement pstmt = conn.prepareStatement("select * from registrationtable where username=?");
 		pstmt.setString(1, user.getUsername());
 		ResultSet rs = pstmt.executeQuery();

 		while (rs.next()) {
 %> <img width='50' height='50' src=DisplayPhotoServlet?id=
							<%=rs.getString("username")%> style="width: 50px"> <span
							class="username"><%=user.getUsername()%></span> <b class="caret"></b>
					</a> <%
 	}

 	} catch (Exception ex) {
 		ex.printStackTrace();
 	}
 %>

						<ul class="dropdown-menu extended logout">
							<!-- <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li> -->
							<li><a href="Logout.jsp"><i class="fa fa-key"></i> Log
									Out</a></li>
						</ul></li>
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
						<li><a class="active" href="EditEmployeeProfile.jsp"> <i
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
							String desig = user.getDesignation();
							if ((desig.equals("qualityanalyst"))) {
						%>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-check-square-o"></i> <span>Test Management</span>
						</a>
							<ul class="sub">
								<li><a href="TestReport.jsp">Prepare TestReport</a></li>
								<li><a href="TestData.jsp">Prepare TestData </a></li>
								<li><a href="BugReport.jsp">Prepare BugReport</a></li>
								<li><a href="ViewTestReport.jsp">ViewTestReport</a></li>
								<li><a href="ModifyTestReport.jsp">ModifyTestReport</a></li>

							</ul></li>
						<%
							}
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

		<div id="btn">
			<section id="main-content">
				<section class="wrapper">
					<!-- page start-->


					<div id="table" class="table-editable">

						<br>
						<table class="table" border="3">
							<tr>
								<th>Ticket Id</th>
								<th>Ticket Description</th>
								<th>Project Name</th>
								<th>Module Name</th>
								<th>Requirement Name</th>
								<th>Ticket Assigned By</th>
								<th>Ticket Assigned To</th>
								<th>Date of Issue</th>
								<th>Date of Completion</th>
								<th>Status</th>
								<th>Test Assigned To</th>

							</tr>

							<%
								ConnectionSteps steps = new ConnectionSteps();
								Connection conn = steps.connection();
								PreparedStatement pstmt = conn.prepareStatement("select * from tickettable order by id");
								//pstmt.setString(1, user.getUsername());
								ResultSet rs = pstmt.executeQuery();

								while (rs.next()) {
									if (rs.getString("editstatus").equals("approved")) {
										if ((rs.getString("username").equals(user.getUsername())
												&& rs.getString("assignedby").equals(user.getUsername())
												&& rs.getString("assignedto").equals(user.getUsername()))
												|| (rs.getString("username").equals(user.getUsername())
														&& rs.getString("empname").equals(user.getUsername()))
												|| (rs.getString("username").equals(user.getUsername())
														&& rs.getString("assignedby").equals(user.getUsername()))
												|| (rs.getString("assignedto").equals(user.getUsername()))) {
							%>
							<tr>
								<td><div class="update" data-id=<%=rs.getString("id")%>
										data-column="ticketid">
										<%=rs.getString("ticketid")%></div></td>
								<td><div contenteditable class="update"
										data-id=<%=rs.getString("id")%>
										data-column="ticketdescription"><%=rs.getString("ticketdescription")%></div></td>
								<td><div contenteditable class="update"
										data-id=<%=rs.getString("id")%> data-column="projectname"><%=rs.getString("projectname")%></div></td>
								<td><div contenteditable class="update"
										data-id=<%=rs.getString("id")%> data-column="modulename"><%=rs.getString("modulename")%></div></td>

								<%
									String reqname = rs.getString("requirementname");
												if (reqname == null) {
								%>

								<td><div contenteditable class="update"
										data-id=<%=rs.getString("id")%> data-column="requirementname"></div></td>

								<%
									} else {
								%>
								<td><div contenteditable class="update"
										data-id=<%=rs.getString("id")%> data-column="requirementname"><%=rs.getString("requirementname")%></div></td>
								<%
									}
								%>
								<td class='unselectable'>
									<div><%=rs.getString("assignedby")%></div>

								</td>
								<td class='unselectable'><div><%=rs.getString("assignedto")%></div>


								</td>
								<td class='unselectable'><div><%=rs.getString("dateofissue")%></div></td>
								<%
									String date = rs.getString("dateofcompletion");
								%>
								<%--  <td  ><div calss="update" data-id=<%=rs.getString("id")%> data-column="dateofcompletion"><div class="styled-input" >
							<input class="date"  name="Text" type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}" required="">
						</div></div>
			 
			 --%>
								<%
									String status = rs.getString("status");
												if (status.equals("Completed")) {
								%>


								<td>
									<%
										String doc = rs.getString("dateofcompletion");
														if (doc == null) {
									%>

									<div class="styled-input">
										<div>
											<input class="datepicker date" name="Text" type="text"
												data-id=<%=rs.getString("id")%>
												data-column="dateofcompletion">
										</div>
									</div> <%
 	} else {
 %>
									<div class="styled-input" contenteditable="false">
										<div>
											<input class="datepicker date" name="Text" type="text"
												data-id=<%=rs.getString("id")%>
												data-column="dateofcompletion"
												value=<%=rs.getString("dateofcompletion")%>>
										</div>
									</div> <%
 	}
 %>

								</td>
								<%
									} else {
								%>

								<td class='unselectable'><div contenteditable="false">
										MM/DD/YYYY</div></td>

								<%
									}

												if (status.equals("Assign")) {
								%>


								<td><select class="update5" data-id=<%=rs.getString("id")%>
									data-column="status">

										<option value="Assign">Assign</option>
										<option value="Design">Design</option>

										<option value="Development">Development</option>

										<option value="Review">Review</option>
										<option value="UnitTest">UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("Design")) {
								%>
								<td><select class="update5" data-id=<%=rs.getString("id")%>
									data-column="status">

										<option value="Assign" disabled>Assign</option>
										<option value="Design">Design</option>

										<option value="Development">Development</option>

										<option value="Review">Review</option>
										<option value="UnitTest">UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("Development")) {
								%>
								<td><select class="update5" data-id=<%=rs.getString("id")%>
									data-column="status">

										<option value="Assign" disabled>Assign</option>
										<option value="Design" disabled>Design</option>

										<option value="Development">Development</option>

										<option value="Review">Review</option>
										<option value="UnitTest">UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("Review")) {
								%>
								<td><select class="update5" data-id=<%=rs.getString("id")%>
									data-column="status">

										<option value="Assign" disabled>Assign</option>
										<option value="Design" disabled>Design</option>

										<option value="Development" disabled>Development</option>

										<option value="Review">Review</option>
										<option value="UnitTest">UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("UnitTest")) {
								%>
								<td><select class="update5" data-id=<%=rs.getString("id")%>
									data-column="status">

										<option value="Assign" disabled>Assign</option>
										<option value="Design" disabled>Design</option>

										<option value="Development" disabled>Development</option>

										<option value="Review" disabled>Review</option>
										<option value="UnitTest">UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("FunctionalityTesting")) {
								%>
								<td colour="red"><select class="update5"
									data-id=<%=rs.getString("id")%> data-column="status">

										<option value="Assign" disabled>Assign</option>
										<option value="Design" disabled>Design</option>

										<option value="Development" disabled>Development</option>

										<option value="Review" disabled>Review</option>
										<option value="UnitTest" disabled>UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("Deploy")) {
								%>
								<td colour="red"><select class="update5"
									data-id=<%=rs.getString("id")%> data-column="status">

										<option value="Assign" disabled>Assign</option>
										<option value="Design" disabled>Design</option>

										<option value="Development" disabled>Development</option>

										<option value="Review" disabled>Review</option>
										<option value="UnitTest" disabled>UnitTest</option>
										<option value="FunctionalityTesting" disabled>Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else if (status.equals("Completed")) {
								%>
								<td colour="green"><select>

										<option value="Assign" disabled>Assign</option>
										<option value="Design" disabled>Design</option>

										<option value="Development" disabled>Development</option>

										<option value="Review" disabled>Review</option>
										<option value="UnitTest" disabled>UnitTest</option>
										<option value="FunctionalityTesting" disabled>Functionality
											Testing</option>
										<option value="Deploy" disabled>Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									} else {
								%>
								<td><select class="update5" data-id=<%=rs.getString("id")%>
									data-column="status">

										<option value="Assign">Assign</option>
										<option value="Design">Design</option>

										<option value="Development">Development</option>

										<option value="Review">Review</option>
										<option value="UnitTest">UnitTest</option>
										<option value="FunctionalityTesting">Functionality
											Testing</option>
										<option value="Deploy">Deploy</option>
										<option value="Completed">Completed</option>
								</select></td>
								<%
									}
								%>
								<%
									String s = rs.getString("status");
												System.out.println(s);
												if (s.equals("empty") || s.equals("Assign") || s.equals("Design") || s.equals("Development")
														|| s.equals("Review") || s.equals("UnitTest")) {
								%>
								<td class='unselectable'></td>
								<%
									} else {
								%>
								<td><select class="update2" data-id=<%=rs.getString("id")%>
									data-column="testassignedto">
										<%
											if (rs.getString("testassignedto").equals("0")) {
										%>
										<option>select</option>
										<%
											PreparedStatement pstmt1 = conn
																		.prepareStatement("select * from registrationtable where designation=?");
																pstmt1.setString(1, "executivequalityanalyst");
																ResultSet rs1 = pstmt1.executeQuery();
																while (rs1.next()) {
										%>
										<option value=<%=rs1.getString("username")%>><%=rs1.getString("username")%></option>
										<%
											}
										%>

								</select></td>
								<%
									} else {
								%>

								<option><%=rs.getString("testassignedto")%></option>
								<option>--select--</option>

								<%
									PreparedStatement pstmt1 = conn
																.prepareStatement("select * from registrationtable where designation=?");

														pstmt1.setString(1, "executivequalityanalyst");
														ResultSet rs1 = pstmt1.executeQuery();
														while (rs1.next()) {
								%>
								<option value=<%=rs1.getString("username")%>><%=rs1.getString("username")%></option>
								<%
									}
													}
								%>
								</select>
								</td>


								<!-- This is our clonable table line -->
							</tr>





							<%
								}
										}
									}
								}
							%>
						</table>
						<div id="alert_message" align="center"></div>
					</div>
		</div>




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
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 70%">
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





	<script type="text/javascript" src="edit/js/jquery-2.1.4.min.js"></script>
	<script src="edit/js/jquery-ui.js"></script>
</body>

</html>
<script>
	$(function() {
		$(".datepicker").datepicker();
	});
</script>
<script type="text/javascript" language="javascript">
	$(document).ready(
			function() {

				/*  fetch_data();

				 function fetch_data()
				 {
				  var dataTable = $('#user_data').DataTable({
				   "processing" : true,
				   "serverSide" : true,
				   "order" : [],
				   "ajax" : {
				    url:"fetch.php",
				    type:"POST"
				   }
				  });
				 } */

				function update_data(id, column_name, value) {
					$.ajax({
						url : "UpdateServlet",
						method : "POST",
						data : {
							id : id,
							column_name : column_name,
							value : value
						},
						success : function(data) {
							$('#alert_message').html(
									'<div class="alert alert-success">' + data
											+ '</div>');
							$('#user_data').DataTable().destroy();
							fetch_data();
						}
					});
					setInterval(function() {
						$('#alert_message').html('');
					}, 1000);
				}
				function update_data1(id, column_name, value) {
					$.ajax({
						url : "UpdateServlet",
						method : "POST",
						data : {
							id : id,
							column_name : column_name,
							value : value
						},
						success : function(data) {
							//$("#btn").load("EditExecutiveTicket.jsp #btn");
							location.reload();

						}
					});

				}

				$(document).on('blur', '.update', function() {
					var id = $(this).data("id");
					var column_name = $(this).data("column");
					var value = $(this).text();
					update_data(id, column_name, value);
				});

				$(document).on('change', '.date', function() {
					var tr = $(this).closest("tr");
					var id = $(this).data("id");
					var column_name = $(this).data("column");
					var value = tr.find('.date').val();
					update_data(id, column_name, value);
				});

				$(document).on('change', '.update5', function() {
					var tr = $(this).closest("tr");
					var id = $(this).data("id");
					var column_name = $(this).data("column");
					var value = tr.find('.update5').val();
					update_data1(id, column_name, value);
				});
				$(document).on('change', '.update2', function() {
					var tr = $(this).closest("tr");
					var id = $(this).data("id");
					var column_name = $(this).data("column");

					var value = tr.find('.update2').val();
					update_data1(id, column_name, value);
				});

			});
</script>