Ext.onReady(function() {

    var aspPageDependency = 'Dependency.aspx';

    function Dependency() {
        this.Id_Dependency = null,
        this.Name = null,
		this.DependencyClass = null,
		this.UserCreateRegistration = null,
		this.DateCreateRegistration = null,
		this.UserModifyRegistration = null,
		this.DateModifyRegistration = null,
		this.Id_Company = null
    };

    var MasterRowEditorDepartment = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    aspPageDependency,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageDependency, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
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
            fields: getProperties(new Dependency()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Dependency' },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Clase de Dependencia', dataIndex: 'DependencyClass', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Empresa', dataIndex: 'Id_Company', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) },
				
        ],
        plugins: [MasterRowEditorDepartment],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorDepartment.cancelEdit();
                    MasterGridDepartment.getStore().insert(0, new Dependency());
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
                        aspPageDependency,
                        'Delete',
                        'Id_Dependency',
                        records[0].get('Id_Dependency'),
                        function(data) {
                            loadData(aspPageDependency, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageDependency, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
});