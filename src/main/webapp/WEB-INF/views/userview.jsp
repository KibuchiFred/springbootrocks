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

		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<form:input type="hidden" path="id" id="id" />

			<div class="card-header bg-info text-white p-0">
				<div style="text-align: center">
					<h4>View User Info</h4>
				</div>
			</div>
			<br>

			<div class="row">
				<label class="col-md-2" for="username">User Name</label>
				<div class="col-md-7">
					<spring:bind path="username">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="username" class="form-control"
								placeholder="Username" autofocus="true" disabled="true"></form:input>
							<form:errors path="username"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>



			<div class="row">
				<label class="col-md-2" for="useremail">Email-ID</label>
				<div class="col-md-7">
					<spring:bind path="useremail">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="useremail" class="form-control"
								placeholder="Email-id" autofocus="true" disabled="true"></form:input>
							<form:errors path="useremail"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-2" for="userfirstname">First Name</label>
				<div class="col-md-7">
					<spring:bind path="userfirstname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="userfirstname" class="form-control"
								placeholder="First Name" autofocus="true" disabled="true"></form:input>
							<form:errors path="userfirstname"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-2" for="userlastname">Last Name</label>
				<div class="col-md-7">
					<spring:bind path="userlastname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="userlastname" class="form-control"
								placeholder="Last Name" autofocus="true" disabled="true"></form:input>
							<form:errors path="userlastname"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-2" for="useraddress">Address</label>
				<div class="col-md-7">
					<spring:bind path="useraddress">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="useraddress" class="form-control"
								placeholder="Your Address" autofocus="true" disabled="true"></form:input>
							<form:errors path="useraddress"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-2" for="roles">Roles Available</label>
				<div class="col-md-7">
					<form:select path="roles" items="${roles}" multiple="true"
						itemValue="id" itemLabel="name" disabled="true"
						class="form-control input-sm input-sm" />
					<div class="has-error">
						<form:errors path="roles" class="help-inline" />
					</div>
				</div>
			</div>

			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='/userlist' />" class="btn btn-success btn-sm"><i
				class="fas fa-times"></i> Cancel</a>
		</form:form>

	</div>
	<%@include file="../fragments/footer.jsp"%>
</body>
</html>