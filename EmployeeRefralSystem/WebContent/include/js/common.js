function DisableButton(buttonId) {
    $("#" + buttonId).removeAttr("disabled").removeAttr("aria-disabled").button("option", "disabled", true);
}
function EnableButton(buttonId) {
    $("#" + buttonId).removeAttr("disabled").removeAttr("aria-disabled").button("option", "disabled", false);
}
/*
Structure of error message section should be
<div id="divMsgSection" class="messageSection ui-widget uiSection" style="display:none">
<div style="padding: 0pt 0.7em;" class="ui-state-error ui-corner-all ui-helper-clearfix"> 
<span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-alert"></span> 
<span style="float: left; display: block;" id="msgDivId"></span>
</div>
</div>
*/
function ShowErrorMessage(msgDivId, msg) {
    if (msgDivId && msg) {
        $("#" + msgDivId).html(msg).closest(".ui-widget").show();
    }
}

function HideErrorMessage(msgDivId) {
    if (msgDivId) {
        $("#" + msgDivId).html("").closest(".ui-widget").hide();
    }
}

function ToggleBarExpand($toggleBarJQueryObj) {
    var $icon = $toggleBarJQueryObj.find(".ui-icon");
    if ($icon.hasClass("ui-icon-triangle-1-e")) {
        $icon.removeClass("ui-icon-triangle-1-e").addClass("ui-icon-triangle-1-s");
        $toggleBarJQueryObj.next().slideDown();
    }
}

function ToggleBarCollapse($toggleBarJQueryObj) {
    var $icon = $toggleBarJQueryObj.find(".ui-icon");
    if ($icon.hasClass("ui-icon-triangle-1-s")) {
        $icon.removeClass("ui-icon-triangle-1-s").addClass("ui-icon-triangle-1-e");
        $toggleBarJQueryObj.next().slideUp();
    }
}

var reAttachOnUpdatePanelCallBack = true;
var updatePanelsToReInit = [];
function UpdatePanelReloaded(s, e) {
    //alert("in update panel reloaded");
    $.each(updatePanelsToReInit, function(i, v) {
        GlobalInit($("#" + v));
    });
}

function GlobalInit($container) {
	if($container!=null)
	{
	    $container.find(".ui-button").button();
	    // if(parent.testTimer) {
	        // var elapsed = (new Date() - parent.testTimer)/1000;
	        // parent.totalTime += elapsed;
	        // parent.timeMessage+="\nbefore tabs:\n"+elapsed+"\n" + $container.attr("id") + "\n";
	        // parent.testTimer=new Date();
	    // }
	    $container.find(".ui-tabs").tabs();
	    // if(parent.testTimer) {
	        // var elapsed = (new Date() - parent.testTimer)/1000;
	        // parent.totalTime += elapsed;
	        // parent.timeMessage+="\nafter tabs:\n"+elapsed+"\n";
	        // parent.testTimer=new Date();
	    // }
	    

	    $container.find(".ui-button-icon")
	        .hover(
	            function() {
	                $(this).addClass("ui-state-hover");
	            },
	            function() {
	                $(this).removeClass("ui-state-hover");
	            });

	    $container.find(".ui-widget.ui-toggleBar .ui-widget-header")
	    .live("click", function() {
	        if ($(this).find(".ui-icon").hasClass("ui-icon-triangle-1-e")) {
	            ToggleBarExpand($(this));
	        }
	        else {
	            ToggleBarCollapse($(this));
	        }
	    });
	    
	    // Input text focus
	    $container.find(".ui-inputText")
	    .live("focus", function() { $(this).addClass("focus"); })
	    .live("blur", function() { $(this).removeClass("focus"); });

	    try {
	        $(".ui-dropdownList").selectbox();
	    }
	    catch(e) {}

	    if ($.mask) {
	        $container.find('input:text.ui-inputTextMask').maskWrapper();
	    }
	    if ($.watermark) {
	        $(".ui-inputTextWatermark").watermarkWrapper();
	    }
	    if ($.tooltip) {        
	        $(".ui-toolTip").tooltip({
	            showURL: false
	        });
	    }
	}
}

$.fn.maskWrapper=function() {
    $.each(this,function(i,v) {
        var $v=$(v);
        $v.mask($.mask.masks[$v.attr("alt")]);
    });
}

$.fn.watermarkWrapper=function() {
    $.each(this,function(i,v) {
        var $v=$(v);
        $v.watermark($v.attr("watermark"));
    });
}

$(document).ready(function() {
    // Reattach events on updatepanel callback
    if (reAttachOnUpdatePanelCallBack) {
        try {
            var pageMgr = Sys.WebForms.PageRequestManager.getInstance();
            pageMgr.add_endRequest(UpdatePanelReloaded);
        }
        catch (e) { }
    }
    GlobalInit($("body"));
});

$.fn.clearForm = function() {
	// iterate each matching form
	return this.each(function() {
		 // iterate the elements within the form
		  $(':input', this).each(function() {
			    var type = this.type, tag = this.tagName.toLowerCase();
			    if (type == 'text' || type == 'password' || tag == 'textarea')
				this.value = '';
			    else if (type == 'checkbox' || type == 'radio')
				this.checked = false;
			     else if (tag == 'select')
				this.selectedIndex = -1;
		    });
	  });
};
