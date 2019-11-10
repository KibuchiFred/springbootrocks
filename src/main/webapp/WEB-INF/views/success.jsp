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
<body>
	<div class="container">


		<div class="alert alert-success lead">
			${success}
			<!--                 <span class="floatRight"> -->
			<%-- 			<a href="<c:url value='/userlist' />"class="btn btn-primary btn-sm">Go to Users List</a> --%>
			<!-- 		</span> -->
		</div>


	</div>
	<%@include file="../fragments/footer.jsp"%>