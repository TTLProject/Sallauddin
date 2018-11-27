$(document).ready(function() {
	$('#projectname').click(function(event) {

		var projName = $('#projectname').val();
		if(""!=projName)
		{
			$.get('GetProjectInfoServlet', {
				projectName : projName,
				type		: "project"
			}, function(responseText) {
				var obj = JSON.parse(responseText);
				console.log("object  ",obj);

				var module  = obj.module.split(",");;
				console.log(module);
				
				var modselect  = "<option>Select</option>";
				module.forEach(function(mod){
					modselect += "<option value = "+mod+">" + mod + "</option>";
				});
				document.getElementById("modulename").innerHTML = modselect;
				
		
				var reqselect = "<option>Select</option>";
				document.getElementById("requirementname").innerHTML = reqselect;
			});
		}else{
			var reqselect = "<option>Select</option>";
			var modselect  = "<option>Select</option>";
			document.getElementById("modulename").innerHTML = modselect;
			document.getElementById("requirementname").innerHTML = reqselect;
		}   
	});
	
	$('#modulename').click(function(event) {

		var projName = $('#projectname').val();
		var modName = $('#modulename').val();

		if(""!=projName)
		{
			$.get('GetProjectInfoServlet', {
				projectName : projName,
				modName		: modName,
				type		: "module"
			}, function(responseText) {
				var obj = JSON.parse(responseText);
				console.log("object  ",obj);
				var requirement  = obj.requirement.split(",");
				console.log(requirement);
				
				var reqselect = "<option>Select</option>";
				requirement.forEach(function(req){
					console.log(req);
					reqselect += "<option value="+req+">" + req + "</option>";
				});
				document.getElementById("requirementname").innerHTML = reqselect;

			});
		}else{
			var reqselect = "<option>Select</option>";
			var modselect  = "<option>Select</option>";
			document.getElementById("modulename").innerHTML = modselect;
			document.getElementById("requirementname").innerHTML = reqselect;
		}   
	});
	
	
});