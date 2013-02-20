Ext.onReady(function() {

    var AspPage = 'Headquarter.aspx';

    function Headquarter() {
        this.Id_Headquarter = null,
        this.Description = null
    };

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                saveData(
                    AspPage,
                    'Save',
                    'HeadquarterProperties',
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
        title: 'Sedes',
        columnLines: true,
		frame: true,
		width: 500,
		height: 300,
        //height: Ext.getBody().getViewSize().height,
        store: ({
            fields: getProperties(new Headquarter()),
            data: [{}]
        }),
        columns: [
                { text: 'Identificador', dataIndex: 'Id_Headquarter' },
                { text: 'Descripci&oacute;n', dataIndex: 'Description', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false,  labelWidth: 75, minText: 'Texto de ejemplo' }) }
        ],
        plugins: [MasterRowEditor],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'adicionar',
                handler: function() {
                    MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new Headquarter());
                    MasterRowEditor.startEdit(MasterGrid.getStore().getAt(0), 0);                   
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modificar',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    MasterRowEditor.cancelEdit();
                    MasterRowEditor.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'eliminar  ',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(
                        AspPage,
                        'Delete',
                        'Id_Headquarter', 
                        records[0].get('Id_Headquarter'),
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