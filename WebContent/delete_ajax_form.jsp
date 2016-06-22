<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="iprog.*"%>




<html>
<head>
    <script type="text/javascript" src="js/myjs.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
     
</head>
<body>

	<br />
	<h3>Choose User for Deletion!</h3>
	<form name="myform" method="post"  action="delete_validation_and_forward.jsp">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" id="username" name="username" size=12 onblur="return doDeletionWork();" /></td>
				<td><span id="total"></span></td>
			</tr>
			
			<tr>
				<td colspan=2><input type=submit /></td>
			</tr>
		</table>
		<span style="color:red;" id="results_placeholder"></span>
	</form>

</body>
</html>