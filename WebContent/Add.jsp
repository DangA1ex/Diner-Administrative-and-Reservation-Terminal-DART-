<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import = "java.io.*,java.util.*" %>

 <%-- 
<style>
table {
	 margin: 2%;
     padding: 30px;
     float: left;
}


</style>--%>

   <%
   
   Date createTime = new Date(session.getCreationTime());
   Date lastAccessTime = new Date(session.getLastAccessedTime());
   
   session.setMaxInactiveInterval(60*60*24);

   String title = "Welcome Back to my website";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");

   if (session.isNew() ){
      title = "Welcome to my website";
     
      session.setAttribute(visitCountKey,  visitCount);
   } 
   
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   session.setAttribute(visitCountKey,  visitCount);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>ORDERS</title>
</head>
<body>
<form action = "OrderController" method = "get">
<h1>ORDERS</h1>

<h3><%out.print("sessions interval time in sec: " +session.getMaxInactiveInterval());%></h3>
<h3><% out.print("create time : " + createTime); %></h3>
<% out.print("last access time" + lastAccessTime); %>


<c:forEach items="${menus}" var="entry">
	<table border="2">
		<tr>
			<td><h4><input type = "checkbox" name = "food" value =${entry.id}> ${entry.name} </h4></td>
		</tr>
		
	</table>
</c:forEach>
 </body>
</html>

