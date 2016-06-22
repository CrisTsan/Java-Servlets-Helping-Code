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
	<% 
		rs = c.executeQuery("SELECT * FROM mytable");
		String []cols = {"id", "username"}; //Columns for Printing
	%>
	
	<center>
	
	<br/>
	<h1> Database Printing by Hand </h1>
	<!-- TABLE OF JSP DATA / BY HAND -->	
	<table border="5">
		<tr>
			<% for (String column:cols) {%>
				<td><%=column%></td>
			<% } %>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<% for (String column:cols) {%>
				<td><%=rs.getString(column)%></td>
			<% } %>
		</tr>
		
		<%
		}
		rs.close();
		%>
	</table>
	
	<!----------- ALTERNATIVE!!! --------------->
	<!---- Printing all records/all columns ---->
	
	<%
		rs = c.executeQuery("SELECT * FROM mytable"); 
		ResultSetMetaData meta_data = rs.getMetaData();
	%>
	
	<h1> Automated Printing of DB </h1>
		We have a total of <%=meta_data.getColumnCount()%> Rows!
		
		<table border="5">
		
		<tr>
		<% 
		for (int i=1; i<= meta_data.getColumnCount(); i++) { %>
			<td><%=meta_data.getColumnName(i)%></td>
		<% } %>
		</tr>
		
		<% while (rs.next()) { %>
		<tr>
			<% for (int i=1 ; i <= meta_data.getColumnCount(); i++) { %>
			
			<td><%=rs.getString(i)%></td>
			
			<% } %>
		</tr>
		
		<% }
		rs.close(); 
		%>
	</table>
	

	</center>


</body>
</html>