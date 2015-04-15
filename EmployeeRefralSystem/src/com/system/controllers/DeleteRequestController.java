package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.system.beans.LoginBean;
import com.system.beans.RequestBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

public class DeleteRequestController extends SystemAbstractController {
	
	@Autowired
	private Service service;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		LoginBean loginBean = (LoginBean)request.getSession().getAttribute(SystemConstants.LOGIN_DETAILS);
		
		RequestBean requestBean = new RequestBean();
		
		
		String requestID = request.getParameter("deleterequestId");
		Integer requestIDInt = null;
		if (requestID != null) {
			try {
			requestIDInt = Integer.parseInt(requestID);
			} catch (NumberFormatException nfe) {
				requestIDInt = null;
			}
		}
		requestBean.setRequestId(requestIDInt);
		
		if (requestIDInt != null) {
			service.deleteRequest(requestBean);
			request.setAttribute(SystemConstants.MESSAGE, SystemConstants.SUCESS_DELETING_REQUEST);
		}
		ModelAndView modelAndView = new ModelAndView("viewstatus");
		request.setAttribute("statusList", service.getRequestDetails(loginBean.getEmployeeId()));
		
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
