<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
	<head>
		<title><spring:message code="html.login.label.login.title"/> </title>
		<script type="text/javascript" src="dwr/interface/mainPageControllerdwr.js"></script>
		<script type="text/javascript" src="dwr/util.js"> </script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<jsp:include flush="true" page="libjs.jsp"></jsp:include>
		
		<script type="text/javascript" >
			$(document).ready(function(){
				$("#lodingData").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460
			 	  	  
			 	});
				
				$("#saveNotSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
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
				
				var message = "${message}";
				
				if (message=='Done') {
					$("#saveSucessfully").dialog('option', 'modal', true).dialog('open');
				} else if (message=='notDone'){
					$("#saveNotSucessfully").dialog('option', 'modal', true).dialog('open');
				}
				
				$('#requestDiv').hide();
			 	$('#requestHeader').hide();
			});
			
			
			function showTable() {
				$('#requestDiv').show();
			 	$('#requestHeader').show();
			}
			
			function createrequest() {
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
					$("#amount").after("<br class='error'><span class='error'><spring:message code='html.request.error.billdate' /></span>");
					hasError = true;
				}
				
				if (date == '') {
					$("#billDate").after("<br class='error'><span class='error'><spring:message code='html.request.error.amount' /></span>");
					hasError = true;
				}
				
				if (type == '') {
					$("#type").after("<br class='error'><span class='error'><spring:message code='html.request.error.type' /></span>");
					hasError = true;
				}
				
				if (!hasError) {
					var ctx = "${pageContext.request.contextPath}"+"/createrequest.view";
					document.getElementById("requestForm").action = ctx;
					document.getElementById("submitButton").click();
					
				} else {
					
				}
				
				
			}
		</script>
		
		
	</head>
	<body>
		<br>
		<center>
			
			<table width="70%" class="ui-widget-content" border="0">
				<tr>
					<td>
						<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" onclick="showTable()" style="cursor:pointer;">
							<spring:message code="html.mainpage.menu.add"/>
						</div>
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
							<a href="status.view?requestType=approve">
								<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
									<spring:message code="html.mainpage.menu.approve"/> 
								</div>
							</a>
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
			<br><br>
			<table width="50%" class="ui-widget-content" border="0" id="requestHeader">
				<tr>
					<td>
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" width="50%">
							<spring:message code="html.request.page.title"/>
						</div>
					</td>
				</tr>
			</table>
			<form name="requestForm" id="requestForm" method="POST">
				<div id="requestDiv" name="requestDiv">		
					<table width="50%" class="ui-widget-content" border="0">
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
							<td align="left"><spring:message code="html.request.label.type" />:</td>
							<td><input type="text" name="type" id="type" maxlength="20" size="20"/></td>
						</tr>
						
						
						<tr>
							<td  align="center" colspan="4">
								<input type="button" name="submit" id="search" class="ui-button" value="<spring:message code="html.global.label.button.submit" />" onClick="createrequest();" />
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>
						
					</table>
				</div>
				
				<div id="saveSucessfully" title="Message">  
				 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.save" /></p>
				 </div>
				 
				 <div id="saveNotSucessfully" title="Message">  
				 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.notsave" /></p>
				 </div>
			</form>
			
			
		</center>
		
		
	</body>
</html>