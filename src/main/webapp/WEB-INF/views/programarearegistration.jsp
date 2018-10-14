<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container">

		<form:form method="POST" modelAttribute="programareaForm"
			class="form-signin">
			<form:input type="hidden" path="id" id="id" />
			<div class="card-header bg-info text-white p-0">
				<div style="text-align: center">
					<h4>Add Program Area</h4>
				</div>
			</div>
			<br>

			<div class="row">
				<label class="col-md-3" for="programareaname">Program Area
					Name</label>
				<div class="col-md-7">
					<spring:bind path="programareaname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="programareaname"
								class="form-control" placeholder="Programarea Name"
								autofocus="true"></form:input>
							<form:errors path="programareaname"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="appAgency">Agencies Available</label>
				<div class="col-md-7">
					<spring:bind path="programareaname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:select path="appAgency" items="${appAgency}" itemValue="id"
								itemLabel="agencyname" class="form-control input-sm input-sm" />
							<div class="has-error">
								<form:errors path="appAgency" class="help-inline" />
							</div>
						</div>
					</spring:bind>
				</div>
			</div>


			<div class="row">
				<label class="col-md-3" for="programarealocation">Program
					Area Location</label>
				<div class="col-md-7">
					<spring:bind path="programarealocation">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="programarealocation"
								class="form-control" placeholder="Programarea Location"
								autofocus="true"></form:input>
							<form:errors path="programarealocation"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="programareaaddress">Program
					Area Address</label>
				<div class="col-md-7">
					<spring:bind path="programareaaddress">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="programareaaddress"
								class="form-control" placeholder="Programarea Address"
								autofocus="true"></form:input>
							<form:errors path="programareaaddress"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="programareaheadname">Programarea-Head
					Name</label>
				<div class="col-md-7">
					<spring:bind path="programareaheadname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="programareaheadname"
								class="form-control" placeholder="Programarea-Head Name"
								autofocus="true"></form:input>
							<form:errors path="programareaheadname"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="programareaheademail">Programarea-Head
					EmailID</label>
				<div class="col-md-7">
					<spring:bind path="programareaheademail">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="programareaheademail"
								class="form-control" placeholder="Programarea-Head EmailID"
								autofocus="true"></form:input>
							<form:errors path="programareaheademail"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>










			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='/programarealist' />"
				class="btn btn-success btn-sm"><i class="fas fa-times"></i>
				Cancel</a>
		</form:form>

	</div>
	<%@include file="../fragments/footer.jsp"%>