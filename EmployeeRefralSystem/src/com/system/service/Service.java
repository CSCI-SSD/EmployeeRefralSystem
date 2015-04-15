package com.system.service;

import java.util.List;

import com.system.beans.LoginBean;
import com.system.beans.RequestBean;

public interface Service {
	
	public LoginBean userLogin(LoginBean loginBean);
	
	public String createNewRequest(RequestBean requestBean);
	
	public List<RequestBean>  getRequestDetails(Integer employeeId);

	public String updateRequest(RequestBean requestBean);

	public String deleteRequest(RequestBean requestBean);

	public  List<RequestBean> getRequestApproveDetails(String  employeeList);
	
	public String getEmployeeList(Integer employeeId);
}
