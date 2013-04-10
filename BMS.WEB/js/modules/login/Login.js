var aspPageLogin = 'Login.aspx';

var login = new Ext.FormPanel({
    frame: false,
    border: false,
    width: 300,
    height: 90,
    scroll: false,
    bodyStyle: 'padding:0px; background-color:#F2F2F2;',
    autoScroll: true, 
    defaults: { xtype: 'textfield', anchor: '90%' },
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
    /*saveData(
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
    );*/

    Ext.Ajax.request({
        method: 'POST',
        url: aspPageLogin,
        params: {
            accion: 'Login',
            user: login.getForm().getFieldValues().user,
            password: login.getForm().getFieldValues().password
        },
        waitTitle: 'Autenticando',
        waitMsg: 'Enviando datos...',
        timeout: 180000,
        success: function(response) {
            obj = Ext.JSON.decode(response.responseText);

            if (obj.Data.Url != null) {
                window.location = obj.Data.Url;
            }
            else{
                Ext.Msg.alert('Mensaje', obj.Data.Message, function() { }, this);
            }
            
        },
        failure: function(response, opts) {
            
        }
    });
}