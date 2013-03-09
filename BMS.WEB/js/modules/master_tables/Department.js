Ext.onReady(function() {

    var aspPageDepartment = 'Department.aspx';

    function Department() {
        this.Id_Department = null,
        this.Name = null
    };

    var MasterRowEditorDepartment = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    aspPageDepartment,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageDepartment, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

    var MasterGridDepartment = new Ext.grid.GridPanel({
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
            fields: getProperties(new Department()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Department' },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) }
        ],
        plugins: [MasterRowEditorDepartment],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorDepartment.cancelEdit();
                    MasterGridDepartment.getStore().insert(0, new Department());
                    MasterRowEditorDepartment.startEdit(MasterGridDepartment.getStore().getAt(0), 0);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGridDepartment.getSelectionModel().getSelection();
                    MasterRowEditorDepartment.cancelEdit();
                    MasterRowEditorDepartment.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGridDepartment.getSelectionModel().getSelection();
					delete e.newValues[''];
                    deleteData(
                        aspPageDepartment,
                        'Delete',
                        'Id_Department',
                        records[0].get('Id_Department'),
                        function(data) {
                            loadData(aspPageDepartment, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageDepartment, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
});