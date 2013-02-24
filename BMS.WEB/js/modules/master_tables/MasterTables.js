﻿Ext.define('MyDesktop.MasterTables', {
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
    id: 'master-table-win',
    init: function() {
        this.launcher = {
            text: 'Tablas Maestras',
            iconCls: 'icon-master-table16'
        }
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('master-table-win');
        if (!win) {
            var masterTableTreeStore = new Ext.data.TreeStore({
                root: {
                    expanded: true,
                    children: [
				        {
				            text: "Maestras",
				            expanded: true,
				            children: [
					            {
					                text: "Usuarios",
					                id: "User",
					                leaf: true
					            },
					            {
					                text: "Personas",
					                id: "Person",
					                leaf: true
					            },
					            {
					                text: "Roles",
					                id: "Profile",
					                leaf: true
					            },
					            {
					                text: "Sedes",
					                id: "Headquarter",
					                leaf: true
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
                store: masterTableTreeStore
            });

            win = desktop.createWindow({
                id: 'master-table-win',
                title: 'Tablas Maestras',
                width: 800,
                height: 600,
                iconCls: 'icon-master-table16',
                animCollapse: true,
                border: true,
                hideMode: 'offsets',
                layout: 'border',
                items: [
                            tree,
                            {
                                xtype: 'tabpanel',
                                id: 'master_panel_tabpanel_id',
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
                objectProperties(node[0].data);
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
				        'pages/master_tables/' + node.id + '.aspx"></iframe>'
                });

                Ext.getCmp('master_panel_tabpanel_id').add(panel);
                panel.show();
            }

            var user_node = masterTableTreeStore.getNodeById('User');
            add_master_panel(user_node.data);
        }
        return win;
    }
});