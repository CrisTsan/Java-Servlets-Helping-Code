<!-- THIS PAGE IS ONLY TO BE CALLED THROUGH AJAX -->
<!-- It responds-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="iprog.*"%>

<%
	_DB_CONNECTION c = new _DB_CONNECTION();
	ResultSet rs = null;
%>

<%
	if (request.getParameter("username") != null) {

		String username = request.getParameter("username");

		if (c.exists("mytable","username",username)) {
			out.println("Username is available for deletion.");
		} else {
			out.println("Username doesn't exist.");
		}

	} else {
		out.println("You should pass 'username' as a GET/POST Parameter!");
	}
%>