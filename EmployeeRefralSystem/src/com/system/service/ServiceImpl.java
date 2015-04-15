package com.system.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.system.beans.LoginBean;
import com.system.beans.RequestBean;
import com.system.util.SystemConstants;

public class ServiceImpl implements Service {
	
	private DataSource dataSource;

	@Override
	public LoginBean userLogin(LoginBean loginBean) {
		
		Connection connection = null;
		Statement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "select username, password, employeeid, type from USERDETAILS where username ='"+loginBean.getUserName()+"'";
			ResultSet rs = statement.executeQuery(query);
			if (rs.next()) {
				String password = rs.getString("password");
				Integer employeeid = rs.getInt("employeeid");
				String type = rs.getString("type");
				
				if(password.equals(loginBean.getPasswrd())) {
					loginBean.setRole(type);
					loginBean.setEmployeeId(employeeid);
				} else {
					loginBean.setRole(null);	
				}
			}
			
		} catch (SQLException sqlException) {
			loginBean.setRole(null);	
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return loginBean;
		
	}

	@Override
	public String createNewRequest(RequestBean requestBean) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement("INSERT INTO ERSREQUEST (EMPLOYEEID, INVOICENUMBER, AMOUNT, TYPE, STATUS, BILLDATE) VALUES (?,?,?,?,?,?)");
			statement.setInt(1, requestBean.getEmployeeId());
			statement.setString(2, requestBean.getInvoiceNumber());
			statement.setString(3, requestBean.getAmount());
			statement.setString(4, requestBean.getType());
			statement.setString(5, SystemConstants.EMPLOYEE_STATUS);
			statement.setString(6, requestBean.getBillDate());
			int satus = statement.executeUpdate();
			if (satus==1) {
				return SystemConstants.SUCESS_CREATING_REQUEST;
			} else {
				return SystemConstants.UNSUCESS_CREATING_REQUEST;
			}
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return SystemConstants.UNSUCESS_CREATING_REQUEST;
	}

	/**
	 * @return the dataSource
	 */
	public DataSource getDataSource() {
		return dataSource;
	}

	/**
	 * @param dataSource the dataSource to set
	 */
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<RequestBean> getRequestDetails(Integer employeeId) {
		Connection connection = null;
		Statement statement = null;
		List<RequestBean> requestBeans = null;
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "select * from  ERSREQUEST where  EMPLOYEEID='"+employeeId+"'";
			ResultSet rs = statement.executeQuery(query);
			requestBeans = new ArrayList<RequestBean>();
			while (rs.next()) {
				RequestBean requestBean = new RequestBean();
				requestBean.setRequestId(rs.getInt(1));
				requestBean.setEmployeeId(rs.getInt(2));
				requestBean.setInvoiceNumber(rs.getString(3));
				requestBean.setAmount(rs.getString(4));
				requestBean.setBillDate(rs.getString(5));
				requestBean.setType(rs.getString(6));
				requestBean.setStatus(rs.getString(8) == null ? "" : rs.getString(8) );
				
				requestBeans.add(requestBean);
			}
			
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return requestBeans;
	}

	@Override
	public String updateRequest(RequestBean requestBean) {
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement("UPDATE ERSREQUEST SET INVOICENUMBER=?, AMOUNT=?, TYPE=?, STATUS=?, BILLDATE=?, NOTES=? where ERSREQUESTID = ? ");
			statement.setString(1, requestBean.getInvoiceNumber());
			statement.setString(2, requestBean.getAmount());
			statement.setString(3, requestBean.getType());
			statement.setString(4, requestBean.getStatus());
			statement.setString(5, requestBean.getBillDate());
			statement.setString(6, requestBean.getNotes());
			statement.setInt(7, requestBean.getRequestId());
			
			int satus = statement.executeUpdate();
			if (satus==1) {
				return SystemConstants.SUCESS_UPDATING_REQUEST;
			} else {
				return SystemConstants.UNSUCESS_UPDATING_REQUEST;
			}
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			return SystemConstants.UNSUCESS_UPDATING_REQUEST;
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public String deleteRequest(RequestBean requestBean) {
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement("DELETE FROM ERSREQUEST WHERE ERSREQUESTID = ? ");
			statement.setInt(1, requestBean.getRequestId());
			int satus = statement.executeUpdate();
			if (satus==1) {
				return SystemConstants.SUCESS_DELETING_REQUEST;
			} else {
				return SystemConstants.UNSUCESS_CREATING_REQUEST;
			}
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return SystemConstants.UNSUCESS_CREATING_REQUEST;
	}

	@Override
	public List<RequestBean> getRequestApproveDetails(String  employeeList) {
		Connection connection = null;
		Statement statement = null;
		List<RequestBean> requestBeans = null;
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "select * from  ERSREQUEST where  EMPLOYEEID in ("+employeeList+")";
			ResultSet rs = statement.executeQuery(query);
			requestBeans = new ArrayList<RequestBean>();
			while (rs.next()) {
				RequestBean requestBean = new RequestBean();
				requestBean.setRequestId(rs.getInt(1));
				requestBean.setEmployeeId(rs.getInt(2));
				requestBean.setInvoiceNumber(rs.getString(3));
				requestBean.setAmount(rs.getString(4));
				requestBean.setBillDate(rs.getString(5));
				requestBean.setType(rs.getString(6));
				requestBean.setNotes(rs.getString(7));
				requestBean.setStatus(rs.getString(8));
				
				requestBeans.add(requestBean);
			}
			
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return requestBeans;
	}

	@Override
	public String getEmployeeList(Integer managerId) {
		Connection connection = null;
		Statement statement = null;
		String list = null;
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "select employeeid from USERDETAILS where MANAGERID ='"+managerId+"'";
			ResultSet rs = statement.executeQuery(query);
			list ="";
			while (rs.next()) {
				list = list+ rs.getString(1)+",";
			}
			
			list = list.substring(0,list.length()-1);
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;

	}

}
