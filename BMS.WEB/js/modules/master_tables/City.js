Ext.onReady(function() {

    var AspPage = 'City.aspx';

    function City() {
        this.Id_City = null,
        this.Name = null,
		this.Id_Department = null,
		this.DaneCode = null
    };

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                saveData(
                    AspPage,
                    'Save',
                    'cityProperties',
                    e.newValues,
                    function(data) {
                        loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });
	
	var departamento_store = new Ext.data.Store({
        fields: [{ name: 'Id_Department' }, { name: 'Name'}],
        data: []
    });

	 var departamento_combo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_departamento_combo',
        mode: 'local',
        triggerAction: 'all',
        forceSelection: true,
        editable: false,
        name: 'Id_Department',
        displayField: 'Name',
        valueField: 'Id_Department',
        queryMode: 'local',
        store: departamento_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

	loadCombo(AspPage, 'GetDepartment', "{'start':0,'limit':0}", departamento_store, departamento_combo);
	
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
            fields: getProperties(new City()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_City' },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Departamento', dataIndex: 'Id_Department', editor: departamento_combo },
				{ text: 'C&oacute;digo Dane', dataIndex: 'DaneCode', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 75, minText: 'Texto de ejemplo' }) }
        ],
        plugins: [MasterRowEditor],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new City());
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
                        'Id_City', 
                        records[0].get('Id_City'),
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