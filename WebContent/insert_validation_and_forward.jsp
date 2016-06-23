<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="iprog.*"%>

<%
	_DB_CONNECTION c = new _DB_CONNECTION();
	ResultSet rs = null;

%>
<html>
<body>
			<% if (   request.getParameter("username") == null || request.getParameter("password") == null ) { %>
				<jsp:forward page="insert_ajax_form.jsp"></jsp:forward>
			<% } else {
			
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				if (!c.exists("mytable","username",username)) {
					String sql = "INSERT INTO mytable (username, password) VALUES( \"" + username  + "\" ,\"" + password + "\") ;";					
					int result = c.executeUpdate(sql);
				%>
					<h1>
						Inserted <%=username%> in the database!!
					</h1>
				<% } else {
					String sql = "UPDATE mytable SET password=\"" + password  + "\" where username=\""+ username +"\" ;";					
					int result = c.executeUpdate(sql);
					%>
					<h1>
						Updated user <%=username%> 's password!!
					</h1>
				<% } 
			} %>


</body>
</html>