<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container">

		<form:form method="POST" modelAttribute="casestepForm"
			class="form-signin">
			<form:input type="hidden" path="id" id="id" />
			<div class="card-header bg-info text-white p-0">
				<div style="text-align: center">
					<h4>Add / Update Casestep</h4>
				</div>
			</div>
			<br>

			<div class="row">
				<label class="col-md-3" for="casestepname">Casestep
					Name</label>
				<div class="col-md-8">
					<spring:bind path="casestepname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<c:choose>
								<c:when test="${edit}">
									<form:input type="text" path="casestepname"
										class="form-control" placeholder="Casestep Name"
										autofocus="true" disabled="true"></form:input>
								</c:when>
								<c:otherwise>
									<form:input type="text" path="casestepname"
										class="form-control" placeholder="Casestep Name"
										autofocus="true"></form:input>
								</c:otherwise>
							</c:choose>


							<form:errors path="casestepname"></form:errors>
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



			<div class="row">
				<label class="col-md-3" for="appRole">Associate with Role</label>
				<div class="col-md-8">
					<form:select path="appRole"  class="form-control input-sm input-sm">
								<option value="#" disabled = "disabled" selected="selected">--- Select Role ---</option>
								<form:options items="${appRole}"  itemValue="id" itemLabel="name"/>
								<form:errors path="appRole" class="help-inline" />
							</form:select>
					<div class="has-error">
						<form:errors path="appRole" class="help-inline" />
					</div>
				</div>
			</div>


			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='/casesteplist' />"
				class="btn btn-success btn-sm"><i class="fas fa-times"></i>
				Cancel</a>
		</form:form>

	</div>
	<%@include file="../fragments/footer.jsp"%>