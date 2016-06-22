<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="iprog.*"%>

<%
	_DB_CONNECTION c = new _DB_CONNECTION();

%>
<html>
<body>
			<% if (   request.getParameter("username") == null ) { %>
				<jsp:forward page="delete_ajax_form.jsp"></jsp:forward>
			<% } else {
			
				String username = request.getParameter("username");
				
				if (c.exists("mytable","username",username)) {
					String sql = "DELETE FROM mytable WHERE username=\"" + username  + "\" ;";	
					System.out.println(sql);
					int result = c.executeUpdate(sql);
				%>
					<jsp:forward page="index.jsp">
					<jsp:param value="<%=username%>" name="username" />
					</jsp:forward>
			
				<% } else {
					%>
					<h1>
						User with username <%=username%>
						doesn't exist!!!
					</h1>
					Please re-enter user for deletion
					<a href="delete_ajax_form.jsp">here</a>
				<% } 
	
			} %>


</body>
</html>