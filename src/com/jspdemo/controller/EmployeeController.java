package com.jspdemo.controller;

import java.util.ArrayList;

import com.jspdemo.bean.Employee;
import com.jspdemo.model.EmployeeDb;

public class EmployeeController {

	// create the model object
	EmployeeDb employeeDb;

	public EmployeeController() {
		// initialize the object, otherwise it will be null
		employeeDb = new EmployeeDb();
	}

	/**
	 * @description will return list of all employees in the table
	 * @return list of all employees
	 * @throws Exception
	 */
	public ArrayList<Employee> getEmployeeList() throws Exception {
		ArrayList<Employee> employeeList = null;

		try {
			// call the function from employee model to get the data from
			// database
			employeeList = employeeDb.getEmployeeList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// will return null if no data
		return employeeList;
	}

	/**
	 * 
	 * @description get the employee details based on the id given
	 * @param id
	 *            - employee id
	 * @return the employee details
	 * @throws Exception
	 */
	public Employee getEmployeeById(String id) throws Exception {
		Employee emp = null;

		try {
			// get the data from model by passing the id
			emp = employeeDb.getEmployeeById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// will return null if there's no data
		return emp;
	}

	/**
	 * @description get the employee details based on their email
	 * @param email
	 *            - employee email
	 * @return 0 if not exist; 1 if the employee exist
	 * @throws Exception
	 */
	public int getEmployeeByEmail(String email) throws Exception {
		int status = 0;
		try {
			// get the data from the model by passing the email address
			status = employeeDb.getEmployeeByEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	/**
	 * @description update employee details based on their id
	 * @param id
	 * @param firstName
	 * @param lastName
	 * @param email
	 * @return 0 if not exist; 1 if the employee exist
	 * @throws Exception
	 */
	public int updateEmployee(int id, String firstName, String lastName,
			String email) throws Exception {
		int status = 0;
		Employee employee = new Employee();
		employee.setEmployeeId(id);
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setEmail(email);

		try {
			// send the employee object to model to be updated to the database
			status = employeeDb.updateEmployee(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	/**
	 * @description delete an employee based on their id
	 * @param id - employee id
	 * @return 0 if not exist; 1 if the employee exist
	 * @throws Exception
	 */
	public int deleteEmployee(int id) throws Exception {
		int status = 0;

		try {
			// send the id to model to be deleted
			status = employeeDb.deleteEmployee(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
}
