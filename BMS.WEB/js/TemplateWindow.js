var moduleId = 'master-name-win';
var moduleName = 'Name';
var moduleIcon = 'name';
var moduleWidth = null;
var moduleHeight = null;

Ext.onReady(function() {
	moduleWidth = Ext.getBody().getViewSize().width * 0.9;
	moduleHeight = Ext.getBody().getViewSize().height * 0.9;
});

Ext.define('MyDesktop.Name', {
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'Ext.form.field.HtmlEditor',
        'Ext.data.*',
        'Ext.grid.*',
        'Ext.tree.*',
        'Ext.util.*',
        'Ext.toolbar.Paging',
        'Ext.ModelManager',
        'Ext.tip.QuickTipManager'
    ],
    id: moduleId,
    init: function() {
        this.launcher = {
            text: moduleName,
            iconCls: moduleIcon
        }
    },
    createWindow: function() {
		
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow(moduleId);
		alert(moduleId);
        if (!win) {
			win = desktop.createWindow({
				id: moduleId,
                title: moduleName,
				width: moduleWidth,
                height: moduleHeight,
                iconCls: moduleIcon,
				items: [
                       ]
			});
		}
		return win;
	}
});