Ext.define("MyDesktop.App", { extend: "Ext.ux.desktop.App",
    requires: [
        "Ext.window.MessageBox",
        "Ext.ux.desktop.ShortcutModel",
        "MyDesktop.SystemStatus",
        "MyDesktop.VideoWindow",
        "MyDesktop.GridWindow",
        "MyDesktop.TabWindow",
        "MyDesktop.AccordionWindow",
        "MyDesktop.Notepad",
        "MyDesktop.BogusMenuModule",
        "MyDesktop.BogusModule",
        "MyDesktop.Settings",
        "MyDesktop.Authorization",
        "MyDesktop.MasterTables",
		"MyDesktop.Help"
    ],
    init: function() {
        this.callParent()
    },
    getModules: function() {
        return [
            new MyDesktop.VideoWindow(),
            new MyDesktop.SystemStatus(),
            new MyDesktop.GridWindow(),
            new MyDesktop.TabWindow(),
            new MyDesktop.AccordionWindow(),
            new MyDesktop.Notepad(),
            new MyDesktop.BogusMenuModule(),
            new MyDesktop.BogusModule(),
            new MyDesktop.Authorization(),
            new MyDesktop.MasterTables(),
			new MyDesktop.Help()
        ]
    },
    getDesktopConfig: function() {
        var b = this,
        a = b.callParent();
        return Ext.apply(
            a, {
                contextMenuItems: [
                    {
                        text: "Change Settings",
                        handler: b.onSettings,
                        scope: b
                    }
                ],
                shortcuts: Ext.create("Ext.data.Store", {
                    model: "Ext.ux.desktop.ShortcutModel",
                    data: [
						{ name: "Agenda", iconCls: "diary48", module: "notepad" },
                        { name: "Maestro Autorizaciones", iconCls: "icon-biometric-authorization48", module: "master-authorization-win" },
                        { name: "Tablas Maestras", iconCls: "icon-master-table48", module: "master-table-win" },
						{ name: "Notas", iconCls: "notepad-shortcut", module: "notepad" },
						{ name: "Ayuda", iconCls: "help48", module: "help-win" }
                    ]
                }),
                wallpaper: "../ux/desktop/wallpapers/Blue-Sencha.jpg",
                wallpaperStretch: true
            }
        )
    },
    getStartConfig: function() {
        var b = this,
        a = b.callParent();
        return Ext.apply(
            a,
            {
                title: "Don Griffin",
                iconCls: "user",
                height: 300,
                toolConfig: {
                    width: 100,
                    items: [
                        {
                            text: "Settings",
                            iconCls: "settings",
                            handler: b.onSettings,
                            scope: b
                        }, "-",
                        {
                            text: "Logout",
                            iconCls: "logout",
                            handler: b.onLogout,
                            scope: b
                        }
                    ]
                }
            }
        )
    },
    getTaskbarConfig: function() {
        var a = this.callParent();
        return Ext.apply(
            a, 
            {
                quickStart: [
                    {
                        name: "Accordion Window",
                        iconCls: "accordion",
                        module: "acc-win"
                    },
                    {
                        name: "Grid Window",
                        iconCls: "icon-grid",
                        module: "grid-win"
                    }
                ],
                trayItems: [
                    {
                        xtype: "trayclock",
                        flex: 1
                    }
                ]
            }
        )
    },
    onLogout: function() {
        Ext.Msg.confirm("Logout", "Are you sure you want to logout?")
    },
    onSettings: function() {
        var a = new MyDesktop.Settings({
        desktop: this.desktop
    }
); a.show()}});

Ext.Loader.setPath({
	'Ext.ux.desktop': 'js',
	MyDesktop: ''
});

Ext.require('MyDesktop.App');

var myDesktopApp;

Ext.onReady(function () {
	myDesktopApp = new MyDesktop.App();
});