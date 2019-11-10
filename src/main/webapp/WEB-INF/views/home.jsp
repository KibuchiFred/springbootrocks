<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container-fluid ">
		<div class="card-header bg-info text-white p-0">
			<div style="text-align: center">
				<h4><b>Welcome <strong>${pageContext.request.userPrincipal.name}</strong></b></h4>
			</div>
		</div>
		<br>
		<div class="container">
		<img src="${contextPath}/resources/casemgmt.jpg" style='height: 10%; width: 80%; object-fit: contain'/>
	</div>
	</div>


 <footer class="footer">
      <div class="container">
        <span class="text-muted">SPRING BOOT ROCKS. Open-source
			software development 2019</span>
      </div>
    </footer>
</body>
</html>