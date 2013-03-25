Ext.onReady(function() {

    var aspPageHeadquarter = 'Headquarter.aspx';

    function Headquarter() {
        this.Id_Headquarter = null,
        this.Description = null
    };

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                saveData(
                    aspPageHeadquarter,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageHeadquarter, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
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
            fields: getProperties(new Headquarter()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Headquarter' },
                { text: 'Descripci&oacute;n', dataIndex: 'Description', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 75, minText: 'Texto de ejemplo' }) }
        ],
        plugins: [MasterRowEditor],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new Headquarter());
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
                        aspPageHeadquarter,
                        'Delete',
                        'Id_Headquarter', 
                        records[0].get('Id_Headquarter'),
                        function(data) {
                            loadData(aspPageHeadquarter, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageHeadquarter, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});