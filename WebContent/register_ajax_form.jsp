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
	<h3>Please Register!</h3>
	<form name="myform" method="post" onsubmit="return validate_form()" action="register_validation_and_forward.jsp">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" id="username" name="username" size=12 onblur="return doWork();" /></td>
				<td><span id="total"></span></td>
			</tr>
			
			<tr>
				<td>Password:</td>
				<td>
					<input  id="password" type="password" name="password" size=12 
								onfocus="console.log('element got focus')"
								oninput="console.log('element got some input')" 
								onclick="console.log('element has been clicked')"
								/>
				</td>
			</tr>
			
			<tr>
				<td colspan=2><input type=submit /></td>
			</tr>
		</table>
		<span style="color:red;" id="results_placeholder"></span>
	</form>

</body>
</html>