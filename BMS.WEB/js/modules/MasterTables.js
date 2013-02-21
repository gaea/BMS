Ext.define('MyDesktop.MasterTables', {
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
    id: 'master-tables-win',
    init: function() {
        this.launcher = {
            text: 'Tablas Maestras',
            iconCls: 'icon-master-tables'
        }
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('master-tables-win');
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
					                leaf: true,
					                expanded: true,
					                handler: function() {
					                    //Ext.Msg.confirm('Usuarios', '¿Desea abrir la tabla Usuarios?');
					                }
					            },
					            {
					                text: "Funcionarios",
					                leaf: true
					            },
					            {
					                text: "Modulos",
					                leaf: true
					            },
					            {
					                text: "Modulos por Rol",
					                leaf: true
					            },
					            {
					                text: "Personas",
					                leaf: true
					            },
					            {
					                text: "Roles",
					                id: "Profile",
					                leaf: true
					            },
					            {
					                text: "Sedes",
					                leaf: true
					            }
				            ]
				        }
		            ]
                }
            });

            var tree = new Ext.tree.Panel({
                title: 'Tablas',
                height: 600,
                width: 180,
                anchor: '100%',
                useArrows: true,
                collapsible: true,
                useArrows: true,
                rootVisible: false,
                multiSelect: true,
                singleExpand: true,
                store: masterTableTreeStore
            });

            win = desktop.createWindow({
                id: 'master-table-win',
                title: 'Tablas Maestras',
                width: 800,
                height: 600,
                iconCls: 'icon-master-tables',
                animCollapse: false,
                border: false,
                hideMode: 'offsets',
                layout: 'column',
                items: [
                            tree,
                            {
                                xtype: 'tabpanel',
                                id: 'master_panel_tabpanel_id',
                                activeTab: 0,
                                region: 'center',
                                margins: '0 5 5 0',
                                enableTabScroll: true
                            }
                       ]
            });

            var sm = tree.getSelectionModel();
            sm.on('beforeselect', function(sm, node) { return node.isLeaf(); });
            sm.on('selectionchange', function(sm, node) {
                objectProperties(node[0].data);
                if (Ext.getCmp(node[0].data.id) != null) { Ext.getCmp(node[0].data.id).show(); }
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

                Ext.getCmp('master_panel_tabpanel_id').add(panel);
                panel.show();
            }

            var user_node = masterTableTreeStore.getNodeById('User');
            add_master_panel(user_node.data);
        }
        return win;
    }
});
Ext.onReady(function () { 
function sendMessage(page, parameters){
			Ext.Ajax.request({
			method:'POST',
			url:page,
			params:parameters,
			waitTitle:'Enviando',
			waitMsg:'Enviando datos...',
			timeout:180000, // tiempo de espera al servidor
			success:function(response){
				obj = Ext.JSON.decode(response.responseText);
				mensajeConfirmacion('Mensaje', obj.mensaje, funcionSuccess());
			},
			failure:function(form, response){
				obj = Ext.JSON.decode(response.responseText);
				mensajeConfirmacion('Error', obj.mensaje, funcionFailure());
			}
			}); 
		}	
});