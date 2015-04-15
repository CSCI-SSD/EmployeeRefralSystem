package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.beans.LoginBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

public class LoginController extends SystemAbstractController {
	
	@Autowired
	private Service service;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		LoginBean loginBean = new LoginBean();
		loginBean.setUserName((String)request.getParameter("userName"));
		loginBean.setPasswrd((String)request.getParameter("password"));
		
		service.userLogin(loginBean);
		ModelAndView modelAndView = null;
		if (loginBean.getRole() != null) {
			modelAndView = new ModelAndView("mainPage");
			request.getSession().setAttribute(SystemConstants.LOGIN_DETAILS, loginBean);
		} else {
			modelAndView = new ModelAndView("login");
			modelAndView.addObject(SystemConstants.MESSAGE, "Invalied Login");
			
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
