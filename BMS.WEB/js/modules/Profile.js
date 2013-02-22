Ext.onReady(function() {

    var AspPage = 'Profile.aspx';

    function Profile() {
        this.Id_Profile = null,
        this.Description = null,
        this.Id_User = null,
        this.DateCreateRegistration = null,
        this.Id_UserModifyRegistration = null,
        this.DateModifyRegistration = null
    };

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                saveData(
                    AspPage,
                    'Save',
                    'profileProperties',
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
            fields: getProperties(new Profile()),
            data: [{}]
        }),
        columns: [
                { text: 'Identificador', dataIndex: 'Id_Profile' },
                { text: 'Nombre', dataIndex: 'Description', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Identificador Usuario', dataIndex: 'Id_User', editor: new Ext.form.TextField({ allowBlank: false }) }
        ],
        plugins: [MasterRowEditor],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new Profile());
                    MasterRowEditor.startEdit(MasterGrid.getStore().getAt(0), 0);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    MasterRowEditor.cancelEdit();
                    MasterRowEditor.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(
                        AspPage,
                        'Delete',
                        'Id_Profile', 
                        records[0].get('Id_Profile'),
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