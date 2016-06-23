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
		rs = c.executeQuery("SELECT * FROM mytable");
		String []cols = {"username","id" }; //Columns for Printing
		String type = request.getParameter("filters");
		System.out.println(type);
%>


		<tr>
			<% for (String column:cols) {%>
				<td><%=column%></td>
			<% } %>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<% for (String column:cols) {
				if (type.equals("2") && rs.getString("username").length()<4) {
					continue;
				} 
				if (type.equals("3") && rs.getString("username").length()>4) {
					continue;
				} 
				
				%>
				
				<td><%=rs.getString(column)%></td>
			<% } %>
		</tr>
		
		<%
		}
		rs.close();
		%>