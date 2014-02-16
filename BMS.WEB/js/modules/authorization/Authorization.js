var moduleAuthorizationId = 'master-authorization-win';
var moduleAuthorizationName = 'Registro';
var moduleAuthorizationIcon = 'icon-biometric-authorization16';
var moduleAuthorizationWidth = null;
var moduleAuthorizationHeight = null;

Ext.onReady(function() {
	moduleAuthorizationWidth = Ext.getBody().getViewSize().width * 0.9;
	moduleAuthorizationHeight = Ext.getBody().getViewSize().height * 0.9;
});

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
    id: moduleAuthorizationId,
    init: function() {
        this.launcher = {
            text: moduleAuthorizationName,
            iconCls: moduleAuthorizationIcon
        }
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow(moduleAuthorizationId);
        if (!win) {
            var masterAuthorizationTreeStore = new Ext.data.TreeStore({
                root: {
                    expanded: true,
                    children: [
				        {
				            text: "Maestras",
				            expanded: true,
							iconCls: 'icon-content',
				            children: [
					            {
					                text: "Registro Ingreso",
					                id: "RegisterAuthorization",
					                leaf: true,
									iconCls:'icon-register'
					            },
					            {
					                text: "Consulta Registro",
					                id: "ConsultAuthorization",
					                leaf: true,
									iconCls:'icon-consult'
					            },
					            {
					                text: "Aprobaciones",
					                id: "RegisterRequest",
					                leaf: true,
									iconCls:'icon-accept'
					            },
					            {
					                text: "Auditoría Ingreso",
					                id: "ConsultAuditEntry",
					                leaf: true,
									iconCls:'icon-audit'
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
                id: moduleAuthorizationId,
                title: moduleAuthorizationName,
                width: moduleAuthorizationWidth,
                height: moduleAuthorizationHeight,
                iconCls: moduleAuthorizationIcon,
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
				        'pages/authorization/' + node.id + '.aspx"></iframe>'
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
