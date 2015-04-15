<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script src="include/js/jQuery/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery-ui-1.8.2.custom.min.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.dialog.extend.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.selectbox-1.2.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.layout.min-1.2.0.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.maskedinput-1.2.2.min.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.maskedinput.rules.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.jstree.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.cookie.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.watermark.min.js" type="text/javascript"></script>
<script src="include/js/jQuery/jquery.tooltip.min.js" type="text/javascript"></script>

<script src="include/js/common.js" type="text/javascript"></script>
<script src="include/js/syntaxhighlighter/shCore.js" type="text/javascript"></script>
<script src="include/js/syntaxhighlighter/shBrushCSharp.js" type="text/javascript"></script>
<script src="include/js/syntaxhighlighter/shBrushJScript.js" type="text/javascript"></script>
<script src="include/js/syntaxhighlighter/shBrushXml.js" type="text/javascript"></script>
<script src="include/js/syntaxhighlighter/shBrushCss.js" type="text/javascript"></script>

<script src="include/js/dwrexception.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="include/css/common.css" />
<link href="include/css/syntaxhighlighter/shCore.css" rel="stylesheet" type="text/css" />
<link href="include/css/syntaxhighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />
<link href="include/css/blue/jquery-ui-1.8.2.custom.css" type="text/css" rel="stylesheet" />
<link href="include/css/blue/jqueryThemeSupplement.css" type="text/css" rel="stylesheet" />
 
 <style type="text/css">
	.even{
	 BACKGROUND-COLOR: #ECF2F2;
	}
	 .odd{
	BACKGROUND-COLOR: #EFEFEF;
	}
	.hoverPointer {
		cursor:pointer;
	}
	.error {
	COLOR: red;
	}
	.red {
	BACKGROUND-COLOR: red;
	}

	.highlightColor {
	BACKGROUND-COLOR: #FBEC88;
	}

	.highlightColor1 {
	BACKGROUND-COLOR: #FCBD5E;
	}
</style>




<div id="lodingData" title="Loading Data" align="center">
	<img src="imgs/loading_brown_128.gif" alt="Loading"/>
</div>


<table width="100%" class="ui-widget-content" border="0" id="footer" align="center">
	<tr>
		<td>
		<div class="ui-widget-header mainHeader" id="pageFooter" name="pageFooter"  >
			<spring:message code="html.global.label.footer"/>
		</div>
		</td>
	</tr>
</table>		