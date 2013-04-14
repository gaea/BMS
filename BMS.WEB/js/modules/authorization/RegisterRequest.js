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

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Authorization' },
            { name: 'Identification' },
            { name: 'Authorized' },
            { name: 'StartDate' },
            { name: 'EndDate' },
            { name: 'Id_PersonAuthorizing' },
            { name: 'Id_AuthorizationType' },
            { name: 'Reason' },
            { name: 'Id_Person' }
			],
        idProperty: 'Id_Authorization'
    });

    var masterStore = new Ext.data.Store({
        pageSize: 20,
        model: 'MasterModel',
        remoteSort: true,
        proxy: {
            type: 'jsonp',
            url: AspPage,
            reader: {
                root: 'Result',
                totalProperty: 'Total'
            },
            simpleSortMode: true,
            extraParams: {
                accion: 'List'
            }
        },
        sorters: [{
            property: 'InitialDate',
            direction: 'ASC'
            }]
    });

    masterStore.load();

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
        store: masterStore,
        columns: [
            { text: 'Identificador Solicitud', width: 120, dataIndex: 'Id_Request' },
            { text: 'Identificador Lector', width: 110, dataIndex: 'Id_BiometricReader' },
            { text: 'Identificaci&oacute;n', width: 90, dataIndex: 'DocumentNumber' },
            { text: 'Nombre', width: 170, dataIndex: 'Name', id: 'nombre_column_id' },
            { text: 'Desde', width: 90, dataIndex: 'DateFrom', editor: new Ext.form.DateField({ allowBlank: false }) },
            { text: '', width: 80, dataIndex: 'TimeFrom', editor: new Ext.form.TimeField({ allowBlank: false }) },
            { text: 'Hasta', width: 90, dataIndex: 'DateTo', editor: new Ext.form.DateField({ allowBlank: false }) },
            { text: '', width: 80, dataIndex: 'TimeTo', editor: new Ext.form.TimeField({ allowBlank: false }) },
            { text: 'Motivo Aprobaci&oacute;n', dataIndex: 'DescriptionResponse', editor: new Ext.form.TextField({ allowBlank: false }) },
            { text: 'Persona Aprueba', dataIndex: 'ResponsibleAnswer', editor: new Ext.form.ComboBox({ allowBlank: false }) },
            { text: 'Aprobado?', width: 60, dataIndex: 'State', editor: new Ext.form.field.Checkbox({}) },
        ],
        plugins: [MasterRowEditor],
        autoExpandColumn: 'nombre_column_id',
        bbar: new Ext.PagingToolbar({
            pageSize: 20,
            store: masterStore  ,
            displayInfo: true,
            displayMsg: 'Registros {0} - {1} de {2}',
            emptyMsg: "No hay registros"
        }),
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
            }, '-',
            {
                text: 'Aceptar',
                iconCls: 'acept',
                handler: function() {

                }
            }
        ],
        renderTo: Ext.getBody()
    });
});