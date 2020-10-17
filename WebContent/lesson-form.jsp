<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://drive.google.com/uc?export=view&id=13NlAxVuxNzrD__kd5xZzQa9DOSH729Om">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: grey">
			<div>
				<a class="navbar-brand"> User Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${lesson != null}">
					<form action="updateLesson" method="post">
				</c:if>
				<c:if test="${lesson == null}">
					<form action="insertLesson" method="post">
				</c:if>

				<c:if test="${lesson != null}">
					<input type="hidden" name="id" value="<c:out value='${lesson.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Lesson Name</label> <input type="text"
						value="<c:out value='${lesson.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Start Date</label>
					<input type="datetime-local"
					value="<c:out value='${lesson.start_date}' />" class="form-control"
					name="start_date">
				</fieldset>

				<fieldset class="form-group">
					<label>End Date</label>
					<input type="datetime-local"
					value="<c:out value='${lesson.end_date}' />" class="form-control"
					name="end_date">
				</fieldset>
				
				<fieldset class="form-group">
				<label>User List</label>
				<c:forEach var="user" items="${listUser}">
					<td><input type="checkbox" name="selectedUsers" value="${user.id}"></td>
					<td>${user.name}</td>
				</c:forEach>
				</fieldset>

				<fieldset class="form-group">
				<label>multiple_week</label>
				<c:forEach var="user" items="${listDate}">
					<td><input type="checkbox" name="selectedWeeks" value="${user.id}"></td>
					<td>${user.id}</td>
				</c:forEach>
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>