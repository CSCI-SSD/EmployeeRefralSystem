<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
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
				
				$("#invaliedLogin").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $(this).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				
				var message = "${message}";
				
				if (message=='Invalied Login') {
					$("#invaliedLogin").dialog('option', 'modal', true).dialog('open');
				}
			 	
			});
			
			function login() {
				$(".error").hide();
				var username = document.getElementById('userName').value;
				var password = document.getElementById('password').value;
				var hasError = false;
				if (username == '') {
					$("#userName").after("<br class='error'><span class='error'><spring:message code='html.login.error.username' /></span>");
					hasError = true; 	
				}
				if (password == '') {
					$("#password").after("<br class='error'><span class='error'><spring:message code='html.login.error.password' /></span>");
					hasError = true; 
				}
				
				if (!hasError) {
					var ctx = "${pageContext.request.contextPath}"+"/login.view";
					document.getElementById("loginForm").action = ctx;
					document.getElementById("submitButton").click();
				} else {
					return false;
				}
			}
		</script>
		
		
	</head>
	<body>
		<br>
		<center>
			<table width="50%" class="ui-widget-content" border="0">
				<tr>
					<td>
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" width="50%">
							<spring:message code="html.login.label.login.title"/>
						</div>
					</td>
				</tr>
			</table>
			<form name="loginForm" id="loginForm" method="POST">
				<div id="addDiv" name="addDiv">		
					<table width="50%" class="ui-widget-content" border="0">
						<tr>
							<td align="left"><spring:message code="html.login.label.username" />:</td>
							<td><input type="text" name="userName" id="userName" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td  align="left"><spring:message code="html.login.label.password" />:</td>
							<td><input type="password" name="password" id="password" maxlength="20" size="20"/></td>
						</tr>
						<tr>
							<td  align="center" colspan="4">
								<input type="button" name="submit" id="search" class="ui-button" value="<spring:message code="html.global.label.button.submit" />" onClick="login();" />
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>
						
					</table>
				</div>
			</form>
			
			<div id="invaliedLogin" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.login.label.invaliedlogin" /></p>
			 </div>
			
		</center>>
	</body>
</html>