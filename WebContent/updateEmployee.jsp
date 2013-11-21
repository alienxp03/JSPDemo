<%@page import="com.jspdemo.bean.Employee"%>
<%@page import="com.jspdemo.controller.EmployeeController"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String id = request.getParameter("id");
	Employee employee = null; 
	int status = 0;
	if(id == null){
		response.sendRedirect("viewEmployeeList.jsp");
	} else if(id != null && request.getParameter("update") == null){
		EmployeeController employeeController = new EmployeeController();
		employee = employeeController.getEmployeeById(id);
	} else if(request.getParameter("update") != null) {
		EmployeeController employeeController = new EmployeeController();
		status = employeeController.updateEmployee(new Integer(id), request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("email"));
		response.sendRedirect("viewEmployeeList.jsp");
		return;
	}
	
%>
<jsp:include page="header.jsp" ></jsp:include>
<title>Employee List</title>
        <div class="span9" >
        	<form action="" method="post">
        	<table class="table table-bordered">
        		<%
					if(status == -1){
						out.println("No data found");
					} else {
						%>
						<tr>
							<td>First name</td>
							<td><input type="text" id="firstName" name="firstName" value="<%=employee.getFirstName() %>" /></td>
						</tr>
						<tr>
							<td>First name</td>
							<td><input type="text" id="lastName" name="lastName" value="<%=employee.getLastName() %>" /></td>
						</tr>
						<tr>
							<td>First name</td>
							<td><input type="text" id="email" name="email" value="<%=employee.getEmail() %>" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input class="btn btn-info" type="submit" name="update" value="Update" /></td>
						</tr>
						
						<%
					}
				%>
        	</table>
        	</form>
        </div><!--/span-->