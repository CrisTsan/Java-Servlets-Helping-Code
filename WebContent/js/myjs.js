

function validate_form()
{
	console.log("Trying To Validate Given Form :-)");
    var valid = true;
    
    var given_name     = document.getElementById("username").value;
    var given_password = document.getElementById("password").value;
   
    var results_placeholder = document.getElementById("results_placeholder");
    var results_string = "";
    
    if(given_name == "")	
    {
    	results_string += "[ Please Provide a non-empty username]<br/>";
        valid = false;
    }
    if(given_password.length <= 4)	
    {
    	results_string += " [ Please Provide a password with more than 4 characters ]<br/>";
        valid = false;
    }
    
    if (!valid) results_placeholder.innerHTML = results_string;
    return valid;
}

// Get the HTTP Object
var httpObject = null;
function getHTTPObject() {
	if (window.ActiveXObject)
		return new ActiveXObject("Microsoft.XMLHTTP");
	else if (window.XMLHttpRequest)
		return new XMLHttpRequest();
	else {
		alert("Your browser does not support AJAX.");
		return null;
	}
}

function doWork() {	
	httpObject = getHTTPObject();
	//alert("Preparing doWork() ");
	if (httpObject != null) {
		httpObject.open("GET", "_ajax_check_username.jsp?username="+document.getElementById('username').value, true);
		httpObject.send(null);
		httpObject.onreadystatechange = setOutput;
	}
}
function doDeletionWork() {	
	httpObject = getHTTPObject();
	//alert("Preparing doWork() ");
	if (httpObject != null) {
		httpObject.open("GET", "_ajax_check_username_for_delete.jsp?username="+document.getElementById('username').value, true);
		httpObject.send(null);
		httpObject.onreadystatechange = setOutput;
	}
}

function setOutput() {
	if (httpObject.readyState == 4 && httpObject.status==200) {
		//alert("total = " + httpObject.responseText);
		var responseFromPage = httpObject.responseText;
		if(responseFromPage.indexOf("available") != -1) {
			document.getElementById('total').style.color = "green";	 	    
	    }
		else {
			document.getElementById('total').style.color = "red";		
		}
		document.getElementById('total').innerHTML = httpObject.responseText;
	}
}


