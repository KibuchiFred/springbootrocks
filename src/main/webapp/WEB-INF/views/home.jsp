<%@include file="../fragments/header.jsp"%>
<body>
<br><br><br>
	<div class="container-fluid ">
		<div class="card-header bg-info text-white p-0">
			<div style="text-align: center">
				Welcome <strong>${pageContext.request.userPrincipal.name}</strong>
			</div>
		</div>
		<br>
		<div class="container">
		

<%-- 		img style='border:1px solid #33BEFF' src="${contextPath}/resources/casemgmt.jpg" / --%>
		<img src="${contextPath}/resources/casemgmt.jpg" style='height: 100%; width: 100%; object-fit: contain'/>
	</div>
	</div>

	
	<br><br><br>
	<%@include file="../fragments/footer.jsp"%>

