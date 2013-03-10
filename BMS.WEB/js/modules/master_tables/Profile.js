Ext.onReady(function() {

    var aspPageProfile = 'Profile.aspx';

    function Profile() {
        this.Id_Profile = null,
        this.Description = null,
        this.Id_User = null,
        this.DateCreateRegistration = null,
        this.Id_UserModifyRegistration = null,
        this.DateModifyRegistration = null
    };

    var MasterRowEditorProfile = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                delete e.newValues[''];
				
				saveData(
                    aspPageProfile,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageProfile, 'List', "{'start':0,'limit':0}", MasterGridProfile.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

    var MasterGridProfile = new Ext.grid.GridPanel({
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
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Profile' },
                { text: 'Nombre', dataIndex: 'Description', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Identificador Usuario', dataIndex: 'Id_User', editor: new Ext.form.TextField({ allowBlank: false }) }
        ],
        plugins: [MasterRowEditorProfile],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorProfile.cancelEdit();
                    MasterGridProfile.getStore().insert(0, new Profile());
                    MasterRowEditorProfile.startEdit(MasterGridProfile.getStore().getAt(0), 0);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGridProfile.getSelectionModel().getSelection();
                    MasterRowEditorProfile.cancelEdit();
                    MasterRowEditorProfile.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGridProfile.getSelectionModel().getSelection();

                    deleteData(
                        aspPageProfile,
                        'Delete',
                        'Id_Profile', 
                        records[0].get('Id_Profile'),
                        function(data) {
                            loadData(aspPageProfile, 'List', "{'start':0,'limit':0}", MasterGridProfile.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageProfile, 'List', "{'start':0,'limit':0}", MasterGridProfile.getStore(), null, null);
});