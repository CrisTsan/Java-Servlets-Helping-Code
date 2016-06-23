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
<head>
    <script type="text/javascript" src="js/list_users_with_filters.js"></script>
</head>
<body>
	<% 
		rs = c.executeQuery("SELECT * FROM mytable");
		String []cols = {"id", "username"}; //Columns for Printing
	%>
	
	<center>
	
	<br/>
	<h1> Database Printing with Filters</h1>
	
	<form action="">
  		<input type="radio" name="chars" id="all"  value="all"  onclick="check_radios()"> All<br>
  		<input type="radio" name="chars" id="more" value="more" onclick="check_radios()"> More Than 4 characters<br>
  		<input type="radio" name="chars" id="less" value="less" onclick="check_radios()"> Less Than 4 characters<br>
	</form>

	<!-- TABLE OF JSP DATA / BY HAND -->	
	<table id="result_table" border="5">
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

	</center>


</body>
</html>