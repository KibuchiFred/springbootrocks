<%@include file="../fragments/header.jsp"%>
<style>

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

		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<form:input type="hidden" path="id" id="id" />
			<!-- 			<div class="card-header bg-info text-white p-0"> -->
			<div style="text-align: center">
				<h4>
					<b>Add / Update Account</b>
				</h4>
			</div>
			<!-- 			</div> -->
			<br>

			<div class="row">
				<label class="col-md-3" for="username">User Name</label>
				<div class="col-md-8">
					<spring:bind path="username">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<c:choose>
								<c:when test="${edit}">
									<form:input type="text" path="username" class="form-control"
										placeholder="Username" autofocus="true" disabled="true"></form:input>
								</c:when>
								<c:otherwise>
									<form:input type="text" path="username" class="form-control"
										placeholder="Username" autofocus="true"></form:input>
								</c:otherwise>
							</c:choose>
							<form:errors path="username" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="password">Password</label>
				<div class="col-md-8">
					<spring:bind path="password">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="password" path="password" class="form-control"
								placeholder="Password"></form:input>
							<form:errors path="password" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="passwordConfirm">Confirm
					Password</label>
				<div class="col-md-8">
					<spring:bind path="passwordConfirm">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="password" path="passwordConfirm"
								class="form-control" placeholder="Confirm password"></form:input>
							<form:errors path="passwordConfirm" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>


			<div class="row">
				<label class="col-md-3" for="useremail">Email-ID</label>
				<div class="col-md-8">
					<spring:bind path="useremail">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="useremail" class="form-control"
								placeholder="Email-id" autofocus="true"></form:input>
							<form:errors path="useremail" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="userfirstname">First Name</label>
				<div class="col-md-8">
					<spring:bind path="userfirstname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="userfirstname" class="form-control"
								placeholder="First Name" autofocus="true"></form:input>
							<form:errors path="userfirstname" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="userlastname">Last Name</label>
				<div class="col-md-8">
					<spring:bind path="userlastname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="userlastname" class="form-control"
								placeholder="Last Name" autofocus="true"></form:input>
							<form:errors path="userlastname" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="useraddress">Address</label>
				<div class="col-md-8">
					<spring:bind path="useraddress">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="useraddress" class="form-control"
								placeholder="Your Address" autofocus="true"></form:input>
							<form:errors path="useraddress" cssClass="error"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="roles">Roles Available</label>
				<div class="col-md-8">
					<spring:bind path="roles">
						<form:select path="roles" items="${roles}" multiple="true"
							itemValue="id" itemLabel="name"
							class="form-control input-sm input-sm" />
						<div class="has-error">
							<form:errors path="roles" class="help-inline" cssClass="error" />
						</div>
					</spring:bind>
				</div>
			</div>

			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='userlist' />" class="btn btn-success btn-sm"><i
				class="fas fa-times"></i> Cancel</a>
		</form:form>
		<hr />
	</div>
	<%@include file="../fragments/footer.jsp"%>
</body>
</html>