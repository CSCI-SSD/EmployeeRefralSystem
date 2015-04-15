<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
	<head>
		<title><spring:message code="html.login.label.login.title"/> </title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" language="javascript" src="dwr/util.js"> </script>
		<script type="text/javascript" language="javascript" src="dwr/engine.js"></script>
		<jsp:include flush="true" page="libjs.jsp"></jsp:include>
		
		<script type="text/javascript" language="javaScript">
			$(document).ready(function(){
				$("#lodingData").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460
			 	  	  
			 	});
				
				$("#saveSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#notsaveSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#deletedSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#deleteValidationDiv").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Update: function() {
		                	var ctx = "${pageContext.request.contextPath}"+"/deleterequest.view";
		   					document.getElementById("deleteForm").action = ctx;
		   					document.getElementById("deleteFormsubmitButton").click();
		                },
		                
		                Cancel : function() {
		                	document.getElementById("deleterequestId").value = '';
		                	$( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				var message = "${message}";
				
				if (message=='Updated') {
					$("#saveSucessfully").dialog('option', 'modal', true).dialog('open');
				} else if (message == 'Deleted') {
					
				} else if (message =="notUpdated") {
					$("#notsaveSucessfully").dialog('option', 'modal', true).dialog('open');
				}
				
				
				$("#requestEditDiv").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 450,
			 	  	buttons: {
				 	  	Update: function() {
		                   var hasError = validate();
		                   if (hasError) {
		                	   return;
		                   } else {
		                	   var ctx = "${pageContext.request.contextPath}"+"/createrequest.view";
		   						document.getElementById("requestEditForm").action = ctx;
		   						document.getElementById("submitButton").click();
		                   }
		                },
		                
		                Cancel : function() {
		                	clearFeilds();
		                	$( this ).dialog( "close" );
		                }
			        }
			 	});
			 	
			});
			
			function populateValue(row) {
				
				document.getElementById("invoiceNumber").value = document.getElementById("invoice"+row).innerHTML;
				document.getElementById("amount").value = document.getElementById("amount"+row).innerHTML ;
				document.getElementById("billDate").value =document.getElementById("date"+row).innerHTML;
				document.getElementById("notes").value = document.getElementById("notes"+row).value;
				
			    $("#billDate").val(document.getElementById("date"+row).innerHTML);
				
				document.getElementById("type").value = document.getElementById("type"+row).innerHTML;
				document.getElementById("requestId").value = document.getElementById("requestId"+row).value;
				
				$("#requestEditDiv").dialog('option', 'modal', true).dialog('open');
			}
			
			function clearFeilds() {
				document.getElementById("invoiceNumber").value = '';
				document.getElementById("amount").value = '' ;
				document.getElementById("billDate").value = '';
				document.getElementById("type").value = '';
				document.getElementById("requestId").value = "";
				document.getElementById("notes").value = "";
				 var ele = document.getElementsByName("approve");
					for(var i=0;i<ele.length;i++)
				    ele[i].checked = false;
			}
			
			function validate() {
				var invoice = document.getElementById("invoiceNumber").value;
				var amount = document.getElementById("amount").value;
				var date = document.getElementById("billDate").value;
				var type = document.getElementById("type").value;
				var hasError = false;
				if (invoice == '') {
					$("#invoiceNumber").after("<br class='error'><span class='error'><spring:message code='html.request.error.invocenumber' /></span>");
					hasError = true;
				}
				if (amount == '') {
					$("#amount").after("<br class='error'><span class='error'><spring:message code='html.request.error.amount' /></span>");
					hasError = true;
				}
				
				if (date == '') {
					$("#billDate").after("<br class='error'><span class='error'><spring:message code='html.request.error.billdate' /></span>");
					hasError = true;
				}
				
				if (type == '') {
					$("#type").after("<br class='error'><span class='error'><spring:message code='html.request.error.type' /></span>");
					hasError = true;
				}
				
				return hasError;
			}
			
			function showDeleteValidaiton(row) {
				document.getElementById("deleterequestId").value = document.getElementById("requestId"+row).value;
				$("#deleteValidationDiv").dialog('option', 'modal', true).dialog('open');
			}
		</script>
		
		
	</head>
	<body>
		<br>
		<center>
			
			<table width="70%" class="ui-widget-content" border="0">
				<tr>
					<td>
						<a href="mainpage.view">
						<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" onclick="showTable()" style="cursor:pointer;">
							<spring:message code="html.mainpage.menu.add"/>
						</div>
						</a>
					</td>
					
					<td>
						<a href="status.view">
							<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
								<spring:message code="html.mainpage.menu.status"/>
							</div>
						</a>
					</td>
					
					<c:if test="${sessionScope.Login_Details.role != 'E'}">
					
						<td>
							<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
								<spring:message code="html.mainpage.menu.approve"/> 
							</div>
						</td>
					
					</c:if>
					
					<td>
						<a href="logout.view">
						<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
							<spring:message code="html.mainpage.menu.logout"/>
						</div>
						</a>
					</td>
					
				</tr>
			</table>
				
			
			<div id="requestDiv" name="requestDiv"  style="height:300px; overflow: auto">								
					<table width="70%" id="requestTable" name="requestTable" class="ui-widget-content;sortable"  cellspacing="1" cellpadding="1" height="35%">
						<thead class="cGrid ui-widget-header">
							<tr style="position:relative;top:expression(this.offsetParent.scrollTop);">
								<td align="center"><spring:message code="html.view.page.label.invoice" /></td>
								<td align="center"><spring:message code="html.view.page.label.amount" /></td>
								<td align="center"><spring:message code="html.view.page.label.type" /></td>
								<td align="center"><spring:message code="html.view.page.label.date" /></td>
								<td align="center"><spring:message code="html.view.page.label.status" /></td>
								<td align="center"><spring:message code="html.view.page.label.edit" /></td>
								
							</tr>
						</thead>
						<tbody class="cLabel">
							<c:choose>
								<c:when  test="${not empty statusList}">
									<c:set var="count" value="0"/>
									<c:forEach var="requestBean" items="${statusList}">
										<c:set var="count" value="${count+1}"/>
										<c:choose>
											<c:when test="${count % 2 == 0}">
												<tr class="even" id="row<c:out value='${count}'/>">
											</c:when>
											<c:otherwise>
												<tr class="odd" id="row<c:out value='${count}'/>">
											</c:otherwise>
										</c:choose>
											<td><span id="invoice${count}"><c:out value="${requestBean.invoiceNumber}"/></span></td>
											<td><span id="amount${count}"><c:out value="${requestBean.amount}"/></span></td>
											<td><span id="type${count}"><c:out value="${requestBean.type}"/></span></td>
											<td><span id="date${count}"><c:out value="${requestBean.billDate}"/></span></td>
											<td>
												<span id="status${count}"><c:out value="${requestBean.status}"/></span>
												<input type="hidden" id="requestId${count}" name="requestId${count}"  value="${requestBean.requestId}"/>
												<input type="hidden" id="notes${count}" name="requestId${count}"  value="${requestBean.notes}"/>
											</td>
											<td>
												<img src=<c:out value='${pageContext.request.contextPath}'/>/imgs/edit.png alt='Edit' onClick="populateValue(${count})"/>
											
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><td colspan="5" align="center"><label class="ui-widget-header" style="font-size:18">No Data Found</label></td></tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
			</div>
			
			
			<div id="requestEditDiv" name="requestEditDiv">		
				<form name="requestEditForm" id="requestEditForm" method="POST">
				
					<table  class="ui-widget-content" border="0">
						<tr>
							<td align="left"><spring:message code="html.request.label.invocenumber" />:</td>
							<td><input type="text" name="invoiceNumber" id="invoiceNumber" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.billdate" />:</td>
							<td><input type="date" name="billDate" id="billDate" maxlength="20" size="20"/></td>
						</tr>
						
						
						<tr>
							<td align="left"><spring:message code="html.request.label.amount" />:</td>
							<td><input type="text" name="amount" id="amount" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.notes" />:</td>
							<td><input type="text" name="notes" id="notes" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.approve" />:</td>
							<td>
								<input type="radio" name="approve" value="accept"> Accept &nbsp;&nbsp;&nbsp;<input type="radio" name="approve" value="decline">Decline
							</td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.type" />:</td>
							<td>
								<input type="text" name="type" id="type" maxlength="20" size="20"/>
								<input type="hidden" name="requestId" id="requestId" maxlength="20" size="20"/>
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>						
						
					</table>
				</form>
			</div>
			
			<div id="saveSucessfully" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.updated" /></p>
			 </div>
			
			<div id="deletedSucessfully" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.delete" /></p>
			 </div>
			 
			 <div id="notsaveSucessfully" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.notupdate" /></p>
			 </div>
			
			<div id="deleteValidationDiv" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.global.label.delete.validation"/></p>
			 	 <form name="deleteForm" id="deleteForm" method="POST">
			 	 	<input type="hidden" name="deleterequestId" id="deleterequestId" maxlength="20" size="20"/>
				 	<input type="submit" name="deleteFormsubmitButton" id="deleteFormsubmitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
			 	 </form>
			 </div>
			
		</center>
		
		
	</body>
</html>