/**
 * This is to handle DWR Exceptions in UI
 */

$(document).ready(function() {
	dwr.engine.setErrorHandler(exceptionHandler);
});

function exceptionHandler(msg, exc) {
	if (msg == "'null' is null or not an object") {
		msg = 'No Data Found';
		alert(msg);
		$( lodingData ).dialog( "close" );
		return false;
	}
	$( lodingData ).dialog( "close" );
	 alert(msg);
	 if (msg == 'Seesion Expired') {
		 window.location = "/ers/ErrorSubmit.jsp";
	 }
}

function loadNoDataToTable(tableId,colspan) {
	var tableBody = document.getElementById(tableId);
	dwr.util.removeAllRows(tableId);
	var newRow = tableBody.insertRow(0);
	newRow.border='1';
	var newCell;
	for(var i=0; i<Math.floor(colspan/2);i++) 
	newCell =  newRow.insertCell(i);
	newCell.className = 'ui-widget-header"';
	newCell.innerHTML = '<label class="ui-widget-header" style="font-size:18">No Data Found</label>'
}