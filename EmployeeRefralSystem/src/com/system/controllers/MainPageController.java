package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.system.beans.LoginBean;
import com.system.beans.RequestBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

public class MainPageController extends SystemAbstractController {
	
	@Autowired
	private Service service;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		ModelAndView modelAndView = new ModelAndView("mainPage");
		return modelAndView;
	}
	
	public String createNewRequest(String invoiceNumber, String billDate, String type, String amount) {
		WebContext ctx = WebContextFactory.get();
		HttpSession session = ctx.getHttpServletRequest().getSession();
		LoginBean loginBean = (LoginBean)session.getAttribute(SystemConstants.LOGIN_DETAILS);
		
		RequestBean requestBean = new RequestBean();
		requestBean.setAmount(amount);
		requestBean.setType(type);
		requestBean.setBillDate(billDate);
		requestBean.setInvoiceNumber(invoiceNumber);
		requestBean.setEmployeeId(loginBean.getEmployeeId());
		requestBean.setStatus(SystemConstants.EMPLOYEE_STATUS);
		String status = service.createNewRequest(requestBean);
		
		if (SystemConstants.SUCESS_CREATING_REQUEST.equals(status)) {
			return status;
		} else {
			return null;
		}
		
		
	}	
	
	
	public String testDwr() {
		return "How are you "; 
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
