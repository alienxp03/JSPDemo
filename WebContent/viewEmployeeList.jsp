<%@page import="com.jspdemo.bean.Employee"%>
<%@page import="com.jspdemo.controller.EmployeeController"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	EmployeeController employeeController = null;
	ArrayList<Employee> employeeList = null;
	int status = 0;
	String deleteId = request.getParameter("deleteId");
	if( deleteId != null){
		employeeController = new EmployeeController();
		status = employeeController.deleteEmployee(new Integer(deleteId));
		employeeList = employeeController.getEmployeeList();
	} else {
		try{
			employeeController = new EmployeeController();
			employeeList = employeeController.getEmployeeList();
		} catch(Exception e){
			e.printStackTrace();
		}	
	}
	
%>
<jsp:include page="header.jsp" ></jsp:include>
<script type="text/javascript">
	function confirmDelete(str){
		var r=confirm("Delete employee name "+str+"?");
		if (r==true) {
		  return true;
		} else {
		  return false;
		}
	}
</script>
<title>Employee List</title>
        <div class="span9" >
        	<table class="table table-bordered">
        		<%
					if(employeeList.size() == 0){
						out.println("No data found");
					} else {
						out.println("<thead><tr><th>Employee id</th><th>First name</th>"+ 
						"<th>Last name</th><th>Email</th><th>Update</th><th>Delete</th></tr></thead><tbody>");
						for(Employee emp : employeeList){
							out.println("<tr>");
							out.println("<td>"+emp.getEmployeeId()+"</td>");
							out.println("<td>"+emp.getFirstName()+"</td>");
							out.println("<td>"+emp.getLastName()+"</td>");
							out.println("<td>"+emp.getEmail()+"</td>");
							out.println("<td><a href='updateEmployee.jsp?id="+emp.getEmployeeId()+"'><span class='icon-edit'></span></a></td>");
							out.println("<td><a href=\"viewEmployeeList.jsp?deleteId="+emp.getEmployeeId()+
									"\" onclick=\"return confirmDelete('"+emp.getFirstName() +"')\"><span class='icon-trash'></span></a></td>");
							out.println("</tr>");
						}
						out.println("</tbody>");
					}
				%>
        	</table>
        </div><!--/span-->