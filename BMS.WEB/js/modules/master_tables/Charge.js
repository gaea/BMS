Ext.onReady(function() {

    var aspPageCharge = 'Charge.aspx';

    function Charge() {
        this.Id_Charge = null,
        this.Name = null,
        this.Id_UserCreateRegistration      = null,
        this.DateCreateRegistration         = null,
        this.Id_UserModifyRegistration      = null,
        this.DateModifyRegistration         = null
    };

    var masterRowEditorCharge = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    aspPageCharge,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageCharge, 'List', "{'start':0,'limit':0}", masterGridCombo.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

	
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
            fields: getProperties(new Charge()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Charge' },
                { text: 'Nombre', dataIndex: 'Name', width: 150, editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 75, minText: 'Texto de ejemplo' }) }
        ],
        plugins: [masterRowEditorCharge],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    masterRowEditorCharge.cancelEdit();
                    masterGridCombo.getStore().insert(0, new Charge());
                    masterRowEditorCharge.startEdit(masterGridCombo.getStore().getAt(0), 0);                   
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = masterGridCombo.getSelectionModel().getSelection();
                    masterRowEditorCharge.cancelEdit();
                    masterRowEditorCharge.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = masterGridCombo.getSelectionModel().getSelection();
                    deleteData(
                        aspPageCharge,
                        'Delete',
                        'Id_Charge', 
                        records[0].get('Id_Charge'),
                        function(data) {
                            loadData(aspPageCharge, 'List', "{'start':0,'limit':0}", masterGridCombo.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageCharge, 'List', "{'start':0,'limit':0}", masterGridCombo.getStore(), null, null);
	
});