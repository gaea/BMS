var moduleManagePersonId = 'master-manage-person-win';
var moduleManagePersonName = 'Personas';
var moduleManagePersonIcon = 'persons16';
var moduleManagePersonWidth = null;
var moduleManagePersonHeight = null;

Ext.onReady(function() {
	moduleManagePersonWidth = Ext.getBody().getViewSize().width * 0.9;
	moduleManagePersonHeight = Ext.getBody().getViewSize().height * 0.9;
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
    id: moduleManagePersonId,
    init: function() {
        this.launcher = {
            text: moduleManagePersonName,
            iconCls: moduleManagePersonIcon
        }
    },
    createWindow: function() {
		
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow(moduleManagePersonId);
		
        if (!win) {
		
			var panel = new Ext.Panel({
				id: 'id_panel_'  + moduleManagePersonId,
				border:false,
				tabTip: moduleManagePersonName,
				monitorResize: true,
				margin: '0 0 0 0',
				layout: 'fit',
				autoScroll: true,
				html: '<iframe style="overflow:auto;width:100%;height:100%;" frameborder="0"  src="' +
					'pages/person/RegisterPerson.aspx"></iframe>'
			});

			win = desktop.createWindow({
				id: moduleManagePersonId,
                title: moduleManagePersonName,
				width: moduleManagePersonWidth,
                height: moduleManagePersonHeight,
                iconCls: moduleManagePersonIcon,
				items: [
							panel
                       ]
			});
		}
		return win;
	}
});