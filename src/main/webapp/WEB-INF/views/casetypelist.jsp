<%@include file="../fragments/header.jsp"%>
<body>

	<div class="container-fluid ">
		<div class="card-header bg-info text-white p-0">
			<div style="text-align: center">
				<h4>Manage Case Types</h4>
			</div>
		</div>
		<br>
		<table id="tableitems"
			class="table table-condensed table-hover table-responsive-sm width=100%">
			<!-- 			<thead class="thead-light"> -->
			<thead>
				<tr>
					<th>ID</th>
					<th>Casetype Name</th>

					<th><sec:authorize
							access="hasAuthority('ADMIN') or hasAuthority('DBA')">
						</sec:authorize> <sec:authorize access="hasAuthority('ADMIN')">
						</sec:authorize>Actions</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${casetypes}" var="casetype">
					<tr>
						<td>${casetype.id}</td>
						<td>${casetype.casetypename}</td>
	

						<td><sec:authorize
								access="hasAuthority('ADMIN') or hasAuthority('EDITOR') or hasAuthority('VIEWER')">
								<button class="btn btn-sm btn-outline-primary viewBtn"
									data-toggle="modal" data-target="#viewModal">
									<span class="far fa-id-card"></span>
								</button>
							</sec:authorize> <sec:authorize
								access="hasAuthority('ADMIN') or hasAuthority('EDITOR')">
								<a href="<c:url value='/edit-casetype-${casetype.casetypename}' />"
									class="btn btn-outline-warning btn-sm"><span
									class="far fa-edit"></span></a>
							</sec:authorize> <sec:authorize access="hasAuthority('ADMIN')">
								<a href="<c:url value='/delete-casetype-${casetype.casetypename}' />"
									class="btn btn-outline-danger btn-sm delBtn"><span
									class="fas fa-trash-alt"></span></a>
							</sec:authorize></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<span class="floatRight"> <sec:authorize
				access="hasAuthority('ADMIN')">
				<a href="<c:url value='/casetyperegistration' />"
					class="btn btn-success btn-sm"><span class="fa fa-plus"></span>
					Add Casetype</a>
			</sec:authorize>
		</span>
	</div>



	<!-- #Modal to view agency details -->
	<div class="modal fade" id="viewModal" tabindex="-1" role="dialog"
		aria-labelledby="viewModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="removeModalCenterTitle">View
						Agency Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="viewbody" class="modal-body"></div>
				<!-- 				<div class="modal-footer"> -->
				<!-- 					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				<!-- 					<button type="button" class="btn btn-primary">Save changes</button> -->
				<!-- 				</div> -->
				<button type="button" class="btn btn-info" data-dismiss="modal">
					<span class="fa fa-times"> Close</span>
				</button>
			</div>
		</div>
	</div>




	<!-- #Modal for removing agencys -->
	<div class="modal fade" id="removeModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="removeModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-top" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="removeModalCenterTitle">Confirm
						Delete</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="alert alert-danger">Are you sure you want to delete
						this Agency?</p>
				</div>
				<div class="modal-footer">
					<a href="" class="btn btn-danger" id="delRef"><span
						class="fa fa-times"> Yes Please</span></a>
					<button type="button" class="btn btn-success" data-dismiss="modal">
						<span class="fa fa-check"> No Thanks</span>
					</button>

				</div>
			</div>
		</div>
	</div>







	<%@include file="../fragments/footer.jsp"%>