var moduleId = 'master-manage-person-win';
var moduleName = 'Personas';
var moduleIcon = 'persons16';
var moduleWidth = null;
var moduleHeight = null;

Ext.onReady(function() {
	moduleWidth = Ext.getBody().getViewSize().width * 0.9;
	moduleHeight = Ext.getBody().getViewSize().height * 0.9;
});

Ext.define('MyDesktop.ManagePerson', {
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
		
        if (!win) {
		
			var panel = new Ext.Panel({
				id: 'id_panel_'  + moduleId,
				title: moduleName,
				tabTip: moduleName,
				monitorResize: true,
				margin: '0 0 0 0',
				layout: 'fit',
				autoScroll: true,
				html: '<iframe style="overflow:auto;width:100%;height:100%;" frameborder="0"  src="' +
					'pages/person/RegisterPerson.aspx"></iframe>'
			});

			win = desktop.createWindow({
				id: moduleId,
                title: moduleName,
				width: moduleWidth,
                height: moduleHeight,
                iconCls: moduleIcon,
				items: [
							panel
                       ]
			});
		}
		return win;
	}
});