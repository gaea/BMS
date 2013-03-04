var moduleId = 'master-diary-win';
var moduleName = 'Agenda';
var moduleIcon = 'diary16';
var moduleWidth = null;
var moduleHeight = null;

Ext.onReady(function() {
	moduleWidth = Ext.getBody().getViewSize().width * 0.9;
	moduleHeight = Ext.getBody().getViewSize().height * 0.9;
});

Ext.define('MyDesktop.Diary', {
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
            var masterDiaryTreeStore = new Ext.data.TreeStore({
                root: {
                    expanded: true,
                    children: [
				        {
				            text: "Maestras",
				            expanded: true,
				            children: [
					            {
					                text: "Registro",
					                id: "RegisterDiary",
					                leaf: true
					            },
								{
									text: "Consulta",
									id: "ConsultDiary",
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
                store: masterDiaryTreeStore
            });

            win = desktop.createWindow({
                id: moduleId,
                title: moduleName,
                width: moduleWidth,
                height: moduleHeight,
                iconCls: moduleIcon,
                animCollapse: true,
                border: true,
                hideMode: 'offsets',
                layout: 'border',
                items: [
                            tree,
                            {
                                xtype: 'tabpanel',
                                id: 'master_diary_panel_tabpanel_id',
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
				        'pages/diary/' + node.id + '.aspx"></iframe>'
                });

                Ext.getCmp('master_diary_panel_tabpanel_id').add(panel);
                panel.show();
            }

            var user_node = masterDiaryTreeStore.getNodeById('RegisterDiary');
            add_master_panel(user_node.data);
        }
        return win;
    }
});
