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

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script>
	function downloadCSV(csv, filename) {
		var csvFile;
		var downloadLink;

		// CSV file
		csvFile = new Blob([ csv ], {
			type : "text/csv"
		});

		// Download link
		downloadLink = document.createElement("a");

		// File name
		downloadLink.download = filename;

		// Create a link to the file
		downloadLink.href = window.URL.createObjectURL(csvFile);

		// Hide download link
		downloadLink.style.display = "none";

		// Add the link to DOM
		document.body.appendChild(downloadLink);

		// Click download link
		downloadLink.click();
	}
	function exportTableToCSV(filename) {
		var csv = [];
		var rows = document.querySelectorAll("table tr");

		for (var i = 0; i < rows.length; i++) {
			var row = [], cols = rows[i].querySelectorAll("td, th");

			for (var j = 0; j < cols.length; j++)
				row.push(cols[j].innerText);

			csv.push(row.join(","));
		}

		// Download CSV file
		downloadCSV(csv.join("\n"), filename);
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
       <h2 style="color:white; align:center; padding-left:120%"><b><i>TestData</i></b></h2>	
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
				if((desig.equals("qualityanalyst"))) {
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

						<li><a href="Notifications.jsp"> <i class="fa fa-bell-o"></i>
								<span>Notifications </span>
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

				<input type="button" onClick="deleteSelectedRows()"
					value="DeleteRows"></input>
					 <input type="button"
					value="Delete column" onClick="deleteColumn()" /> <input
					type="button" onClick="addColumn()" value="+">
				</button>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<button onclick="exportTableToCSV('file.csv')">Download Csv</button>

				<br> <br>


				<table id="my_table" border="2" cellpadding="0" cellspacing="0"
					contenteditable="true">
					<thead>
						<tr contenteditable="true" width="30%">
							<th>Select</th>

							<th>Type of Testing</th>
						</tr>
					</thead>

					<tbody>
						<tr width="30%">
							<td contenteditable="false"><input type="checkbox"></td>
							<td contenteditable="false">
							<select name="data" id="d">
							<option	value="1">Select
									<option value="2">Positive
									<option value="3">Negative
									</select></td>

						</tr>

					</tbody>

				</table>
                   <br>
				<button onClick="addRow()">+</button> &emsp;&emsp;&emsp;
				<input type="submit" value="Submit"></input>

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
	<script>
		// Add row to the HTML table
		function addRow() {
			var table = document.getElementById('my_table'); //html table
			var rowCount = table.rows.length; //no. of rows in table
			var columnCount = table.rows[0].cells.length; //no. of columns in table          
			var row = table.insertRow(rowCount); //insert a row            

			var cell1 = row.insertCell(0); //create a new cell      
			cell1.contenteditable = "true";
			var element1 = document.createElement("input"); //create a new element           
			element1.type = "checkbox"; //set the element type 
			element1.setAttribute('id', 'newCheckbox'); //set the id attribute         
			cell1.appendChild(element1).contenteditable = "true"; //append element to cell

			var cell2 = row.insertCell(1);
			var element2 = document.createElement("select");
			element2.setAttribute('id', 'newSelect'); //set the id attribute      
			//Create options dynamically. This will not work in mozilla.
			var option1 = document.createElement("option"); //create a option element
			option1.text = "select"; //set the text for option
			option1.value = "1"; //set the value for option
			element2.add(option1); //add option to select box  

			var option2 = document.createElement("option");
			option2.text = "positive";
			option2.value = "2";
			element2.add(option2);

			var option3 = document.createElement("option");
			option3.text = "negative";
			option3.value = "3";
			element2.add(option3);
			cell2.appendChild(element2);

			//Add the cells for more than 3 columns
			if (columnCount >= 2) {
				for (var i = 3; i <= columnCount; i++) {
					var newCel = row.insertCell(i - 1); //create a new cell           
					var element = document.createElement("div"); //create a div element
					var txt = document.createTextNode("."); //create a text element
					element.appendChild(txt); //append text to div      
					newCel.appendChild(element).contenteditable = "true"; //appent div to cell
				}
			}
		}

		// delete the selected rows from table
		function deleteSelectedRows() {
			var table = document.getElementById('my_table'); //html table
			var rowCount = table.rows.length; //no. of rows in table          
			for (var i = 1; i < rowCount; i++) { //loops for all row in table               
				var row = table.rows[i]; //return a particular row              
				var chkbox = row.cells[0].childNodes[0]; //get check box onject               
				if (null != chkbox && true == chkbox.checked) { //wheather check box is selected                   
					table.deleteRow(i); //delete the selected row                    
					rowCount--; //decrease rowcount by 1                   
					i--;
				}
			}
		}

		// append column to the HTML table
		function addColumn() {
			var tblHeadObj = document.getElementById('my_table').tHead; //table head
			for (var h = 0; h < tblHeadObj.rows.length; h++) {
				var newTH = document.createElement('th');
				tblHeadObj.rows[h].appendChild(newTH).contenteditable = "true"; //append ne th to table
				newTH.innerHTML = 'New Header '; //append th content to th
			}
			var tblBodyObj = document.getElementById('my_table').tBodies[0]; //table body
			for (var i = 0; i < tblBodyObj.rows.length; i++) {
				var newCell = tblBodyObj.rows[i].insertCell(-1); //create new cell

				newCell.innerHTML = '';//append data to cell
			}
		}

		// delete table rows with index greater then 0
		function deleteAllRows() {
			var tbl = document.getElementById('my_table'); // table reference        
			lastRow = tbl.rows.length - 1; // set the last row index           
			// delete rows with index greater then 0    
			for (i = lastRow; i > 1; i--) {
				tbl.deleteRow(i); //delete the row  
			}
		}

		// delete last table column
		function deleteColumn() {
			var allRows = document.getElementById('my_table').rows;
			for (var i = 0; i < allRows.length; i++) {
				if (allRows[i].cells.length > 2) {
					allRows[i].deleteCell(-1); //delete the cell
				} else {
					alert("You can't delete more columns.");
					return;
				}
			}
		}
	</script>
	
	
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
											var i = 1;
											var html = '';
											html += '<tr>';
											html += '<td contentedible="false"><input type="checkbox"/></td>';
											html += '<td><input type="text" name="typeoftesting" class="form-control item_name" /></td>';

											$('#item_table').append(html);
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

											
											var form_data = $(this).serialize();
											if (error == '') {
												$
														.ajax({
															url : "TestDataInsertServlet",
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
	
	
	
	
</body>
</html>
