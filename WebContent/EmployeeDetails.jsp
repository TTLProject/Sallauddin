<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<html lang="en">
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
%>
<%
	Userbean user = (Userbean) session.getAttribute("Admin");
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


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
	integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ=="
	crossorigin="anonymous"></script>
<!-- font Awesome 4.5.0 -->
<link href="css/modal-minimize-and-maximize/font-awesome.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.modal-header .btnGrp {
	position: absolute;
	top: 8px;
	right: 10px;
}

.min {
	width: 250px;
	height: 35px;
	overflow: hidden !important;
	padding: 0px !important;
	margin: 0px;
	float: left;
	position: static !important;
}

.min .modal-dialog, .min .modal-content {
	height: 100%;
	width: 100%;
	margin: 0px !important;
	padding: 0px !important;
}

.min .modal-header {
	height: 100%;
	width: 100%;
	margin: 0px !important;
	padding: 3px 5px !important;
}

.display-none {
	display: none;
}

button .fa {
	font-size: 16px;
	margin-left: 10px;
}

.min .fa {
	font-size: 14px;
}

.min .menuTab {
	display: none;
}

button:focus {
	outline: none;
}

.minmaxCon {
	height: 35px;
	bottom: 1px;
	left: 1px;
	position: fixed;
	right: 1px;
	z-index: 9999;
}
</style>

