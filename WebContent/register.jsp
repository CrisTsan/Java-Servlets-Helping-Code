<!--  SUPER SIMPLE REGISTER! -->
<!--  No username collision checking / no AJAX. -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
	
	<%@ page import="java.sql.*"%>
	<%@ page import="iprog.*"%>
	<% _DB_CONNECTION c = new _DB_CONNECTION(); %>
	
<html>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<body>

	<% if (request.getParameter("username") == null || request.getParameter("password") == null ) { %>
	
	<h2>Register! </h2>
	
	<!--  Change method="get" to method="post" for appropriate parameter passing -->
	<form method="get" action="register.jsp">
		
			Name: <input type="text" name="username" placeholder="username" size=12 />
			Password: <input type="password" name="password" placeholder="password" size=12 />
			<input type=submit />
		
	</form>
	
	<% } else {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sql = "INSERT INTO mytable (username, password) VALUES( \"" + username  + "\" ,\"" + password + "\") ;";
		
		if (c.executeUpdate(sql) >= 0) { %>
			<h1> Thank you for registering user <%=username%></h1>
		<% } else { %>
			<h1> Something's wrong! </h1>
		<% }  %>
	<%}%>

	</body>
</html>