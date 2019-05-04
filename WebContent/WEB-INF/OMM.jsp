<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Menu</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 6em;
}
</style>
</head>
<body>
	<div class="container">

		<nav class="navbar fixed-top navbar-dark bg-dark">
	        <button class="navbar-toggler" data-toggle="dropdown" id="dropButton">
	        	<span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="dropdown-menu">
	            <div id="drop">
	            </div>
	            <hr>
	            <button>Submit</button>
	        </div>
	
	        <h1>DART</h1>
    	</nav>

		<div class="row">
			<c:forEach items="${menu}" var="menu" varStatus="status">
				<div class="col-sm-3">
					<div class="card" onclick="addItem('${menu.name}',${menu.id})">
						<div class="card-body">
				        	<h5 class="card-title"><c:out value="${menu.name}"/></h5>
				    		<p class="card-text"><c:out value="${menu.price}"/></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<nav class="navbar fixed-bottom navbar-dark bg-dark">
	        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Service</button>
	        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Check</button>
    	</nav>
	</div>
	
	<script>
		
		function item(name, id) {
			this.name = name;
			this.id = id;
		}
		
		var order = [];
		
		function addItem(name, id) {
			if (order.length < 3) {
				order.push(new item(name, id));
				
				var food = document.createElement("div");
				var name = document.createTextNode(name + "\t");
				food.append(name);
				
				var remove = document.createElement("button");
				remove.innerHTML = "-";
				remove.className = "btn btn-danger btn-number";
				remove.onclick = function(id){
					order.pop(id);
					
				}
				food.append(remove);
				
				console.log(order);
				
				document.getElementById("drop").appendChild(food);
			} else {
				alert("max order");
			}
		}
		
	</script>
</body>
</html>