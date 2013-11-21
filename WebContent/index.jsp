<%@page import="com.jspdemo.controller.EmployeeController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <title>Sign in</title>
<%
	EmployeeController employeeController = new EmployeeController();
	int status = -1;
	String email = request.getParameter("email");
	if(email != null){
		status = employeeController.getEmployeeByEmail(email);
		if(status > 0){
			//HttpSession s = request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("viewEmployeeList.jsp");
			return;
		}
	}
%>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

<div class="container" style="text-align: center">
      <form class="form-signin" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" id="email" name="email" class="input-block-level" placeholder="Email address">
        <button class="btn btn-large btn-primary" type="submit">Sign in</button>
      </form>
      <%
      	if(status == 0) {
      %>
    <div class="alert alert-error" >
      <button type="button" class="close" data-dismiss="alert">×</button>
      <strong>Wrong username or password</strong>
      </div>
	<%
      	}
    %>
</div> <!-- /container -->