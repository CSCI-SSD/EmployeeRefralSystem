// Nam Nguyen - Add maximize functionality to jQuery UI Dialog
// enableMaximize should be set at uidialog init time
var _createBase = $.ui.dialog.prototype._create; 
var openBase = $.ui.dialog.prototype.open; 

$.ui.dialog.prototype.open = function() {
    var self = this,
        options = self.options,
        restoreValues = self.restoreValues;    
    
    return openBase.apply(this);
}

$.ui.dialog.prototype._maximize = function() {
    var self = this,
        options = self.options,
        restoreValues = self.restoreValues;
    
    if (options.isMaximized)
        return;
    options.isMaximized = true;
    
    // store current values
    restoreValues.height = options.height;
    restoreValues.width = options.width;
    restoreValues.position = options.position;
    restoreValues.resizable = options.resizable;
    restoreValues.draggable = options.draggable;
    
    self.option("position", [0, 0]);
    self.option("resizable", false);
    self.option("draggable", false);
    self.option("height", $(window).height() - 15);
    self.option("width", $(window).width() - 10);    
}

$.ui.dialog.prototype._restore = function() {
    var self = this,
        options = self.options,
        restoreValues = self.restoreValues;
    
    if (options.isMaximized === false)
        return;

    options.isMaximized = false;
    self.option("height", restoreValues.height);
    self.option("width", restoreValues.width); 
    self.option("position", restoreValues.position); 
    self.option("resizable", restoreValues.resizable);
    self.option("draggable", restoreValues.draggable);  
}

$.ui.dialog.prototype._create = function() {
    _createBase.apply(this);
    var self = this,
        options = self.options,
        restoreValues = (self.restoreValues = {});

    if (options.enableMaximize) {
        var uiDialogTitlebarMaximize = $('<a href="#"></a>')
                .addClass(
                    'ui-dialog-titlebar-close ' +
                    'ui-corner-all'
                )
                .css("right", "2em")
                .attr('role', 'button')
                .hover(
                    function() {
                        uiDialogTitlebarMaximize.addClass('ui-state-hover');
                    },
                    function() {
                        uiDialogTitlebarMaximize.removeClass('ui-state-hover');
                    }
                )
                .focus(function() {
                    uiDialogTitlebarMaximize.addClass('ui-state-focus');
                })
                .blur(function() {
                    uiDialogTitlebarMaximize.removeClass('ui-state-focus');
                })
                .click(function(event) {
                    if (options.isMaximized) {
                        self._restore();
                    }
                    else {
                        self._maximize();
                    }
                    return false;
                })
                .appendTo(self.uiDialogTitlebar),
            uiDialogTitlebarMaximizeText = (self.uiDialogTitlebarMaximizeText = $('<span></span>'))
                .addClass(
                    'ui-icon ' +
                    'ui-icon-copy'
                )
                .text(options.closeText)
                .appendTo(uiDialogTitlebarMaximize);
            if (options.isMaximized) {
                options.isMaximized = false;
                self._maximize();
            }
    }
}; 