<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
html,body{
	height: 100%;
}
.container{
	height: 100%;
}
.vertical-center {
	display: flex;
	align-items: center;
	height: 100%;
}
#body {
	margin: 50px 0;
}

#loginbox {
	background: lavender;
}

#form {
	margin: 50px;
	margin-top:30px;
}
div.input-group > span {
 border-radius:0 !important;
}
div.input-group > input {
 border-radius:0 !important;
}
.tooltip > .tooltip-inner {
	  font-size: 12px;
      background-color: #ea9292; 
      color: #8F1513; 
      border: 1px solid #ea9292; 
      padding: 5px;
      width: 150px;

  }
.tooltip.right > .tooltip-arrow {
      border-right: 5px solid #ea9292;
  }
</style>
<script type="text/javascript">
function addTooltip(name,data){
	$('input[name="'+name+'"]').tooltip({
		title:data,
		html:true,
		placement:"right",
		trigger:"hover focus"
	});
}
</script>
</head>
<body>
	<div class="container">
		<div class="row vertical-center">
			<div id="loginbox" class="col-md-6 col-md-offset-3">
				<h2 class="text-center">Please Login</h2>
				<hr/>
				<div class="col-md-8 col-md-offset-2">
					<form:form id="form" class="form-horizontal" 
								action="login" method="post" modelAttribute="userForm">
						<spring:bind path="username">
						<div class="form-group ${status.error ? 'has-error':'' }">
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
								 <form:input path="username" cssClass="form-control" placeholder="Username" />
								 
							</div>
						</div>
						</spring:bind>
						<spring:bind path="password">
						<div class="form-group ${status.error ? 'has-error' : '' }">
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
								<form:password path="password" cssClass="form-control" placeholder="Password" />
							</div>
						</div>
						</spring:bind>
						<div class="text-center">
							<button class="btn btn-primary" type="submit">Log in</button>
						</div>
						<script type="text/javascript">
							$(document).ready(function(){
								addTooltip('username','<form:errors path="username"/>');
								addTooltip('password','<form:errors path="password"/>');
								$('input').tooltip("show");
							});
							
						</script>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>