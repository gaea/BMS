Ext.onReady(function() {

    function User () {
        this.Id_User = null,
        this.Login = null,
        this.Name = null,
        this.Password =  null,
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
                saveData('Test.aspx', 'Save', 'UserProperties', e.newValues);
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
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField() },
                { text: 'Usuario', dataIndex: 'Login', editor: new Ext.form.TextField() },
                { text: 'Password', dataIndex: 'Password', editor: new Ext.form.TextField() }
        ],
        plugins: [MasterRowEditor],
        tbar: [
            {
                text: 'Adicionar',
                handler: function() {
                MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new User());
                    MasterRowEditor.startEdit(MasterGrid.getStore().getAt(0), 0);
                    //Ext.Msg.alert('Mensaje', 'Por favor llene los campos obligatorios', function() { }, this);
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
        renderTo: Ext.getBody()
    });

    loadData('Test.aspx', 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});