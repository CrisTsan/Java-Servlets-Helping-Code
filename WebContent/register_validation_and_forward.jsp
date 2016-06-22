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
				<jsp:forward page="register_ajax_form.jsp"></jsp:forward>
			<% } else {
			
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				if (!c.exists("mytable","username",username)) {
					String sql = "INSERT INTO mytable (username, password) VALUES( \"" + username  + "\" ,\"" + password + "\") ;";					
					int result = c.executeUpdate(sql);
				%>
					<jsp:forward page="index.jsp">
						<jsp:param value="<%=username%>" name="username" />
					</jsp:forward>
			
				<% } else {
					%>
					<h1>
						User with username <%=username%>
						already exists!
					</h1>
					Please re-enter your details
					<a href="register_ajax_form.jsp">here</a>
				<% } 
				rs.close();
			} %>


</body>
</html>