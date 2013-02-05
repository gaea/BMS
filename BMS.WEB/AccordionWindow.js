/*!
 * Ext JS Library 4.0
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */

Ext.define('MyDesktop.AccordionWindow', {
    extend: 'Ext.ux.desktop.Module',

    requires: [
        'Ext.data.TreeStore',
        'Ext.layout.container.Accordion',
        'Ext.toolbar.Spacer',
        'Ext.tree.Panel'
    ],

    id:'acc-win',

    init : function(){
        this.launcher = {
            text: 'Accordion Window',
            iconCls:'accordion'
        };
    },

    createTree : function(){
        var tree = Ext.create('Ext.tree.Panel', {
            id:'im-tree',
            title: 'Usuarios Conectados',
            rootVisible:false,
            lines:false,
            autoScroll:true,
            tools:[{
                type: 'refresh',
                handler: function(c, t) {
                    tree.setLoading(true, tree.body);
                    var root = tree.getRootNode();
                    root.collapseChildren(true, false);
                    Ext.Function.defer(function() { // mimic a server call
                        tree.setLoading(false);
                        root.expand(true, true);
                    }, 1000);
                }
            }],
            store: Ext.create('Ext.data.TreeStore', {
                root: {
                    text:'Conectados',
                    expanded: true,
                    children:[{
                        text:'Amigos',
                        expanded:true,
                        children:[
                            { text:'Carlos', iconCls:'user', leaf:true },
                            { text:'Mario', iconCls:'user', leaf:true },
                            { text:'Diego', iconCls:'user', leaf:true },
                            { text:'Mateo', iconCls:'user', leaf:true }
                        ]
                    },{
                        text:'Familia',
                        expanded:true,
                        children:[
                            { text:'Amparo', iconCls:'user-girl', leaf:true },
                            { text:'Luz', iconCls:'user-girl', leaf:true },
                            { text:'Agust&iacute;n', iconCls:'user-kid', leaf:true }
                        ]
                    }]
                }
            })
        });

        return tree;
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('acc-win');

        if (!win) {
            win = desktop.createWindow({
                id: 'acc-win',
                title: 'Administraci&oacute;n de Usuarios',
                width: 250,
                height: 400,
                iconCls: 'accordion',
                animCollapse: false,
                constrainHeader: true,
                bodyBorder: true,
                tbar: {
                    xtype: 'toolbar',
                    ui: 'plain',
                    items: [{
                        tooltip:{title:'Rich Tooltips', text:'Let your users know what they can do!'},
                        iconCls:'connect'
                    },
                    '-',
                    {
                        tooltip:'Nuevo Usuario',
                        iconCls:'user-add'
                    },
                    ' ',
                    {
                        tooltip:'Eliminar Usuario',
                        iconCls:'user-delete'
                    }]
                },

                layout: 'accordion',
                border: false,

                items: [
                    this.createTree(),
                    {
                        title: 'Configuraci&oacute;n',
                        html : '<p>Par&aacute;metros a adicionar.</p>',
                        autoScroll:true
                    },
                    {
                        title: 'Otros Items',
                        html : '<p>Par&aacute;metros a adicionar.</p>'
                    },
                    {
                        title: 'M&aacute;s Items',
                        html : '<p>Par&aacute;metros a adicionar.</p>'
                    }
                ]
            });
        }

        return win;
    }
});
