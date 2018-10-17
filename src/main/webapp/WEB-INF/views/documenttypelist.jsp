<%@include file="../fragments/header.jsp"%>
<body>

	<div class="container-fluid ">
		<div class="card-header bg-info text-white p-0">
			<div style="text-align: center">
				<h4>Manage Document Types</h4>
			</div>
		</div>
		<br>
		<table id="tableitems"
			class="table table-condensed table-hover table-responsive-sm width=100%">
			<!-- 			<thead class="thead-light"> -->
			<thead>
				<tr>
					<th>ID</th>
					<th>Document Type Name</th>
					<th>Document Type Property 1</th>
					<th>Document Type Property 2</th>
					<th>Document Type Property 3</th>
					<th>Document Type Property 4</th>
					<th>Document Type Property 5</th>
					
					
<!-- 					<th>Associated Program Area</th> -->

					<th><sec:authorize
							access="hasAuthority('ADMIN') or hasAuthority('DBA')">
						</sec:authorize> <sec:authorize access="hasAuthority('ADMIN')">
						</sec:authorize>Actions</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${documenttypes}" var="documenttype">
					<tr>
						<td>${documenttype.id}</td>
						<td>${documenttype.documenttypename}</td>
						<td>${documenttype.documenttypeproperty1}</td>
						<td>${documenttype.documenttypeproperty2}</td>
						<td>${documenttype.documenttypeproperty3}</td>
						<td>${documenttype.documenttypeproperty4}</td>
						<td>${documenttype.documenttypeproperty5}</td>
						
<%-- 						<td>${documenttype.appProgramarea}</td> --%>
<%-- 							<td><c:forEach items="${appProgramarea}" var="list"> --%>
<%-- 							-${list.programareaname}-</c:forEach></td> --%>

						<td><sec:authorize
								access="hasAuthority('ADMIN') or hasAuthority('EDITOR') or hasAuthority('VIEWER')">
								<button class="btn btn-sm btn-outline-primary viewBtn"
									data-toggle="modal" data-target="#viewModal">
									<span class="far fa-id-card"></span>
								</button>
							</sec:authorize> <sec:authorize
								access="hasAuthority('ADMIN') or hasAuthority('EDITOR')">
								<a href="<c:url value='/edit-documenttype-${documenttype.documenttypename}' />"
									class="btn btn-outline-warning btn-sm"><span
									class="far fa-edit"></span></a>
							</sec:authorize> <sec:authorize access="hasAuthority('ADMIN')">
								<a href="<c:url value='/delete-documenttype-${documenttype.documenttypename}' />"
									class="btn btn-outline-danger btn-sm delBtn"><span
									class="fas fa-trash-alt"></span></a>
							</sec:authorize></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<span class="floatRight"> <sec:authorize
				access="hasAuthority('ADMIN')">
				<a href="<c:url value='/documenttyperegistration' />"
					class="btn btn-success btn-sm"><span class="fa fa-plus"></span>
					Add Document Type</a>
			</sec:authorize>
		</span>
	</div>



	<!-- #Modal to view Document Type details -->
	<div class="modal fade" id="viewModal" tabindex="-1" role="dialog"
		aria-labelledby="viewModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="removeModalCenterTitle">View
						Document Type Details</h5>
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




	<!-- #Modal for removing Document Types -->
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
						this Document Type?</p>
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