Ext.define('MyDesktop.Authorization', {
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
    id: 'master-authorization-win',
    init: function() {
        this.launcher = {
            text: 'Autorizaciones',
            iconCls: 'icon-biometric-authorization16'
        }
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('master-authorization-win');
        if (!win) {
            var masterAuthorizationTreeStore = new Ext.data.TreeStore({
                root: {
                    expanded: true,
                    children: [
				        {
				            text: "Maestras",
				            expanded: true,
				            children: [
					            {
					                text: "Registro",
					                id: "RegisterAuthorization",
					                leaf: true
					            },
					            {
					                text: "Aprobaciones",
					                id: "RegisterRequest",
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
                store: masterAuthorizationTreeStore
            });

            win = desktop.createWindow({
                id: 'master-authorization-win',
                title: 'Autorizaciones',
                width: 800,
                height: 670,
                iconCls: 'icon-biometric-authorization16',
                animCollapse: true,
                border: true,
                hideMode: 'offsets',
                layout: 'border',
                items: [
                            tree,
                            {
                                xtype: 'tabpanel',
                                id: 'master_authorization_panel_tabpanel_id',
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
				        'pages/' + node.id + '.aspx"></iframe>'
                });

                Ext.getCmp('master_authorization_panel_tabpanel_id').add(panel);
                panel.show();
            }

            var user_node = masterAuthorizationTreeStore.getNodeById('RegisterAuthorization');
            add_master_panel(user_node.data);
        }
        return win;
    }
});
