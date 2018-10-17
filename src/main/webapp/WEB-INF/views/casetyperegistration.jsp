<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container">

		<form:form method="POST" modelAttribute="casetypeForm"
			class="form-signin">
			<form:input type="hidden" path="id" id="id" />
			<div class="card-header bg-info text-white p-0">
				<div style="text-align: center">
					<h4>Add / Update Casetype</h4>
				</div>
			</div>
			<br>

			<div class="row">
				<label class="col-md-3" for="casetypename">Casetype
					Name</label>
				<div class="col-md-8">
					<spring:bind path="casetypename">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<c:choose>
								<c:when test="${edit}">
									<form:input type="text" path="casetypename"
										class="form-control" placeholder="Casetype Name"
										autofocus="true" disabled="true"></form:input>
								</c:when>
								<c:otherwise>
									<form:input type="text" path="casetypename"
										class="form-control" placeholder="Casetype Name"
										autofocus="true"></form:input>
								</c:otherwise>
							</c:choose>


							<form:errors path="casetypename"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="appProgramarea">Associate with Programarea</label>
				<div class="col-md-8">
					<spring:bind path="casetypename">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:select path="appProgramarea"  class="form-control input-sm input-sm">
								<option value="#" disabled = "disabled" selected="selected">--- Select Program Area ---</option>
								<form:options items="${appProgramarea}"  itemValue="id" itemLabel="programareaname"/>
								<form:errors path="appProgramarea" class="help-inline" />
							</form:select>
							<div class="has-error">
								<form:errors path="appProgramarea" class="help-inline" />
							</div>
						</div>
					</spring:bind>
				</div>
			</div>



			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='/casetypelist' />"
				class="btn btn-success btn-sm"><i class="fas fa-times"></i>
				Cancel</a>
		</form:form>

	</div>
	<%@include file="../fragments/footer.jsp"%>