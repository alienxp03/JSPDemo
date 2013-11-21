package com.jspdemo.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import oracle.jdbc.OracleTypes;

import com.jspdemo.bean.Employee;
import com.jspdemo.general.DatabaseConnection;

public class EmployeeDb {

	public ArrayList<Employee> getEmployeeList() throws Exception {
		ArrayList<Employee> listEmp = new ArrayList<Employee>();
		Connection conn = DatabaseConnection.getConnection();
		try {
			// Using stored procedure
			CallableStatement cal = conn.prepareCall("{call view_employee3(?) }");
			cal.registerOutParameter(1, OracleTypes.CURSOR);
			// execute getDBUSERCursor store procedure
			cal.executeUpdate();

			// get cursor and cast it to ResultSet
			ResultSet rs = (ResultSet) cal.getObject(1);

			if (rs.next()) {
				do {
					Employee emp = new Employee();
					emp.setEmployeeId(rs.getInt("employee_id"));
					emp.setFirstName(rs.getString("first_name"));
					emp.setLastName(rs.getString("last_name"));
					emp.setEmail(rs.getString("email"));

					listEmp.add(emp);
				} while (rs.next());
			} else {
				listEmp = null;
			}
		} finally {
			conn.close();
		}

		// will return null if table is empty
		return listEmp;
	}
	
	public Employee getEmployeeById(String id) throws Exception {
		Employee emp = null;
		Connection conn = DatabaseConnection.getConnection();
		try {
			// Using stored procedure
			CallableStatement cal = conn.prepareCall("{call search_employee3(?,?) }");
			cal.setInt(1, new Integer(id));
			cal.registerOutParameter(2, OracleTypes.CURSOR);
			// execute getDBUSERCursor store procedure
			cal.executeUpdate();

			// get cursor and cast it to ResultSet
			ResultSet rs = (ResultSet) cal.getObject(2);

			if (rs.next()) {
				emp = new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setEmail(rs.getString("email"));
				
			} else {
				emp = null;
			}
		} finally {
			conn.close();
		}

		// will return null if table is empty
		return emp;
	}
	
	public int getEmployeeByEmail(String email) throws Exception {
		int status = 0;
		Connection conn = DatabaseConnection.getConnection();
		try {
			// Using stored procedure
			CallableStatement cal = conn.prepareCall("{ ? = call check_employee3(?) }");
			cal.registerOutParameter(1, OracleTypes.NUMBER);
			cal.setString(2, email);
			// execute getDBUSERCursor store procedure
			cal.executeUpdate();

			// get cursor and cast it to ResultSet
			status = cal.getInt(1);

		} finally {
			conn.close();
		}

		// will return null if table is empty
		return status;
	}
	
	public int updateEmployee(Employee employee) throws Exception {
		int status = 0;
		Connection conn = DatabaseConnection.getConnection();
		try {
			// Using stored procedure
			CallableStatement cal = conn.prepareCall("{call update_employee3(?,?,?,?,?) }");
			cal.setInt(1, employee.getEmployeeId());
			cal.setString(2, employee.getFirstName());
			cal.setString(3, employee.getLastName());
			cal.setString(4, employee.getEmail());
			cal.registerOutParameter(5, OracleTypes.NUMBER);
			// execute getDBUSERCursor store procedure
			cal.executeUpdate();

			// get cursor and cast it to ResultSet
			status = cal.getInt(5);

		} finally {
			conn.close();
		}

		// will return null if table is empty
		return status;
	}
	
	public int deleteEmployee(int id) throws Exception {
		int status = 0;
		Connection conn = DatabaseConnection.getConnection();
		try {
			// Using stored procedure
			CallableStatement cal = conn.prepareCall("{call delete_employee3(?,?) }");
			cal.setInt(1, id);
			cal.registerOutParameter(2, OracleTypes.NUMBER);
			// execute getDBUSERCursor store procedure
			cal.executeUpdate();

			// get cursor and cast it to ResultSet
			status = cal.getInt(2);

		} finally {
			conn.close();
		}

		// will return null if table is empty
		return status;
	}
}
