


<%@page isErrorPage="true" import="java.io.*" %>
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
		
			<img src="'${pageContext.request.contextPath}'/>/imgs/error.jpg" onclick="display_exception();" /><font size="5" color="red">The Resource you have requested doesn't exists!</font>
		</center>
	</body>
	<br>
	
	<div id="exceptionId" style="display:none"><%=exception.toString()%></div>
</html>