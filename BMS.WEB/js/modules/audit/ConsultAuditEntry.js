Ext.onReady(function() {

    var AspPage = 'ConsultAuditEntry.aspx';

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id' },
            { name: 'EntryPerson' },
            { name: 'RecordDate' },
            { name: 'Reason' }
		],
        idProperty: 'Id'
    });

    var masterStore = new Ext.data.Store({
        pageSize: 20,
        model: 'MasterModel',
        remoteSort: true,
        proxy: {
            type: 'jsonp',
            url: AspPage,
            reader: { root: 'Result', totalProperty: 'Total' },
            simpleSortMode: true,
            extraParams: { accion: 'List' }
        },
        sorters: [{ property: 'Id', direction: 'DESC'}]
    });

    function fixDate(val, meta, rec) {
        return val != '' && val != null ? Ext.Date.format(Ext.Date.parse(val, "MS"), 'Y/m/d H:i:s') : '';
    }

    var funcionario_combo = new Ext.form.field.ComboBox({
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        fieldLabel: 'Nombre del Visitante',
        listWidth: 350,
        labelWidth: 120,
        forceSelection: true,
        name: 'Id_Person',
        displayField: 'FullName',
        valueField: 'Id_Person',
        queryMode: 'local',
        allowBlank: false,
        typeAhead: true,
        store: new Ext.data.Store({
            fields: [
                { name: 'Id_Person' },
                { name: 'Name' },
                { name: 'LastName' },
                { name: 'Photo' },
                { name: 'FullName',
                    convert: function(v, record) {
                        return record.data.Id_Person + ' - ' + record.data.Name + ' ' + record.data.LastName;
                    }
                }
            ],
            data: []
        }),
        listeners: {
            select: function(combo, arrRec, obj) {

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
        store: masterStore,
        columns: [
            { header: 'Identificador', width: 120, dataIndex: 'Id' },
            { header: 'Persona que Ingresa',
                width: 250,
                dataIndex: 'EntryPerson',
                renderer: function(val, meta, rec) {
                    return getValueFromStore(val, meta, rec, funcionario_combo.getStore(), 'Id_Person', 'FullName');
                }
            },
            { header: 'Fecha de registro', width: 110, dataIndex: 'RecordDate', renderer: fixDate },
            { header: 'Motivo de ingreso', width: 150, id: 'reason_column_id', dataIndex: 'Reason' }
        ],
        autoExpandColumn: 'reason_column_id',
        bbar: new Ext.PagingToolbar({
            pageSize: 20,
            store: masterStore,
            displayInfo: true,
            displayMsg: 'Registros {0} - {1} de {2}',
            emptyMsg: "No hay registros"
        }),
        tbar: [ ],
        renderTo: Ext.getBody()
    });

    var task = null;

    loadCombo('../authorization/RegisterAuthorization.aspx',
        'GetPerson',
        "{'start':0,'limit':0}",
        funcionario_combo.getStore(),
        funcionario_combo,
        function() {
            task = Ext.TaskManager.start({
                run: function() {
                    masterStore.load();
                },
                interval: 30000
            });
        },
        function() { }
    );
});