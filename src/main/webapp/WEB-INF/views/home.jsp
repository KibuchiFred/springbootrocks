<%@include file="../fragments/header.jsp"%>


<nav class="col-md-100 d-none d-md-block bg-light sidebar">
	<div class="sidebar-sticky">
		<br>

		<h6
			class="sidebar-heading justify-content-between align-items-center px-3 text-muted">
			<span>Activities</span> <a
				class="d-flex align-items-center text-muted" href="#"> </a>
		</h6>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link active" href="#">
					All Cases <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Assigned to my role </a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Assigned to my group </a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Search Cases </a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Delegate </a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Messages </a></li>
		</ul>

		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Reports</span> <a class="d-flex align-items-center text-muted"
				href="#"> </a>
		</h6>
		<ul class="nav flex-column mb-2">
			<li class="nav-item"><a class="nav-link active" href="#">
					Cases Opened This Month </a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Cases Opened Last quarter </a></li>
			<li class="nav-item"><a class="nav-link active" href="#">
					Yearly report </a></li>
		</ul>
	</div>
</nav>

<body>

	<div class="container">
		<div class="card-header bg-info text-white p-0">
			<h4>
				Welcome <strong style="color: red;">${pageContext.request.userPrincipal.name}</strong>
				!! - Spring Boot based <strong style="color: blue;">Case
					Management</strong> Demo
			</h4>
			<%--   <h6><a href="${contextPath}/logout"><p style="text-align:center">Logout</a></p></h6> --%>
		</div>

		<!-- img style='border:1px solid #33BEFF' src="${contextPath}/resources/casemgmt.jpg" / -->
		<img src="${contextPath}/resources/casemgmt.jpg" />
	</div>
	<%@include file="../fragments/footer.jsp"%>