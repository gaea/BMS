/*!
 * Documentation: 
 * 
 * 
 * 
 */

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

    id:'master-tables-win',

    init : function(){
        this.launcher = {
            text: 'Tablas Maestras',
            iconCls:'icon-master-tables'
        }
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('master-tables-win');
        if(!win){
                   
            var tree = new Ext.tree.Panel({
                        title: 'Tablas',
						height:600,
						width:180,
						anchor:'100%',
						useArrows:true,
				        collapsible: true,
                        useArrows: true,
                        rootVisible: false,
                        multiSelect: true,
                        singleExpand: true,
						store: new Ext.data.TreeStore({
							root: {
								expanded: true,
								children: [
									        { 
									            text: "Maestras", 
									            expanded: true, 
									            children: [
										        { 
										            text: "Usuarios", 
										            leaf: true, 
										            expanded:true,
										            handler: function(){
		                                                                Ext.Msg.confirm('Usuarios', '¿Desea abrir la tabla Usuarios?');
		                                                            }
										        },
										        { 
										            text: "Roles", 
										            leaf: true
										        },
										        { 
										            text: "Modulos", 
										            leaf: true
										        },
										        { 
										            text: "Modulos por Rol", 
										            leaf: true
										        }
									            ]     							               
									         }
							              ]
							       }
						})
			});
			
			var myData = [
                ['ahbarome', 'password'],
                ['gaea', 'password']
            ];
			
			// Creación del Store
            var store = Ext.create('Ext.data.ArrayStore', {
                fields: [
                   {name: 'Login', type: 'string'},
                   {name: 'Password', type: 'string'}
                ],
                data: myData
            });
			
			// Creación del Panel
            var grid = Ext.create('Ext.grid.Panel', {
                stateful: true,
                stateId: 'stateGrid',
                anchor:'100%',
                columns: [
                    {
                        text     : 'Login',
                        flex     : 1,
                        sortable : false,
                        dataIndex: 'login'
                    },
                    {
                        text     : 'Password',
                        width    : 75,
                        sortable : true,
                        dataIndex: 'password'
                    }
                ],
                tbar:[
		            {
			            text:'Adicionar',
			            iconCls:'add',
			            handler: function(){
			                        Ext.Msg.confirm('Adicionar', '¿Desea adicionar al usuario?');                
            			            }
		            },
		            {
			            text:'Eliminar',
			            iconCls:'remove',
			            handler: function(){
			                        Ext.Msg.confirm('Eliminar', '¿Desea eliminar al usuario?');                
            			            }
		            },
		            {
			            text:'Buscar',
			            iconCls:'search',
			            handler: function(){
			                        Ext.Msg.confirm('Buscar', '¿Desea buscar el usuario?');
			                        }
		            }
		            
                ],
                width: 600,
                height: 350,
                title: 'Usuarios',
                useArrows:true,
	            collapsible: true,
                useArrows: true,
                rootVisible: false,
                multiSelect: true,
                singleExpand: true,
                viewConfig: {
                    stripeRows: true
                }
            });
                    
            win = desktop.createWindow({
                id: 'master-table-win',
                title:'Tablas Maestras',
                width:800,
                height:600,
                iconCls: 'icon-master-tables',
                animCollapse:false,
                border: false,
                hideMode: 'offsets',
                layout:'column',
                items: [
                           tree,
                           grid
                       ]
            });
        }
        return win;
    }
});
