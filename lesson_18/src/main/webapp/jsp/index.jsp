<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Lesson_18</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <script
      src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
      data-auto-a11y="true"></script>
<script>
	$(document).ready(function() {
		$("input:radio").click(function() {
			var text = $(this).val();
			$("#radio-level").val(text);
		});
	});
</script>

</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header"
				style="margin-right: 20px; margin-left: 12px; margin-top: 15px;">Spring
				MVC Lesson_18</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">All participants</a></li>
				<li><a href="new">New participant</a></li>
			</ul>
		</div>
	</nav>


	<div class="container">

		<c:choose>
			<c:when test="${mode == 'PARTICIPANT_VIEW'}">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Participant Name</th>
							<th>Participant Email</th>
							<th>LEVEL</th>
							<th>Primary Skill</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="participant" items="${participants}">
							<tr>
								<td>${participant.id}</td>
								<td>${participant.name}</td>
								<td>${participant.email}</td>
								<td>${participant.level}</td>
								<td>${participant.primarySkill}</td>
								<td><a href="update?id= ${participant.id}"><i class="fas fa-user-edit"></i></a></td>
								<td><a href="delete?id= ${participant.id}"><i class="fas fa-user-minus"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>

			<c:when
				test="${mode == 'PARTICIPANT_EDIT' || mode == 'PARTICIPANT_CREATE'}">
				<form action="save" method="POST">
				
					<div class="form-group">
						<label for="participantName">Participant ID:</label>
						<input type="text" value="${participant.id}" class="form-control"
							id="id" name="id" readonly>
					</div>
				
					<div class="form-group">
						<label for="participantName">Participant Name:</label> <input
							type="text" class="form-control" id="name" name="name"
							value="${participant.name}">
					</div>

					<div class="form-group">
						<label for="email">Participant Email:</label> <input type="text"
							class="form-control" id="email" name="email"
							value="${participant.email}">
					</div>

					<div class="form-group">
						<label for="level">Participant Level:</label> 
						<input id="radio-level" type="text" class="form-control" id="level"
							name="level" value="${participant.level}" readonly> 
							
							<input id="radio-l1" type="radio" name="radio" value="L1"> 
								<label for="radio-l1">Level 1 </label> 
							<input id="radio-l2" type="radio" name="radio" value="L2"> 
								<label for="radio-l2">Level	2 </label> 
							<input id="radio-l3" type="radio" name="radio" value="L3">
								<label for="radio-l3">Level 3 </label> 
							<input id="radio-l4"type="radio" name="radio" value="L4"> 
								<label for="radio-l4">Level 4 </label> 
							<input id="radio-l5" type="radio" name="radio" value="L5"> 
								<label for="radio-l5">Level	5 </label>
					</div>

					<div class="form-group">
						<label for="primarySkill">Participant primary Skill:</label> <input
							type="text" class="form-control" id="primarySkill"
							name="primarySkill" value="${participant.primarySkill}">
					</div>

					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</c:when>

		</c:choose>
	</div>
</body>
</html>
