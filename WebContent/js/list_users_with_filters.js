
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

function doWork(number) {	
	httpObject = getHTTPObject();
	//alert("Preparing doWork() ");
	if (httpObject != null) {
		httpObject.open("GET","ajax_list_users_with_filters.jsp?filters="+number, true);
		httpObject.send(null);
		httpObject.onreadystatechange = setOutput;
	}
}

function check_radios() {
	if 	( document.getElementById('all').checked ) {
		console.log("clicked all")
		doWork(1)
	}
	else if (document.getElementById('more').checked ) {
		console.log("clicked more")
		doWork(2)
	} else {
		console.log("clicked less")
		doWork(3)
	}
}

function setOutput() {
	if (httpObject.readyState == 4 && httpObject.status==200) {
		document.getElementById('result_table').innerHTML = httpObject.responseText;
	} else {
		console.log( "ERROR HAPPENED");
	}
}