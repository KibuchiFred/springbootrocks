<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container-fluid ">
<!-- 		<div class="card-header bg-info text-white p-0"> -->
			<div style="text-align: center">
				<h4><b>Welcome <strong>${pageContext.request.userPrincipal.name}</strong></b></h4>
			</div>
<!-- 		</div> -->
		<br>
		<div class="container">
		

<%-- 		img style='border:1px solid #33BEFF' src="${contextPath}/resources/casemgmt.jpg" / --%>
		<img src="${contextPath}/resources/casemgmt.jpg" style='height: 80%; width: 100%; object-fit: contain'/>
	</div>
	</div>

	
	<%@include file="../fragments/footer.jsp"%>

