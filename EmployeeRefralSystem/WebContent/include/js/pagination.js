var list = new Array();
var presentIndex = -1;
var pageSize = -1;
var paginationSize = 200;
var queryPagination = 0;
function onFirst() {
	$('#lodingData').dialog('option', 'modal', true).dialog('open');
	presentIndex = 1;
	loadPageNationData(0,paginationSize);
	$('#first').hide();
	$('#previous').hide();
	$('#last').show();
	$('#next').show();
	$('#lodingData').dialog('close');
}
function onNext() {
	$('#lodingData').dialog('option', 'modal', true).dialog('open');
	if (presentIndex == 1) {
		$('#first').show();
		$('#previous').show();
	}
	var start = presentIndex*paginationSize;
	start++;
	presentIndex++;
	var end ;
	if (presentIndex > Math.floor(pageSize/paginationSize)) {
		end = pageSize;
	} else {
		end = presentIndex * paginationSize;
	}
		loadPageNationData(start,end);
		if (presentIndex >= Math.floor(pageSize/paginationSize)) {
			$('#last').hide();
			$('#next').hide();
			$('#first').show();
			$('#previous').show();
		}
	$('#lodingData').dialog('close');
}
function onPrevious() {
	$('#lodingData').dialog('option', 'modal', true).dialog('open');
	var start = presentIndex -2;
	presentIndex--;
	start = start*paginationSize;
	var end;
	if (presentIndex > Math.floor(pageSize/paginationSize)) {
		end = pageSize;
	} else {
		end = presentIndex*paginationSize;
	}
	if (start != 0) {
		start++;
	}
	loadPageNationData(start,end);
	if (presentIndex == 1) {
		$('#first').hide();
		$('#previous').hide();
	}
	$('#last').show();
	$('#next').show();
	$('#lodingData').dialog('close');
}
function onLast() {
	$('#lodingData').dialog('option', 'modal', true).dialog('open');
	presentIndex = Math.floor(pageSize/paginationSize);
	loadPageNationData(presentIndex*paginationSize,pageSize);
	if (pageSize%paginationSize != 0) {
		presentIndex++;
	}
	$('#last').hide();
	$('#next').hide();
	$('#first').show();
	$('#previous').show();
	$('#lodingData').dialog('close');
}
function loadPageNationData(startIndex,endIndex) {
	var data = new Array();
	for (var i=startIndex,j =0 ; i<endIndex; i++,j++) {
		data[j] = list[i];
	}
	loadDatatoTable(data);
}
