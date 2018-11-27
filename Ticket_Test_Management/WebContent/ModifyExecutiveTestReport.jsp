<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="userbean.Userbean"%>
<%@page import="java.util.HashSet"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	

<style>
table {
  border-collapse: initial;
  border-spacing: 0;
  margin: 1em auto;
  width: 98%;
 }
thead, th {
	background: $header-background;
	color: $header-color;
	text-align: center;
	font-family: 'open_sans_semibold';
	font-size: 1.08em;
}
td {
	border: 0.1em solid #9a9a9a;
	color: $hilight-contrast;
	font-size: 1.03em;
	 
	  padding: 8px;
	 background-color: #ffffff;
}
.registered_active {
	background-color: red;
}
.not_active {
	background-color: rgb(255,255,255);
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


<script type="text/javascript" language="javascript" src="jquery-2.1.1.js"></script>

<script type="text/javascript">

var addedrows = new Array();

$(document).ready(function() {
    $( "#sourcetable tbody tr" ).on( "click", function( event ) {
  
    var ok = 0;
    var theid = $( this ).attr('id').replace("sour","");	

	var newaddedrows = new Array();
	
    for	(index = 0; index < addedrows.length; ++index) {

		// if already selected then remove
		if (addedrows[index] == theid) {
			   
			$( this ).css( "background-color", "#FFFFFF" );
			
			// remove from second table :
			var tr = $( "#dest" + theid );
            tr.css("background-color","#FFFFFF");
            tr.fadeOut(400, function(){
                tr.remove();
            });
			
	        //addedrows.splice(theid, 1);	
    		
			//the boolean
			ok = 1;
		} else {
		
		    newaddedrows.push(addedrows[index]);
		} 
    }   
    
	addedrows = newaddedrows;
	
	// if no match found then add the row :
	if (!ok) {
		// retrieve the id of the element to match the id of the new row :
		
		
		addedrows.push( theid);
		
		$( this ).css( "background-color", "#cacaca" );
				
     	$('#destinationtable tr:last').after('<tr id="dest' + theid + '"  class="shifts_clickable"><td><input type="text" readonly="readonly" name="testcaseid[]"  value=' 
		                               + $(this).find("td").eq(0).html() + ' /></td><td><textarea rows="1" name="testdescription[]">' 
		                               + $(this).find("td").eq(1).html() + '</textarea></td><td><textarea rows="1" name="precondition[]">' 
		                               + $(this).find("td").eq(2).html() + '</textarea></td><td><textarea rows="1" name="testdesign[]">' 
		                               + $(this).find("td").eq(3).html() + '</textarea></td><td><textarea rows="1" name="expectedresult[]">'
		                               + $(this).find("td").eq(4).html() + '</textarea></td><td><textarea rows="1" name="actualresult[]">'
		                               + $(this).find("td").eq(5).html() + '</textarea></td><td><textarea rows="1" name="status[]">' 
		                               + $(this).find("td").eq(6).html() + '</textarea></td><td><textarea rows="1" name="comment[]">'
		                               + $(this).find("td").eq(7).html() + '</textarea></td><td style="display:none;"> <input type="text" name="id1[]" value ='
		                               + $(this).find("td").eq(8).html() + '></td></tr>');	 
		                            	   	  
		
	}

	
    });
});		
</script>		
</head>

<body>
<%Userbean user = (Userbean) session.getAttribute("session2");
Userbean user1 = (Userbean) session.getAttribute("modifysession");
String pname=request.getParameter("projectname");
String rname=request.getParameter("requirementname");
String mname= request.getParameter("modulename");
String un=request.getParameter("username");
if(un==null){
	un="none";
}
else{
	user1.setTable("table");
}
if(pname==null){
	pname="none";
}
if(rname==null){
	rname="";
}
if(mname==null){
	mname="none";
}
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
       <h2 style="color:white; align:center; padding-left:90%"><b><i>ModifyTestReport</i></b></h2>	
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
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->
<div id="div1">
<div id="alert_message"></div>
					<%
						
						/* 
						Userbean user2 = (Userbean) session.getAttribute("modifysession1");
						Userbean user3 = (Userbean) session.getAttribute("modifysession2"); */
						String uname, modulename = "none", requirementname = "none", projectname = "none";
						if (user1 == null) {
							uname = "none";

						} else {
							uname = user1.getUname();
						}
					%>
					<%
						ConnectionSteps steps = new ConnectionSteps();
						Connection conn = steps.connection();
						PreparedStatement pstmt = conn.prepareStatement("select * from testreporttable1");
						ResultSet rs = pstmt.executeQuery();
						HashSet<String> hs = new HashSet();
						while (rs.next()) {

							hs.add(rs.getString("assignedto"));
						}
						Iterator<String> itr = hs.iterator();
					%>
					<br><br>
					Employee Name:&emsp;&emsp;<select id="meetingPlace" style="width:200px; overflow:hidden">
						<option value="select">----select---</option>


						<%
							while (itr.hasNext()) {
								String name = itr.next();
						%>

						<option value=<%=name%>><%=name%></option>

						<%
							}
						%>
					</select>&emsp;&emsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
						if (user1 == null) {
						} else if (user1.getUname().equals("select")) {

						}

						else {
					%>
					<%-- <input type="text" value=<%=uname%> readonly="readonly"> --%>
					<br>
					<span  style="color:blue">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%=uname%></span>
					
					<%
						}
					%>

					<br><br>
					<div class="card-header">


						Project Name:&emsp;&emsp;&nbsp;&emsp;<select id="meetingPlace1" style="width:200px; overflow:hidden">
							<option>----select----</option>
							<table>
								<%
									PreparedStatement pstmt2 = conn.prepareStatement("select * from testreporttable1 where assignedto=?");
									pstmt2.setString(1, uname);
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
							if (user1 == null) {

							} else if (user1.getProjectName().equals("none")) {
							} else {
						%>
						<%-- <input type="text" value=<%=user1.getProjectName()%>
							readonly="readonly"> --%>
							<br>
							<span  style="color:blue">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%=user1.getProjectName() %></span>
						<%
							}
						%>
						
						
						<br> <br> Module Name:&emsp;&emsp;&nbsp;&nbsp;
						<select id="meetingPlace2" style="width:200px; overflow:hidden">
							<option>----select----</option>
							<table>
								<%
									PreparedStatement pstmt3 = conn
											.prepareStatement("select * from testreporttable1 where assignedto=? and projectname=?");
									pstmt3.setString(1, uname);

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
		<form action="ModifyExecutiveTestReport.jsp" method="post">
						<br>   Requirement
						Name:&nbsp;<select id="meetingPlace3" style="width:200px; overflow:hidden">
							<option>--select--</option>
							<%
								PreparedStatement pstmt4 = conn.prepareStatement(
										"select * from testreporttable1 where assignedto=? and projectname=? and modulename=? ");
								pstmt4.setString(1, uname);
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
							<input type="hidden" name="projectname"
								value=<%=user1.getProjectName()%>> <input type="hidden"
								name="modulename" value=<%=user1.getModuleName()%>> <input
								type="hidden" name="username" value=<%=user1.getUname()%>>
							<input type="hidden" value=<%=user1.getRequirementName()%> name="requirementname"
								readonly="readonly">
								<br>
							<span  style="color:blue">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<%=user1.getRequirementName() %></span>
							<%
								}
							%>
							<br>
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" name="submit" value="submit" />
						</form>
					</div>
				</div>
				<br>

				
				
					<table border="1" cellspacing="5" id="crud_table">
						<tr >
						<thead>
							<th>TestCase Id</th>
							<th>TestDescription</th>
							<th>Precondition</th>
							<th>TestDesign</th>
							<th>ExpectedResult</th>
							<th>ActualResult</th>
							<th>Status</th>
							<th>Comment</th>
						</thead>
						</tr>
						<tbody>
							<%
								PreparedStatement pstmt1 = conn.prepareStatement(
										"select * from testreporttable where  projectname=? and requirementname=? and modulename=? order by id");
								
								
									pstmt1.setString(1, pname);
									pstmt1.setString(2, rname);
									pstmt1.setString(3, mname);
								

								ResultSet rs1 = pstmt1.executeQuery();
								int i = 0;
								while (rs1.next()) {
									String value = "sour" + i;
							%>
							  <tr class="shifts_clickable">
	
        <td name="testcaseid[]" data-id="<%=rs1.getString("id") %>" data-column="testcaseid" class="testcaseid" class="unselectable"><%=rs1.getString("testcaseid") %></td>
        <td  contenteditable="true" name="testdescription[]" data-id="<%=rs1.getString("id") %>" data-column="testdescription" class="testdescription"><%=rs1.getString("testdescription") %></td>
		 <td contenteditable="true" name="precondition[]" data-id="<%=rs1.getString("id") %>" data-column="precondition" class="precondition"><%=rs1.getString("precondition") %></td>
		  <td contenteditable="true" name="testdesign[]" data-id="<%=rs1.getString("id") %>" data-column="testdesign" class="testdesign"><%=rs1.getString("testdesign") %></td>
		   <td contenteditable="true" name="expectedresult[]" data-id="<%=rs1.getString("id") %>" data-column="expectedresult" class="expectedresult"><%=rs1.getString("expectedresult") %></td>
		   <%if(rs1.getString("actualresult")==null){ %>
		   <td  name="actualresult[]" data-id="<%=rs1.getString("id") %>" data-column="actualresult" class="actualresult"></td>
		   <%}else{ %>
		    <td  name="actualresult[]" data-id="<%=rs1.getString("id") %>" data-column="actualresult" class="actualresult"><%=rs1.getString("actualresult") %></td>
		    <%} %>
		     <%if(rs1.getString("status")==null){ %>
		      <td  name="status[]" data-id="<%=rs1.getString("id") %>" data-column="status" class="status"></td>
		   <%}else{ %>
			 <td  name="status[]" data-id="<%=rs1.getString("id") %>" data-column="status" class="status"><%=rs1.getString("status") %></td>
			  <%} %>
		     <%if(rs1.getString("comments")==null){ %>
		      <td contenteditable="true" name="comment[]" data-id="<%=rs1.getString("id") %>" data-column="comments" class="comments"></td>
		      <%}else{ %>
			 <td contenteditable="true" name="comment[]" data-id="<%=rs1.getString("id") %>" data-column="comments" class="comments"><%=rs1.getString("comments") %></td>
			 <%} %>
			
			  <td style="display:none;" class="id"><%=rs1.getString("id")%></td>
			   <td style="display:none;" class="assignedto"><%=uname%></td>
      <input type="hidden" name="id[]" value=<%=rs1.getString("id")%>>
      <input type="hidden" name="assignedto[]" value=<%=uname%>>
      </tr>
  
      <%
   i++;
} %>
      <!-- This is our clonable table line -->
