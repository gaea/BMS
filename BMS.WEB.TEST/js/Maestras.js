/*
private int id_User;
private string login;
private string name;
private string password;
private int id_Role;
private bool isActive;
private int documentType;
private int documentNumber;
private string address;
private string telephoneNumber;
private string emailAddress;
private string userCreateRegistration;
private DateTime dateCreateRegistration;
private string userModifyRegistration;
private DateTime dateModifyRegistration;
*/

var Users = {
    Id_User: null,
    Login: null,
    Name: null,
    Password: null,
    EmailAddress: null,
    Address: null
};

Ext.onReady(function() {
    var MasterPanel = new Ext.FormPanel({
        title: 'Master Panel',
        defaults: { xtype: 'textfield', anchor: '100%' },
        bodyStyle: 'padding:10px',
        items: [

            { fieldLabel: 'Id Usuario', name: 'Id_User' },
            { fieldLabel: 'Login', name: 'Login' },
            { fieldLabel: 'Nombre', name: 'Name' },
            { fieldLabel: 'Password', name: 'Password' },
            { fieldLabel: 'Email', name: 'EmailAddress' },
            { fieldLabel: 'Direcci&oacute;n', name: 'Address' }
        ],
        buttons: [
            {
                text: 'Guardar',
                handler: function() {
                    if (MasterPanel.getForm().isValid()) {
                        upload(
                            'Test.aspx',
                            'Save',
                            "{'userProperties':'" + Ext.JSON.encode(MasterPanel.getForm().getFieldValues()) + "'}",
                            function(data) {
                                Ext.Msg.alert('Mensaje', data.Message, function() { }, this);
                            },
                            function() { }
                        );
                    }
                    else {
                        Ext.Msg.alert('Mensaje', 'Por favor llene los campos obligatorios', function() { }, this);
                    }
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                objectProperties(e.newValues);

                upload(
                    'Test.aspx',
                    'Save',
                    "{'userProperties':'" + Ext.JSON.encode(e.newValues) + "'}",
                    function(data) {
                        Ext.Msg.alert('Mensaje', data.Message, function() { }, this);
                    },
                    function() { }
                );

                //userProperties:Ext.JSON.e.record.getAssociatedData()
            }
        }
    });

    var MasterGrid = new Ext.grid.GridPanel({
        title: 'Lista de usuarios',
        store: ({
            fields: ['Id_User', 'Name', 'Login', 'Password'],
            data: [{}]
        }),
        height: 300,
        tbar: [
        {
            text: 'Adicionar',
            handler: function() {
                MasterRowEditor.cancelEdit();
                MasterGrid.getStore().insert(0, {
                    Id_User: '',
                    Name: '',
                    Login: '',
                    Password: ''
                });

                MasterRowEditor.startEdit(MasterGrid.getStore().getAt(0), 0);
            }
        }, '-',
        {
            text: 'Modificar',
            handler: function() {

            }
        }, '-',
        {
            text: 'Eliminar',
            handler: function() {
                var records = MasterGrid.getSelectionModel().getSelection();
                upload(
                    'Test.aspx',
                    'Delete',
                    "{ 'Id_User': '" + records[0].get('Id_User') + "' }",
                    function(data) {
                        Ext.Msg.alert('Mensaje', data.Message, function() { }, this);
                        loadData();
                    },
                    function() { }
                );
            }
        }
    ],
        plugins: [MasterRowEditor],
        columns: [
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField() },
                { text: 'Usuario', dataIndex: 'Login', editor: new Ext.form.TextField() },
                { text: 'Password', dataIndex: 'Password', editor: new Ext.form.TextField() }
            ],
        renderTo: Ext.getBody()
    });

    loadData();

    function loadData() {
        upload(
        'Test.aspx',
        'List',
        "{'start':0,'limit':0}",
        function(data) {
            MasterGrid.getStore().loadData(data);
        },
        function() { }
    );
    }

});

function upload(url, webMethod, params, functionSuccess, functionFailure) {
    Ext.Ajax.request({
        method: 'POST',
        url: url + '/' + webMethod,
        jsonData: params,
        headers: { 'Content-Type': 'application/json;charset=utf-8' },
        waitTitle: 'Enviando',
        waitMsg: 'Enviando datos...',
        timeout: 180000, // tiempo de espera al servidor
        success: function(response) {
            obj = Ext.JSON.decode(response.responseText);
            data = Ext.JSON.decode(obj.d);
            functionSuccess(data);
        },
        failure: function(response, opts) {
            obj = Ext.JSON.decode(response.responseText);
            Ext.Msg.confirm('Error: ' + response.status, obj.Message, functionFailure());
        }
    });
}

function objectProperties(obj) {
    for (inx in obj) {
        console.log("PROPIEDAD: {" + inx + "} <------> VALOR: {" + obj[inx] + "}.");
    }
}