<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="iprog.*"%>
	<%
	_DB_CONNECTION c = new _DB_CONNECTION();
	ResultSet rs = null;
	%>
	
	<h1> Welcome 
		<% 	String username = request.getParameter("username");
			if (username==null) out.println("Stranger");
			else out.println(username);
		%>
	</h1>
	<h3> Thanks for joining!</h3>
	<h3> Date : <%=new java.util.Date() %></h3>
	<h5> The request was made with the <%=request.getMethod()%> HTTP method</h5>	

	
</body>
</html>