</tbody>

					</table>
					<p align="right">
						 <button type="button" name="save" id="save" class="btn btn-info">Modify</button>
						  <button type="button" name="save1" id="save1" class="btn btn-info">Approve</button>
						<!-- <input type="submit" name="approve" value="Approve" /> -->
					</p>
		


				<!--  <input type="button" name="approve" class="btn btn-info" value="Approve" /> -->

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


<script>
$('.shifts_clickable td').on('click',function() {
	if(($(this).data("column"))=="testcaseid"){
		
	}else if(($(this).data("column"))=="comments"){
	}else if(($(this).data("column"))=="actualresult"){
    }else if(($(this).data("column"))=="status"){
    }else{
							if ($(this).hasClass('registered_active')) {
							
								
								$(this).removeClass('registered_active').addClass('not_active');
							} else {
							
								
								
								$(this).removeClass('not_active').addClass('registered_active');
							}
	}
						})
    </script>

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


</body>
</html>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('#save1').click(function(){
			var testdescription = [];
			  var precondition = [];
			  var testdesign = [];
			  var expectedresult = [];
			  var comments = [];
			   var assignedto = [];
			 var id = [];
			 $('.testdescription').each(function(){
				  testdescription.push($(this).text());
			  });
			  $('.precondition').each(function(){
				  precondition.push($(this).text());
			  });
			  $('.testdesign').each(function(){
				  testdesign.push($(this).text());
			  });
			  $('.expectedresult').each(function(){
				  expectedresult.push($(this).text());
			  });
			  $('.comments').each(function(){
				  comments.push($(this).text());
			  });
			 $('.id').each(function(){
				  id.push($(this).text());
			  });
			   $('.assignedto').each(function(){
				  assignedto.push($(this).text());
			  });
			 
			  $.ajax({
				   url:"ModifyTestReportServlet1",
				   method:"POST",
				   data:{testdescription:testdescription, precondition:precondition, testdesign:testdesign, expectedresult:expectedresult,comments:comments,id:id,assignedto:assignedto },
				   success:function(data){
					   $('#alert_message').html('<div class="alert alert-success" align="center">'+data+'</div>');
				  
				   }
				  });
			  
			  setInterval(function(){
				     $('#alert_message').html('');
				    }, 5000);
				 });
		
		
		$('#save').click(function(){
			  var testcaseid = [];
			  var testdescription = [];
			  var precondition = [];
			  var testdesign = [];
			  var expectedresult = [];
			  var actualresult = [];
			  var status = [];
			  var comments = [];
			  var id = [];
			  var assignedto = [];
			  var color1=[]; 
			  var color2=[]; 
			  var color3=[]; 
			  var color4=[]; 
			  var color5=[]; 
			 
			  
			  $('.testcaseid').each(function(){
				  testcaseid.push($(this).text());
			  });
			  $('.testdescription').each(function(){
				  if ($(this).hasClass('registered_active')) {
						
						 color1.push("red");
					
					} else {
						
						
						 color1.push("white");
					}  
				 
				  testdescription.push($(this).text());
				 
			  });
			  $('.precondition').each(function(){
				  if ($(this).hasClass('registered_active')) {
						
						 color2.push("red");
					
					} else {
						
						
						 color2.push("white");
					} 
				  precondition.push($(this).text());
			  });
			  $('.testdesign').each(function(){
				  if ($(this).hasClass('registered_active')) {
						
						 color3.push("red");
					
					} else {
						
						
						 color3.push("white");
					} 
				  testdesign.push($(this).text());
			  });
			  $('.expectedresult').each(function(){
				  if ($(this).hasClass('registered_active')) {
						
						 color4.push("red");
					
					} else {
						
						
						 color4.push("white");
					} 
				  expectedresult.push($(this).text());
			  });
			  $('.actualresult').each(function(){
				  actualresult.push($(this).text());
			  });
			  $('.status').each(function(){
				  status.push($(this).text());
			  });
			   $('.assignedto').each(function(){
				  assignedto.push($(this).text());
			  });
			  $('.comments').each(function(){
				  if ($(this).hasClass('registered_active')) {
						
						 color5.push("red");
					
					} else {
						
						
						 color5.push("white");
					} 
				  comments.push($(this).text());
			  });
			  $('.id').each(function(){
				  id.push($(this).text());
			  });
			  
			  $.ajax({
				   url:"ModifyTestReportServlet",
				   method:"POST",
				   data:{testcaseid:testcaseid, testdescription:testdescription, precondition:precondition, testdesign:testdesign, expectedresult:expectedresult, actualresult:actualresult, status:status,assignedto:assignedto, comments:comments, id:id, color1:color1, color2:color2, color3:color3, color4:color4, color5:color5},
				   success:function(data){
					   $('#alert_message').html('<div class="alert alert-success" align="center">'+data+'</div>');
					   
				  
				   }
				  });
			  setInterval(function(){
				     $('#alert_message').html('');
				    }, 5000);
				 });
		
		
		

		$("#meetingPlace").on("change", function() {
			var value = $(this).val();

			update_data1(value);
		});
		function update_data1(value) {
			$.ajax({
				url : "Modify.jsp",
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
				url : "Modify1.jsp",
				method : "POST",
				data : {
					value1 : value1
				},
				success : function(data) {
					//$("#div2").load("NewFile.jsp #div2");
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
				url : "Modify2.jsp",
				method : "POST",
				data : {
					value2 : value2
				},
				success : function(data) {
					//	$("#div3").load("NewFile.jsp #div3");
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
				url : "Modify3.jsp",
				method : "POST",
				data : {
					value2 : value2
				},
				success : function(data) {
					//	$("#div3").load("NewFile.jsp #div3");
					location.reload();

				}
			});

		}

	});
</script>