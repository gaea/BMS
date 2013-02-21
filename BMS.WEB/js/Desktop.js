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
        "MyDesktop.BiometricAuthorization",
        "MyDesktop.MasterTables",
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
            new MyDesktop.BiometricAuthorization(),
            new MyDesktop.MasterTables()
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
                        { name: "Grid Window", iconCls: "grid-shortcut", module: "grid-win" },
                        { name: "Accordion Window", iconCls: "accordion-shortcut", module: "acc-win" },
                        { name: "Notepad", iconCls: "notepad-shortcut", module: "notepad" },
                        { name: "System Status", iconCls: "cpu-shortcut", module: "systemstatus" },
                        { name: "Biometric Autorization", iconCls: "icon-biometric-authorization48", module: "authorization-win" },
                        { name: "Master Tables", iconCls: "icon-master-table48", module: "master-table-win" }
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