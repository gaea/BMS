Ext.onReady(function() {

    var aspPageCostCenter = 'CostCenter.aspx';

    function CostCenter() {
        this.Id_CostCenter = null,
        this.Id_Dependency = null,
		this.Name = null
    };

    var MasterRowEditorDepartment = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    aspPageCostCenter,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageCostCenter, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
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
            fields: getProperties(new CostCenter()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_CostCenter' },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Dependencia', dataIndex: 'Id_Dependency', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) }
				        
        ],
        plugins: [MasterRowEditorDepartment],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorDepartment.cancelEdit();
                    MasterGridDepartment.getStore().insert(0, new CostCenter());
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
					
                    deleteData(
                        aspPageCostCenter,
                        'Delete',
                        'Id_CostCenter',
                        records[0].get('Id_CostCenter'),
                        function(data) {
                            loadData(aspPageCostCenter, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageCostCenter, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
});