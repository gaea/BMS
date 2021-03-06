﻿var moduleDeviceId = 'master-device-win';
var moduleDeviceName = 'Dispositivos';
var moduleDeviceIcon = 'icon-device';
var moduleDeviceWidth = null;
var moduleDeviceHeight = null;

Ext.onReady(function() {
	moduleDeviceWidth = Ext.getBody().getViewSize().width * 0.9;
	moduleDeviceHeight = Ext.getBody().getViewSize().height * 0.9;
});

Ext.define('MyDesktop.Device', {
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
    id: moduleDeviceId,
    init: function() {
        this.launcher = {
            text: moduleDeviceName,
            iconCls: moduleDeviceIcon
        }
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow(moduleDeviceId);
        if (!win) {
            var masterDeviceTreeStore = new Ext.data.TreeStore({
                root: {
                    expanded: true,
                    children: [
				        {
				            text: "Maestras",
				            expanded: true,
							iconCls: 'icon-content',
				            children: [
					            {
					                text: "Dispositivos",
					                id: "ViewDevice",
					                leaf: true,
									iconCls:'icon-register'
					            }
				            ]
				        }
		            ]
                }
            });

            var tree = new Ext.tree.Panel({
                title: 'Tablas',
                region:'west',
                split: true,
                width: 180,
                collapseMode: 'mini',
                rootVisible: false,
                useArrows: true,
                lines: false,
                autoScroll: true,
                store: masterDeviceTreeStore
            });

            win = desktop.createWindow({
                id: moduleDeviceId,
                title: moduleDeviceName,
                width: moduleDeviceWidth,
                height: moduleDeviceHeight,
                iconCls: moduleDeviceIcon,
                animCollapse: true,
                border: true,
                hideMode: 'offsets',
                layout: 'border',
                items: [
                            tree,
                            {
                                xtype: 'tabpanel',
                                id: 'master_device_panel_tabpanel_id',
                                activeTab: 0,
                                region: 'center',
                                margins: '0 0 0 0',
                                enableTabScroll: true
                            }
                       ]
            });

            var sm = tree.getSelectionModel();
            sm.on('beforeselect', function(sm, node) { return node.isLeaf(); });
            sm.on('selectionchange', function(sm, node) {
                if (Ext.getCmp(node[0].data.id) != null ) { Ext.getCmp(node[0].data.id).show(); }
                else { add_master_panel(node[0].data); }
            });

            function add_master_panel(node) {
                var panel = new Ext.Panel({
                    id: node.id,
                    title: node.text,
                    closable: true,
                    tabTip: node.text,
                    monitorResize: true,
                    margin: '0 0 0 0',
                    layout: 'fit',
                    autoScroll: true,
                    html: '<iframe style="overflow:auto;width:100%;height:100%;" frameborder="0"  src="' +
				        'pages/device/' + node.id + '.aspx"></iframe>'
                });

                Ext.getCmp('master_device_panel_tabpanel_id').add(panel);
                panel.show();
            }

            var user_node = masterDeviceTreeStore.getNodeById('ViewDevice');
            add_master_panel(user_node.data);
        }
        return win;
    }
});
