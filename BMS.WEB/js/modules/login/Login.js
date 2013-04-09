var aspPageLogin = 'Login.aspx';


var login = new Ext.FormPanel({
    frame: false,
    border: false,
    width: 300,
    height: 90,
    scroll: false,
    bodyStyle: 'padding:0px; background-color:#F2F2F2;',
    autoScroll: true, 
    defaults: { xtype: 'textfield', anchor: '100%' },
    items: [
		{
		    name: 'user',
		    //hideLabel: true,
		    labelWidth: 65,
		    fieldLabel: 'Usuario',
		    //emptyText: 'Usuario',
		    listeners: {
		        scope: this,
		        specialkey: function(f, e) {
		            if (e.getKey() == e.ENTER) {
		                autenticar();
		            }
		        }
		    }
		},
		{
		    name: 'password',
		    //hideLabel: true,
		    labelWidth: 65,
		    fieldLabel: 'Password',
		    inputType: 'password',
		    //emptyText: 'Password',
		    listeners: {
		        scope: this,
		        specialkey: function(f, e) {
		            if (e.getKey() == e.ENTER) {
		                autenticar();
		            }
		        }
		    }
		}
	],
    buttons: [
		{ text: 'Ingresar', iconCls: 'admin', handler: autenticar }
	],
	renderTo: 'autenticacion'
});

function autenticar() {
    saveData(
        aspPageLogin,
        'Login',
        'objProperties',
        login.getForm().getFieldValues(),
		function(data) {
		    if (data != null) {
		        window.location = data.url;
		    }
		},
		function() { }
    );
}