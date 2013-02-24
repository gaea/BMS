Ext.onReady(function() {

    var AspPage = 'RegisterRequest.aspx';

    function Request() {
        this.Id_Request = null,
        this.Id_BiometricReader = null,
        this.DateTransaction = null,
        this.DateResponse = null,
        this.State = null,
        this.DescriptionResponse = null,
        this.ResponsibleAnswer = null
    };

    var MasterRowEditor = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
                saveData(
                    AspPage,
                    'Save',
                    'requestProperties',
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
            fields: getProperties(new Request()),
            data: [{}]
        }),
        columns: [
                { text: 'Identificador Solicitud', width: 120, dataIndex: 'Id_Request' },
                { text: 'Identificador Lector', width: 110, dataIndex: 'Id_BiometricReader' },
                { text: 'Identificaci&oacute;n', width: 90, dataIndex: 'DocumentNumber' },
                { text: 'Nombre', width: 170, dataIndex: 'Name', id:'nombre_column_id'},
                { text: 'Desde', width:90, dataIndex: 'DateFrom', editor: new Ext.form.DateField({ allowBlank: false }) },
                { text: '', width: 80, dataIndex: 'TimeFrom', editor: new Ext.form.TimeField({ allowBlank: false }) },
                { text: 'Hasta', width: 90, dataIndex: 'DateTo', editor: new Ext.form.DateField({ allowBlank: false }) },
                { text: '', width: 80, dataIndex: 'TimeTo', editor: new Ext.form.TimeField({ allowBlank: false }) },
                { text: 'Motivo Aprobaci&oacute;n', dataIndex: 'DescriptionResponse', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Persona Aprueba', dataIndex: 'ResponsibleAnswer', editor: new Ext.form.ComboBox({ allowBlank: false }) },
                { text: 'Aprobado?', width: 60, dataIndex: 'State', editor: new Ext.form.field.Checkbox({}) },
        ],
                plugins: [MasterRowEditor],
                autoExpandColumn: 'nombre_column_id',
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditor.cancelEdit();
                    MasterGrid.getStore().insert(0, new Request());
                    MasterRowEditor.startEdit(MasterGrid.getStore().getAt(0), 0);
                    //Ext.Msg.alert('Mensaje', 'Por favor llene los campos obligatorios', function() { }, this);
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
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});