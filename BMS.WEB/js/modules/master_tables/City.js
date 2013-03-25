Ext.onReady(function() {

    var AspPageCity = 'City.aspx';

    function City() {
        this.Id_City = null,
        this.Name = null,
		this.Id_Department = null,
		this.DaneCode = null
    };

    var masterRowEditorCity = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    AspPageCity,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(AspPageCity, 'List', "{'start':0,'limit':0}", masterGridCombo.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });
	
	var departmentStore = new Ext.data.Store({
        fields: [{ name: 'Id_Department' }, { name: 'Name'}],
        data: []
    });

	 var departmentCombo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_departmentCombo',
        mode: 'local',
        triggerAction: 'all',
        forceSelection: true,
        editable: false,
        name: 'Id_Department',
        displayField: 'Name',
        valueField: 'Id_Department',
        queryMode: 'local',
        store: departmentStore,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

	loadCombo(AspPageCity, 'GetDepartment', "{'start':0,'limit':0}", departmentStore, departmentCombo);
	
    var masterGridCombo = new Ext.grid.GridPanel({
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
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 150, minText: 'Texto de ejemplo' }) },
				{ text: 'Departamento', dataIndex: 'Id_Department', renderer: function(val, meta, rec) 
					{
						return getValueFromStore(val, meta, rec, departmentStore, 'Id_Department', 'Name');
					} , editor: departmentCombo
				},
				{ text: 'C&oacute;digo Dane', dataIndex: 'DaneCode', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 75, minText: 'Texto de ejemplo' }) }
        ],
        plugins: [masterRowEditorCity],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    masterRowEditorCity.cancelEdit();
                    masterGridCombo.getStore().insert(0, new City());
                    masterRowEditorCity.startEdit(masterGridCombo.getStore().getAt(0), 0);                   
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = masterGridCombo.getSelectionModel().getSelection();
                    masterRowEditorCity.cancelEdit();
                    masterRowEditorCity.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = masterGridCombo.getSelectionModel().getSelection();
                
                    deleteData(
                        AspPageCity,
                        'Delete',
                        'Id_City', 
                        records[0].get('Id_City'),
                        function(data) {
                            loadData(AspPageCity, 'List', "{'start':0,'limit':0}", masterGridCombo.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(AspPageCity, 'List', "{'start':0,'limit':0}", masterGridCombo.getStore(), null, null);
	
});