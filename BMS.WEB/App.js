Ext.define('MyDesktop.App', {
    extend: 'Ext.ux.desktop.App',
    requires: [
        'Ext.window.MessageBox',
        'Ext.ux.desktop.ShortcutModel',
        'MyDesktop.SystemStatus',
        'MyDesktop.GridWindow',
        'MyDesktop.BogusMenuModule',
        'MyDesktop.BogusModule',
		'MyDesktop.BiometricAuthorization',
        'MyDesktop.Settings'
    ],
    init: function() {
        this.callParent();
    },
    getModules : function(){
	// Modulos del sistema
        return [
            //new MyDesktop.VideoWindow(),
            //new MyDesktop.Blockalanche(),
            new MyDesktop.SystemStatus(),
            new MyDesktop.BiometricAuthorization(),
			//new MyDesktop.GridWindow(),
            //new MyDesktop.TabWindow(),
            //new MyDesktop.AccordionWindow(),
            //new MyDesktop.Notepad(),
            // Item de menu
			//new MyDesktop.BogusMenuModule(),
            //new MyDesktop.BogusModule()
        ];
    },

    getDesktopConfig: function () {
        var me = this, ret = me.callParent();

        return Ext.apply(ret, {
            //cls: 'ux-desktop-black',

            contextMenuItems: [
                { text: 'Change Settings', handler: me.onSettings, scope: me }
            ],

            shortcuts: Ext.create('Ext.data.Store', {
                model: 'Ext.ux.desktop.ShortcutModel',
                data: [
                    //{ name: 'Grilla', iconCls: 'grid-shortcut', module: 'grid-win' },
					{ name: 'Registro Autorizaciones', iconCls: 'biometric-authorization-shortcut', module: 'authorization-win' },
                    //{ name: 'Administraci&oacute;n de Usuarios', iconCls: 'accordion-shortcut', module: 'acc-win' },
                    //{ name: 'Notepad', iconCls: 'notepad-shortcut', module: 'notepad' },
                    { name: 'Sistema', iconCls: 'cpu-shortcut', module: 'systemstatus'}
                ]
            }),

            wallpaper: 'wallpapers/desktop.jpg',
            wallpaperStretch: false
        });
    },

    // config for the start menu
    getStartConfig : function() {
        var me = this, ret = me.callParent();

        return Ext.apply(ret, {
            title: 'Administrador',
            iconCls: 'user',
            height: 300,
            toolConfig: {
                width: 100,
                items: [
                    {
                        text:'Configuraci&oacute;n',
                        iconCls:'settings',
                        handler: me.onSettings,
                        scope: me
                    },
                    '-',
                    {
                        text:'Salir',
                        iconCls:'logout',
                        handler: me.onLogout,
                        scope: me
                    }
                ]
            }
        });
    },

    getTaskbarConfig: function () {
        var ret = this.callParent();

        return Ext.apply(ret, {
            quickStart: [
                { name: 'Registro Autorizaciones', iconCls: 'icon-biometric-authorization', module: 'authorization-win' }
            ],
            trayItems: [
                { xtype: 'trayclock', flex: 1 }
            ]
        });
    },

    onLogout: function () {
        Ext.Msg.confirm('Logout', '¿Deseas salir de la aplicaci&oacute;n?');
    },

    onSettings: function () {
        var dlg = new MyDesktop.Settings({
            desktop: this.desktop
        });
        dlg.show();
    }
});
