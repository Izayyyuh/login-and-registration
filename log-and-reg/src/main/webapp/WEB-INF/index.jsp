<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-md-6 offset-md-3">
		<h2>Register</h2>
		<form:form class="form-horizontal" action="/users/register" method="post" modelAttribute="newUser">
			<form:errors style="color:red" path="userName"/>
			<div class="text-center form-outline w-35 d-flex mt-1">
			<form:label for="formControlInput" class="form-label text-nowrap" path="userName">User Name:</form:label>
			<form:input class="input-group input-group-sm" id="formControlInput" type="text" path="userName" required="true"/>
			</div>
			<form:errors style="color:red" path="email"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="email" class="form-label">Email:</form:label>
			<form:input class="input-group input-group-sm" type="text" path='email' required="true"/>
			</div>
			<form:errors style="color:red" path="password"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="password" class="form-label">Password:</form:label>
			<form:input class="input-group input-group-sm" type="password" step="any" path='password' required="true"/>
			</div>
			<form:errors style="color:red" path="confirmPassword"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="confirmPassword" class="form-label">Confirm Password:</form:label>
			<form:input class="input-group input-group-sm" type="password" path='confirmPassword' required="true"/>
			</div>
			<div class="text-center">
			<input class="btn btn-primary" type="submit" value="Submit">
			</div>
		</form:form>
	</div>
	
	<div class="col-md-6 offset-md-3">
		<h2>Login</h2>
		<form:form class="form-horizontal" action="/users/login" method="post" modelAttribute="loginUser">
			<form:errors style="color:red" path="email"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="email" class="form-label">Email:</form:label>
			<form:input class="input-group input-group-sm" type="text" path='email' required="true"/>
			</div>
			<form:errors style="color:red" path="password"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="password" class="form-label">Password:</form:label>
			<form:input class="input-group input-group-sm" type="password" step="any" path='password' required="true"/>
			</div>
			<div class="text-center">
			<input class="btn btn-primary" type="submit" value="Submit">
			</div>
		</form:form>
	</div>
	
</body>
</html>