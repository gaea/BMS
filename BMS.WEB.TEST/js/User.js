Ext.onReady(function() {

    var AspUserPage = 'User.aspx';

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
                saveData(AspUserPage, 'Save', 'UserProperties', e.newValues);
                loadData(AspUserPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
            }
        }
    });

    var MasterGrid = new Ext.grid.GridPanel({
        title: 'Lista de usuarios',
        columnLines: true,
        height: Ext.getBody().getViewSize().height,
        store: ({
            fields: getProperties(new User()),
            data: [{}]
        }),
        columns: [
                { text: 'Id Usuario', dataIndex: 'Id_User' },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'No. Identificaci&oacute;n', dataIndex: 'DocumentNumber', editor: new Ext.form.TextField() },
                { text: 'Usuario', dataIndex: 'Login', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Password', dataIndex: 'Password', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber', editor: new Ext.form.TextField({}) },
                { text: 'Direcci&oacute;n', dataIndex: 'Address', editor: new Ext.form.TextField({}) },
                { text: 'Role', dataIndex: 'Id_Role', editor: new Ext.form.TextField({}) },
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

                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'eliminar  ',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(AspUserPage, 'Delete', 'Id_User', records[0].get('Id_User'));
                    loadData(AspUserPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(AspUserPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});