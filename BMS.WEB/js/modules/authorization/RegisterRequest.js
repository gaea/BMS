Ext.onReady(function() {

    var AspPage = 'RegisterRequest.aspx';

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Authorization' },
            { name: 'Id_PersonEntry' },
            { name: 'Authorized' },
            { name: 'StartDate' },
            { name: 'EndDate' },
            { name: 'Id_PersonAuthorizing' },
            { name: 'Id_EntryType' },
            { name: 'Reason' }
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
            reader: { root: 'Result', totalProperty: 'Total' },
            simpleSortMode: true,
            extraParams: { accion: 'List' }
        },
        sorters: [{ property: 'StartDate', direction: 'ASC'}]
    });

    function fixDate(val, meta, rec) {
        return val != '' && val != null ? Ext.Date.format(Ext.Date.parse(val, "MS"), 'Y/m/d - H:i:s') : '';
    }

    function fixPendingAuthorization(val, meta, rec) {
        return 'Pendiente'; /*
        if (val == null) { return 'Pendiente'; }
        if (val == true) { return 'Aprobado'; }
        if (val == false) { return 'Rechazado'; }*/
    }

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
            { header: 'Identificador Solicitud', width: 120, dataIndex: 'Id_Authorization' },
            { header: 'Persona que ingresa', width: 200, dataIndex: 'Id_PersonEntry' },
        //{ header: 'Nombre', width: 170, dataIndex: 'Id_PersonEntry' },
            {header: 'Desde', width: 140, dataIndex: 'StartDate', renderer: fixDate },
            { header: 'Hasta', width: 140, dataIndex: 'EndDate', renderer: fixDate },
            { header: 'Motivo Aprobaci&oacute;n', width: 150, id: 'reason_column_id', dataIndex: 'Reason' },
            { header: 'Persona Aprueba', width: 200, dataIndex: 'Id_PersonAuthorizing' },
            { header: 'Aprobado?', width: 80, dataIndex: 'Authorized', renderer: fixPendingAuthorization },
        ],
        autoExpandColumn: 'reason_column_id',
        bbar: new Ext.PagingToolbar({
            pageSize: 20,
            store: masterStore,
            displayInfo: true,
            displayMsg: 'Registros {0} - {1} de {2}',
            emptyMsg: "No hay registros"
        }),
        tbar: [
        {
            text: 'Aprobar',
            iconCls: 'acept',
            handler: function() {
                var records = MasterGrid.getSelectionModel().getSelection();
                var Id_Authorization = records[0].get('Id_Authorization');
                uploadData(
                    AspPage,
                    'Save',
                    { Id_Authorization: Id_Authorization },
                    function(data) {
                        Ext.Msg.alert('Mensaje', data.Message, function() { masterStore.load(); }, this);
                    },
                    function(data) { }
                );
            }
        }
    ],
        renderTo: Ext.getBody()
    });

    masterStore.load();

    var task = Ext.TaskManager.start({
        run: function() {
            masterStore.load();
        },
        interval: 30000
    });
});