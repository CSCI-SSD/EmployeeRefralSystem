/**
 * 
 */
package com.system.beans;

/**
 * @author kartheek
 *
 */
public class LoginBean {
	
	private String userName;
	
	private String passwrd;
	
	private String role;
	
	private Integer employeeId;

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the passwrd
	 */
	public String getPasswrd() {
		return passwrd;
	}

	/**
	 * @param passwrd the passwrd to set
	 */
	public void setPasswrd(String passwrd) {
		this.passwrd = passwrd;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @return the employeeId
	 */
	public Integer getEmployeeId() {
		return employeeId;
	}

	/**
	 * @param employeeId the employeeId to set
	 */
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

}
