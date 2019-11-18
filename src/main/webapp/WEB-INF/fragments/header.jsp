<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Spring Boot Rocks</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<link rel="stylesheet" src="css/main.css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.js"></script>
<style>
.error {
	color: #ff0000;
}
.footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	height: 20px; */
	line-height: 20px;
	background-color: #f5f5f5;
}
.btn-super-large {
	width: 200px;
	height: 200px;
}
.jumbotron {
padding-top: 0;
 padding-bottom: 0;
 }
.logo-icon {
	transform: scale(10.0, 10.0);
	-ms-transform: scale(10.0, 10.0); /* IE 9 */
	-moz-transform: scale(10.0, 10.0); /* Firefox */
	-webkit-transform: scale(10.0, 10.0); /* Safari and Chrome */
	-o-transform: scale(10.0, 10.0); /* Opera */
}
</style>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark py-0">
		<a class="navbar-brand" href="#">SPRING BOOT ROCKS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<sec:authorize
				access="hasAuthority('ADMIN') or hasAuthority('EDITOR') or hasAuthority('VIEWER')">
				<ul class="navbar-nav mr-auto">

					<li class="nav-item active"><a class="nav-link" href="/home">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Drop Down List</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
							<div class="dropdown-divider"></div>
							<h6 class="text-muted" href="#">Group1</h6>
							<a class="dropdown-item" href="#"> Somelink </a> <a
								class="dropdown-item" href="#"> Somelink </a> <a
								class="dropdown-item" href="#"> Somelink </a> <a
								class="dropdown-item" href="#"> Search </a> <a
								class="dropdown-item" href="#"> Delegate</a> <a
								class="dropdown-item" href="#"> Messages</a>
							<h6 class="text-muted" href="#">Reports</h6>
							<a class="dropdown-item" href="#"> This Month</a> <a
								class="dropdown-item" href="#"> Last quarter</a> <a
								class="dropdown-item" href="#"> Yearly </a>
						</div></li>
						<li class="nav-item active"><a class="nav-link" href="/h2-console/">H2-DB-Console
							<span class="sr-only">(current)</span>
					</a></li>
				</ul>


				<div class="btn-group">
					<button type="button" class="btn btn-danger dropdown-toggle btn-sm"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Super Admin</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/userlist">Manage Users</a> <a
							class="dropdown-item" href="#">More Actions</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">And Some More</a>
					</div>
				</div> - -



<%-- 				<form class="form-inline mt-2 mt-md-0"> --%>
<!-- 					<input class="form-control form-control-sm mr-sm-2" type="text" -->
<!-- 						placeholder="Search" aria-label="Search"> -->
<!-- 					<button class="btn  btn-sm btn-success my-2 my-sm-0" type="submit">Search</button> -->
<%-- 				</form> --%>
				<a href="${contextPath}/logout" class="btn btn-warning btn-sm"
					role="button" aria-pressed="true">${pageContext.request.userPrincipal.name}&nbsp&nbsp<i
					class="fas fa-sign-out-alt"></i> Logout
				</a>
			</sec:authorize>
		</div>
	</nav>
	
	<hr/><hr/>
	
	
	