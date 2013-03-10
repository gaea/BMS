Ext.onReady(function() {

    var aspPageUser = 'User.aspx';

    function User() {
        this.Id_User = null,
        this.Login = null,
        this.Name = null,
        this.Password = null,
        this.Id_Role = null,
        this.IsActive = null,
        this.DocumentType = null,
        this.DocumentNumber = null,
        this.Address = null,
        this.TelephoneNumber = null,
        this.EmailAddress = null
    };

    var MasterRowEditorUser = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    aspPageUser,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageUser, 'List', "{'start':0,'limit':0}", MasterGridUser.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

    var MasterGridUser = new Ext.grid.GridPanel({
        frame: false,
        border: true,
        width: Ext.getBody().getViewSize().width,
        height: Ext.getBody().getViewSize().height,
        monitorResize: true,
        stripeRows: true,
        columnLines: true,
        stateful: true,
        stateId: 'grid',
        store: ({
            fields: getProperties(new User()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_User' },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'No. Identificaci&oacute;n', dataIndex: 'DocumentNumber', editor: new Ext.form.TextField() },
                { text: 'Usuario', dataIndex: 'Login', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Password', dataIndex: 'Password', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber', editor: new Ext.form.TextField({}) },
                { text: 'Direcci&oacute;n', dataIndex: 'Address', editor: new Ext.form.TextField({}) },
                { text: 'Rol', dataIndex: 'Id_Role', editor: new Ext.form.TextField({}) },
                { text: 'Tipo Documento', dataIndex: 'DocumentType', editor: new Ext.form.TextField({}) },
                { text: 'Activo?', dataIndex: 'IsActive', editor: new Ext.form.field.Checkbox({}) }
        ],
        plugins: [MasterRowEditorUser],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorUser.cancelEdit();
                    MasterGridUser.getStore().insert(0, new User());
                    MasterRowEditorUser.startEdit(MasterGridUser.getStore().getAt(0), 0);
                    //Ext.Msg.alert('Mensaje', 'Por favor llene los campos obligatorios', function() { }, this);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGridUser.getSelectionModel().getSelection();
                    MasterRowEditorUser.cancelEdit();
                    MasterRowEditorUser.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGridUser.getSelectionModel().getSelection();
                    
					deleteData(
                        aspPageUser,
                        'Delete',
                        'Id_User', 
                        records[0].get('Id_User'),
                        function(data) {
                            loadData(aspPageUser, 'List', "{'start':0,'limit':0}", MasterGridUser.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageUser, 'List', "{'start':0,'limit':0}", MasterGridUser.getStore(), null, null);
});