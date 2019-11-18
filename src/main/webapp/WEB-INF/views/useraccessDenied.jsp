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
	<div class="container">
		<div class="row">
			<div class="panel-body">
				<div class="row">

					<div class="col-lg-12">
						<strong style="color: red;"><h2>Access Denied !!!</h2></strong>

						<div class="authbar">
							<h4>
								<span>Dear <strong>${loggedinuser}</strong>, You are not
									authorized for this operation.
								</span> <span class="floatRight"><a
									href="<c:url value='/logout' />"
									class="btn btn-sm btn-warning "><strong>LOGOUT</strong></a></span> <a
									href="<c:url value='/userlist' />"
									class="btn btn-sm btn-success "><strong>Go Back</strong></a>

							</h4>
						</div>
						<br>

						<div class="alert alert-info" role="alert">
							<strong>Heads up!</strong> This alert needs your attention, but
							it's not super important.
							<p></p>
						</div>
						<div class="alert alert-warning" role="alert">
							<strong>This you can do... </strong> Change a few things up and
							try submitting again.
						</div>
						<div class="alert alert-danger" role="alert">
							<strong>Please make sure</strong> you have appropriate
							permissions. Contact Administrator if need further assistance.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../fragments/footer.jsp"%>
</body>
</html>
