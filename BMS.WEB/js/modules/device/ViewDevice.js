Ext.onReady(function() {

    var AspPage = 'ViewDevice.aspx';

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id' },
            { name: 'BiometricDeviceIP' },
            { name: 'State' },
            { name: 'RecordDate' },
            { name: 'Observations' }
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

    var deviceCombo = new Ext.form.field.ComboBox({
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
			Ext.create('Ext.grid.RowNumberer'),
			{ width: 25, dataIndex: 'State', renderer: imageByStateRenderer },
            { header: 'Dispositivo Biom&eacute;trico', width: 140, dataIndex: 'BiometricDeviceIP'},
            { header: 'Estado', width: 100, dataIndex: 'State'},
            { header: 'Fecha de Registro', width: 170, dataIndex: 'RecordDate', renderer: fixDate },
            { header: 'Observaciones', width: 200, dataIndex: 'Observations'}
            
        ],
        autoExpandColumn: 'reason_column_id',
        bbar: new Ext.PagingToolbar({
            pageSize: 20,
            store: masterStore,
            displayInfo: true,
            displayMsg: 'Registros {0} - {1} de {2}',
            emptyMsg: "No hay registros"
        }),
        renderTo: Ext.getBody()
    });

    var task = null;

    loadCombo('../authorization/RegisterAuthorization.aspx',
        'GetPerson',
        "{'start':0,'limit':0}",
        masterStore,
        deviceCombo,
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
    
    function imageByStateRenderer(state){
		var imageAndState = '';
		switch (state){
		case 'Activo':
			imageAndState = '<img src="../../images/icons/acept.png" align="center" width=16 heigth=16/>';  
	        break;
		case 'Inactivo':
			imageAndState = '<img src="../../images/icons/cancelar.png" align="center" width=16 heigth=16/>';  
	        break;
		}
		return imageAndState;
	}
});