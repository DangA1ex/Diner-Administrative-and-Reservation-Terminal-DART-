<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- set data source --%>

<sql:setDataSource driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://cs3.calstatela.edu/cs3220stu96" user="cs3220stu96"
	password=".ki7x#5L" />



<sql:query var="do">

Select COUNT(cost) from orders2 ;

</sql:query>


<sql:query var="items">
		
Select * from Menus;
</sql:query>


<sql:query var="orders">
		
Select * from orders2;
</sql:query>

<sql:query var="tables">
		
Select * from tables;
</sql:query>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>

	<h1>Admin</h1>






	<%-- 
	<button onclick="myFunction()">Copy Text</button>

	<script>
		function myFunction() {

		}
	</script>

	<table border="1" cellpadding="5" width="500">

		<tr>
			<th>Name</th>

			<th>Link</th>
		</tr>

		<c:forEach items="${dbEntries}" var="entry">
			<tr>

				<td><c:out value="${entry}" /></td>
				<td><input type="submit" name="Link" value="edit"></td>

			</tr>
		</c:forEach>
	</table>

	<br>
--%>



	





	

	<br>

	<h3>Table Database</h3>
	<br>

	<table border="1">

		<tr>
			<%--<th>Modify</th> --%>

			<c:forEach items="${tables.columnNames}" var="col">
				<th><c:out value="${col}" /></th>
			</c:forEach>
		</tr>

		<c:forEach items="${tables.rowsByIndex}" var="row">
			<tr>
				<%-- <td><input type="submit" name="edit" value="edit"></td>--%>
				<c:forEach items="${row}" var="col">
					<td>${col}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>

	<br>


	<%
		int cost = 0;
	%>
	<h3>Order Database</h3>
	<br>
	<table border="1">

		<tr>
			<%--<th>Modify</th> --%>

			<c:forEach items="${orders.columnNames}" var="col">
				<th><c:out value="${col}" /></th>
			</c:forEach>
		</tr>

		<c:forEach items="${orders.rowsByIndex}" var="row">
			<tr>
				<%-- <td><input type="submit" name="edit" value="edit"></td>--%>
				<c:forEach items="${row}" var="col">
					<td>${col}</td>

					<%
						if ("${orders.columnNames}" == "cost") {

									cost += Double.parseDouble("${row}");
									
								}
					%>

				</c:forEach>
			</tr>
		</c:forEach>
	</table>




	<h3>Menu Database</h3>
	<br>

	<table border="1">

		<tr>
			<%--<th>Modify</th> --%>

			<c:forEach items="${items.columnNames}" var="col">
				<th><c:out value="${col}" /></th>
			</c:forEach>
		</tr>

		<c:forEach items="${items.rowsByIndex}" var="row">
			<tr>
				<%-- <td><input type="submit" name="edit" value="edit"></td>--%>
				<c:forEach items="${row}" var="col">
					<td>${col}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>


<br>


<h3>Total Cost of The Day: <c:out value= "${cost}"/></h3>
</body>
</html>