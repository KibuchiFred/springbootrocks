<%@include file="../fragments/header.jsp"%>
<body>
	<div class="container">

		<form:form method="POST" modelAttribute="agencyForm"
			class="form-signin">
			<form:input type="hidden" path="id" id="id" />
			<div class="card-header bg-info text-white p-0">
				<div style="text-align: center">
					<h4>Add Agency</h4>
				</div>
			</div>
			<br>


			<div class="row">
				<label class="col-md-3" for="agencyname">Agency Name</label>
				<div class="col-md-7">
				<spring:bind path="agencyname">
				<div class="form-group ${status.error ? 'has-error' : ''}">
				<c:choose>
                <c:when test="${edit}">
							
							<form:input type="text" path="agencyname" class="form-control"
								placeholder="Agency Name" autofocus="true"  disabled="true"></form:input>
								</c:when>
                            <c:otherwise>
								<form:input type="text" path="agencyname" class="form-control"
								placeholder="Agency Name" autofocus="true"></form:input>
								</c:otherwise>
                        </c:choose>
								
								
							<form:errors path="agencyname"></form:errors>
							</div>
						</spring:bind>
						</div>	
						</div>	
	

			<div class="row">
				<label class="col-md-3" for="agencylocation">Agency Location</label>
				<div class="col-md-7">
					<spring:bind path="agencylocation">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="agencylocation"
								class="form-control" placeholder="Agency Location"
								autofocus="true"></form:input>
							<form:errors path="agencylocation"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="agencyaddress">Agency Address</label>
				<div class="col-md-7">
					<spring:bind path="agencyaddress">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="agencyaddress" class="form-control"
								placeholder="Agency Address" autofocus="true"></form:input>
							<form:errors path="agencyaddress"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="agencyheadname">Agency-Head
					Name</label>
				<div class="col-md-7">
					<spring:bind path="agencyheadname">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="agencyheadname"
								class="form-control" placeholder="Agency-Head Name"
								autofocus="true"></form:input>
							<form:errors path="agencyheadname"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>

			<div class="row">
				<label class="col-md-3" for="agencyheademail">Agency-Head
					EmailID</label>
				<div class="col-md-7">
					<spring:bind path="agencyheademail">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="agencyheademail"
								class="form-control" placeholder="Agency-Head EmailID"
								autofocus="true"></form:input>
							<form:errors path="agencyheademail"></form:errors>
						</div>
					</spring:bind>
				</div>
			</div>










			<button class="btn btn-primary btn-sm" type="submit">
				<span class="fa fa-check"></span> Submit
			</button>
			<a href="<c:url value='/agencylist' />"
				class="btn btn-success btn-sm"><i class="fas fa-times"></i>
				Cancel</a>
		</form:form>

	</div>
	<%@include file="../fragments/footer.jsp"%>