<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("table");
		tr = table.getElementsByTagName("tr");
		for (i = 1; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>




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
	overflow-x: auto;
	overflow-y: auto;
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



.btn {
    border-collapse: collapse;

    display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6x 2px; 
     
    font-size: 12px;
    line-height: 1.42857143;
    border-radius: 40px;
}


</style>
</head>

<body>

	<section id="container">
		<!--header start-->
		<header class="header fixed-top clearfix">
			<div class="clearfix">
				<!--logo start-->
				<div class="brand">

					<a href="#" class="logo">
						<h4 style="color: white;">
							<b><i>Ticket&Test Management</i></b>
						</h4>
					</a>
					<div class="sidebar-toggle-box">
						<div class="fa fa-bars"></div>
					</div>

				</div>
				<!--logo end-->
				<div>
				<h3 style="color: #fff;" align="center">
					<b><i>Employee Details</i></b>
					
				</h3>
				
				</div>
              <h5 align="right">

					<a style="color: white;" href="Login.jsp"><i class="fa fa-key"></i><b>
							Log Out</b></a>
				</h5>
			


<%-- <div class="top-nav clearfix">
 
    <ul class="nav pull-right top-menu">
       
      
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <span class="username"><%=user.getUsername() %></span>
                <b class="caret"></b>
            </a>
            
             <ul class="dropdown-menu extended logout">
                <li><a href="Logout.jsp"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
      
        
    </ul>
    
</div> --%>
</div>
		</header>

		<!--header end-->
		<aside>


			<div id="sidebar" class="nav-collapse">
				<!-- sidebar menu start-->
				<div class="leftside-navigation">
					<ul class="sidebar-menu" id="nav-accordion">




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
					<br>
					<div class="search-container">
						<form name="vinform">
							<input type="text" id="myInput" onkeyup="myFunction()"
								placeholder="Search..">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<br>

					<div id="table" class="table-editable">


						<table class="table" border="3">
							<tr>
								<!-- <th>Select</th> -->
									<th>S.No</th>
								<th>Name</th>
								<th>EmpId</th>
								<th>Domain</th>
								<th>Username</th>
								<th>Password</th>
								<th>ConfirmPassword</th>
								<th>EmailId</th>
								<th>WebMail</th>
								<th>Mobile</th>
								<th>Designation</th>
								<th>delete</th>
							</tr>


							<%
								try {

									ConnectionSteps steps = new ConnectionSteps();
									Connection conn = steps.connection();
									PreparedStatement pstmt = conn.prepareStatement("select * from registrationtable where status is null");
								
									ResultSet rs = pstmt.executeQuery();

									int i = 0;
									while (rs.next()) {
										i++;
								%>

							<tr>
								<td><b><%=i%></b></td>
								<td><b><%=rs.getString("name")%></b></td>
								<td><b><%=rs.getString("empid")%></b></td>
								<td><b><%=rs.getString("domain")%></b></td>
								<td><b><%=rs.getString("username")%></b></td>
								<td><b><%=rs.getString("password")%></b></td>
								<td><b><%=rs.getString("confirmpassword")%></b></td>
								<td><b><%=rs.getString("email")%></b></td>
								<td><b><%=rs.getString("webmail")%></b></td>
								<td><b><%=rs.getLong("mobile")%></b></td>
								<td><b><%=rs.getString("designation")%></b></td>
								<td>
									<!-- <button type="button" data-toggle="modal"
											data-target="#modal-1">delete</button> -->

									<button type="button" data-toggle="modal"
										data-target="#modal-1">
										<i class="fa fa-trash-o"></i>
									</button>

									<div class="modal fade mymodal" id="modal-1" trole="dialog"
										align="center">
										<div class="modal-dialog" role="document">
											<div class="modal-content" style="width: 420px">

												<div class="modal-body" align="center">Do you want to
													delete this record!!!</div>
												<div class="modal-footer">

													<form action="PermanentDelete.jsp" method="post">
														<input type="hidden" name="check"
															class="btn btn-primary btn-color btn-bg-color btn-sm col-xs-2"
															value=<%=rs.getString("empid")%>> <input
															type="submit" class="btn btn-primary pull-left"
															value="Permanent Delete" align="center"
															style="width: 115px">

													</form>

													<form action="TemporaryDelete.jsp" method="post">
														<input type="hidden" name="check1"
															class="btn btn-primary btn-color btn-bg-color btn-sm col-xs-2"
															value=<%=rs.getString("empid")%>> <input
															type="submit" class="btn btn-primary pull-left"
															value="Temporary Delete" align="center"
															style="width: 115px">

													</form>
													<form action="#" method="post">
														<input type="hidden" name="check"
															class="btn btn-primary btn-color btn-bg-color btn-sm col-xs-2"
															value=<%=rs.getString("empid")%>> <input
															type="submit" class="btn btn-primary pull-left"
															value="cancel" style="width: 115px">

													</form>

												</div>
											</div>
										</div>
									</div> <%
 	}
 	}

 	catch (Exception e) {
 		System.out.println(e);
 	}
 %> <script>
		$(document).ready(
				function() {
					var $content, $modal, $apnData, $modalCon;
					$content = $(".min");
					$(".mdlFire").click(function(e) {
						e.preventDefault();
						var $id = $(this).attr("data-target");
						$($id).modal({
							backdrop : false,
							keyboard : false
						});
					});

					$(".modalMinimize").on(
							"click",
							function() {

								$modalCon = $(this).closest(".mymodal").attr(
										"id");

								$apnData = $(this).closest(".mymodal");

								$modal = "#" + $modalCon;

								$(".modal-backdrop").addClass("display-none");

								$($modal).toggleClass("min");

								if ($($modal).hasClass("min")) {

									$(".minmaxCon").append($apnData);

									$(this).find("i").toggleClass('fa-minus')
											.toggleClass('fa-clone');

								} else {

									$(".container").append($apnData);

									$(this).find("i").toggleClass('fa-clone')
											.toggleClass('fa-minus');

								}
								;

							});

					$("button[data-dismiss='modal']").click(
							function() {

								$(this).closest(".mymodal").removeClass("min");

								$(".container").removeClass($apnData);

								$(this).next('.modalMinimize').find("i")
										.removeClass('fa fa-clone').addClass(
												'fa fa-minus');

							});

				});
	</script>

								</td>


							</tr>

							<!-- This is our clonable table line -->

						</table>
					</div>

					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br>
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

</body>
</html>
