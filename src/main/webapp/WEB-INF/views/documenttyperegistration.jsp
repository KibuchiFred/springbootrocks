<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container">

		<form:form method="POST" modelAttribute="documenttypeForm"
			class="form-signin">
			<form:input type="hidden" path="id" id="id" />
			<div class="card-header bg-info text-white p-0">
				<div style="text-align: center">
					<h4>Add / Update Document Type</h4>
				</div>
			</div>
			<br>

			<div class="row">
				<label class="col-md-3" for="documenttypename">Document Type
					Name</label>
				<div class="col-md-8">
					<spring:bind path="documenttypename">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<c:choose>
								<c:when test="${edit}">
									<form:input type="text" path="documenttypename"
										class="form-control" placeholder="Document Type Name"
										autofocus="true" disabled="true"></form:input>
								</c:when>
								<c:otherwise>
									<form:input type="text" path="documenttypename"
										class="form-control" placeholder="Document Type Name"
										autofocus="true"></form:input>
								</c:otherwise>
							</c:choose>


							<form:errors path="documenttypename"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="documenttypeproperty1">Doc Type Property 1</label>
				<div class="col-md-8">
					<spring:bind path="documenttypeproperty1">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="documenttypeproperty1" class="form-control"
								placeholder="Document Type Property1" autofocus="true"></form:input>
							<form:errors path="documenttypeproperty1"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-3" for="documenttypeproperty2">Doc Type Property 2</label>
				<div class="col-md-8">
					<spring:bind path="documenttypeproperty2">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="documenttypeproperty2" class="form-control"
								placeholder="Document Type Property2" autofocus="true"></form:input>
							<form:errors path="documenttypeproperty2"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>		

		<div class="row">
				<label class="col-md-3" for="documenttypeproperty3">Doc Type Property 3</label>
				<div class="col-md-8">
					<spring:bind path="documenttypeproperty3">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="documenttypeproperty3" class="form-control"
								placeholder="Document Type Property3" autofocus="true"></form:input>
							<form:errors path="documenttypeproperty3"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

		<div class="row">
				<label class="col-md-3" for="documenttypeproperty4">Doc Type Property 4</label>
				<div class="col-md-8">
					<spring:bind path="documenttypeproperty4">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="documenttypeproperty4" class="form-control"
								placeholder="Document Type Property4" autofocus="true"></form:input>
							<form:errors path="documenttypeproperty4"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>
			
			
			
					<div class="row">
				<label class="col-md-3" for="documenttypeproperty5">Doc Type Property 5</label>
				<div class="col-md-8">
					<spring:bind path="documenttypeproperty5">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="documenttypeproperty5" class="form-control"
								placeholder="Document Type Property5" autofocus="true"></form:input>
							<form:errors path="documenttypeproperty5"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>
			<div class="row">
				<label class="col-md-3" for=appCasetype>Associate with Casetype</label>
				<div class="col-md-8">
					<spring:bind path="appCasetype">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:select path="appCasetype"  class="form-control input-sm input-sm">
								<option value="#" disabled = "disabled" selected="selected">--- Select Casetype ---</option>
								<form:options items="${appCasetype}"  itemValue="id" itemLabel="casetypename"/>
								<form:errors path="appCasetype" class="help-inline" />
							</form:select>
							<div class="has-error">
								<form:errors path="appCasetype" class="help-inline" />
							</div>
						</div>
					</spring:bind>
				</div>
			</div>



			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='/documenttypelist' />"
				class="btn btn-success btn-sm"><i class="fas fa-times"></i>
				Cancel</a>
		</form:form>

	</div>
	<%@include file="../fragments/footer.jsp"%>