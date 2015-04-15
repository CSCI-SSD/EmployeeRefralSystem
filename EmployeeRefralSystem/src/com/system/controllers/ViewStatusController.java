package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.system.beans.LoginBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

public class ViewStatusController extends SystemAbstractController {
	
	@Autowired
	private Service service;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		LoginBean loginBean = (LoginBean)request.getSession().getAttribute(SystemConstants.LOGIN_DETAILS);
		
		ModelAndView modelAndView = new ModelAndView("viewstatus");
		String typeRequest = request.getParameter("requestType");
		if (loginBean.getRole().equals(SystemConstants.ROLE_MANAGER) &&typeRequest != null && typeRequest.equalsIgnoreCase("approve")) {
			modelAndView = new ModelAndView("approvestatus");
			request.setAttribute("statusList", service.getRequestApproveDetails(service.getEmployeeList(loginBean.getEmployeeId())));
		} else {
			request.setAttribute("statusList", service.getRequestDetails(loginBean.getEmployeeId()));
		}
		
		
		return modelAndView;
	}

	/**
	 * @return the service
	 */
	public Service getService() {
		return service;
	}

	/**
	 * @param service the service to set
	 */
	public void setService(Service service) {
		this.service = service;
	}
}
