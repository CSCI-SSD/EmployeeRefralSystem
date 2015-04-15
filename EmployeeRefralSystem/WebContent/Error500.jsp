<%@page isErrorPage="true" import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>

<head><title>Error Page</title>
<script type="text/javascript" language="javascript">
var count=0;
function display_exception()
{
  if (count == 0)
  {
   	document.getElementById("exceptionId").style.display="block";
   	count = 1;
  }
  else
  {
  	document.getElementById("exceptionId").style.display="none";
  	count = 0;
  }
}
</script>
</head>
	<body>
		<center>
			<img src="'${pageContext.request.contextPath}'/>/imgs/error.jpg" onclick="display_exception();" /><font size="5" color="red">There was a problem while servicing your request!</font>
		</center>
	</body>
	<br>
	
	<div id="exceptionId" style="display:none"><%=exception.toString()%></div>
</html>