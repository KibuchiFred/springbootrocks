<%@include file="../fragments/header.jsp"%>
<style>
.table>tr, .table>th {
	line-height: 1px;
	height: 1px;
	text-align: center
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 0;
	text-align: left
}

.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
	/*background-color: #33BEFF;*/
	background-color: #33BEFF
}

.nav>li>a:hover, .nav>li>a:focus {
	background-color: #33BEFF;
	text-decoration: none;
}

.dropdown-menu>a:hover {
	background-color: #33BEFF;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid ">
<!-- 		<div class="card-header bg-info text-white p-0"> -->
			<div style="text-align: center">
				<h4><b>Welcome <strong>${pageContext.request.userPrincipal.name}</strong></b></h4>
			</div>
<!-- 		</div> -->
		<br>
		<div class="container">
		<img src="${contextPath}/resources/casemgmt.jpg" style='height: 10%; width: 80%; object-fit: contain'/>
	</div>
	</div>
<%@include file="../fragments/footer.jsp"%>
</body>
</html>