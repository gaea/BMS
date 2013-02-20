Ext.onReady(function() {

    var AspPage = 'User.aspx';

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

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                saveData(
                    AspPage,
                    'Save',
                    'UserProperties',
                    e.newValues,
                    function(data) {
                        loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

    var MasterGrid = new Ext.grid.GridPanel({
        title: 'Usuarios',
        columnLines: true,
        height: Ext.getBody().getViewSize().height,
        store: ({
            fields: getProperties(new User()),
            data: [{}]
        }),
        columns: [
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
        plugins: [MasterRowEditor],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'adicionar',
                handler: function() {
                    MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new User());
                    MasterRowEditor.startEdit(MasterGrid.getStore().getAt(0), 0);
                    //Ext.Msg.alert('Mensaje', 'Por favor llene los campos obligatorios', function() { }, this);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modificar',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    MasterRowEditor.cancelEdit();
                    MasterRowEditor.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'eliminar  ',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(
                        AspPage,
                        'Delete',
                        'Id_User', 
                        records[0].get('Id_User'),
                        function(data) {
                            loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});