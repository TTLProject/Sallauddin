<!--author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="userbean.Userbean"%>
<html>
<head>
<title>Registration Form</title>
<!-- metatags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Sports Camp Registration Form a Flat Responsive Widget,Login form 
widgets, Sign up Web 	forms , Login signup Responsive web form,Flat Pricing table,Flat Drop 
downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 
0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- css files -->
<link rel="stylesheet" href="logincss/jquery-ui.css"/>
<link href="logincss/style.css" rel="stylesheet" type="text/css" media="all"/><!--stylesheet-css-->
<link 
href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" 
rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">

	
	<script type="text/javascript">
  function AllowNumbersOnly(e) {
    var code = (e.which) ? e.which : e.keyCode;
    if (code > 31 && (code < 48 || code > 57)) {
      e.preventDefault();
    }
  }
</script>

	
	
	
<!-- //css files -->
</head>
<body>
<%
		Userbean user = (Userbean) session.getAttribute("registration");
%>

	<center><h3>Registration Failed</h3></center>
   <center><h4 style="color:white;">password and cofirmpassword doesnot match</h4></center>
<div class="w3l-main"><br>
	<div class="w3l-from">
		<form action="RegistrationServlet" method="post" enctype="multipart/form-data">	
			<div class="w3l-user">
				<label class="head">Name<span class="w3l-star"> * </span></label>
				<input type="text" name="name" placeholder="" pattern="[a-zA-Z]{0,30}" 
title="enter aplhabets only max 30 characters" autofocus required="">
			</div>
			<div class="w3l-user">
				<label class="head">EmpId<span class="w3l-star"> * </span></label>
				<input type="text" name="id" placeholder="" required="">
			</div>
			<div  class="w3l-options1">
				<label class="head">Domain<span class="w3l-star"> * </span></label>	
					<select class="category1" required="" name="domain">
						<option value=" " disabled selected>select</option>
						<option value="java">java</option>
					    <option value="dotnet">dotnet</option>
                        <option value="testing">testing</option>						
                        						
					
						
					</select>
			</div>
			<div class="w3l-user">
				<label class="head">Username<span class="w3l-star"> * </span></label>
				<input type="text" name="username" placeholder="" required="">
			</div>
			<div class="w3l-user">
				<label class="head">Password<span class="w3l-star"> * </span></label>
				<input type="password" name="password" placeholder="" 
pattern="((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,16})" title="password must atleast contain 
one uppercase letter,one lowercase letter, one special character and one one number 
with min 8 and max 16 characters" required="">
			</div>
			<div class="w3l-user">
				<label class="head">Confirm Password<span class="w3l-star"> * </span></label>
				<input type="password" name="confirmpassword" placeholder="" 
				pattern="((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,16})" title="password must atleast contain 
one uppercase letter,one lowercase letter, one special character and one one number 
with min 8 and max 16 characters"
				required="">
			</div>
			<div class="w3l-mail">
				<label class="head">Email Id<span class="w3l-star"> * </span></label>
				<input type="email" name="email" placeholder="" required=""
				pattern="[a-z0-9._%+-]*[@]\b(gmail.com)">
			</div>
			<div class="w3l-mail">
				<label class="head">Web mail<span class="w3l-star"> * </span></label>
				<input type="email" name="webmail" placeholder="" required="" 
				pattern="[a-z0-9._%+-]*[@]\b((cubicitsolution.in)||(cubicitsolution.com))">
			</div>
			<div class="w3l-user">
				<label class="head">Mobile<span class="w3l-star"> * </span></label>
				<input type="text"  name="mobile" placeholder="" required=""
				onkeypress="return AllowNumbersOnly(event)" required
									autocomplete="off"  maxlength="10" minlength="10">
			</div>
			
			<div class="w3l-options1">
				<label class="head">Designation<span class="w3l-star"> * </span></label>	
					<select class="category1" required="" name="designation">
						<option value=" " disabled selected>select</option>
						<option value="softwaretrainee">Software Trainee</option>
						<option value="qualityanalyst">Quality Analyst</option>
						<option value="softwaredeveloper">Software Developer</option>
						<option value="hrdepartment">HR Department</option>
						<option value="executivequalityanalyst">Executive QualityAnalyst</option>
						<option value="executivesoftwaredeveloper">Executive SoftwareDeveloper</option>
					</select>
			</div><br>
			<br><br><br>
				<div class="w3l-user">
				<label class="head"><span class="w3l-star"></span></label>
				<input type="file" name="photo" placeholder="" required="">
			</div>
				<!--<div class="w3l-date">
					<label class="head">Birth Date<span class="w3l-star"> * </span></label>
						<div class="styled-input">
							<input class="date" id="datepicker" name="Text" type="text" 
value="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == 
'') {this.value = 'MM/DD/YYYY';}" required="">
						</div>
					</div>	-->
			
			<div class="w3l-rem">

			
			<div class="btn">
					<input type="submit" name="submit"  value="Submit"/>
				</div>
			
			</div>
			
			<div class="clear"></div>
		</form>
	</div>
</div>
	
	<!-- Default-JavaScript --> <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<!-- Calendar -->
<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
		$( "#datepicker,#datepicker1" ).datepicker();
		});
	</script>
<!-- //Calendar -->

</body>
</html>