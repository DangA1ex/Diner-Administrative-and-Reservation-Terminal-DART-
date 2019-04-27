<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
table {
	 margin: 2%;
     padding: 30px;
     float: left;
}


</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<p class="text-right"><a href="Logout">Logout</a></p>

<title>ORDERS</title>
</head>
<body>
<form action = "OrderController" method = "get">
<div class="card">
	<div class="card-body">
		<h1>ORDERS</h1>
		<c:forEach items="${menus}" var="entry">
			<table border="2">
				<tr>
					<td>
						<h4>
							<input type = "checkbox" name = "food" value =${entry.id}> ${entry.name} 
							<input type="hidden" name="tableId" value="${tableId}" />
						</h4>
					</td>
				</tr>
				
			</table>
		</c:forEach>
	</div>
</div>
<p><input type="submit" value="Order"></p>
</form>
</body>
</html>


