Ext.onReady(function() {

    var auditEntryAspPage = 'ConsultAuditEntry.aspx';

    var aspPageFunctionary = '../master_tables/Functionary.aspx';

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id' },
            { name: 'EntryPerson' },
			{ name: 'DocumentNumberEntryPerson' },
			{ name: 'NameEntryPerson' },
			{ name: 'ChargeEntryPerson' },
			{ name: 'HeadquarterEntryPerson' },
			{ name: 'CostCenterEntryPerson' },
			{ name: 'CompanyEntryPerson' },
            { name: 'RecordDate' },
			{ name: 'BiometricDeviceIP' },
            { name: 'Reason' }
		],
        idProperty: 'Id'
    });
    
    // Modelo para los datos del funcionario
    Ext.define('functionaryInformationModel', {
            extend: 'Ext.data.Model',
            fields: [
			{ name: 'Id_Functionary' },
			{ name: 'Id_BiometricReader' },
			{ name: 'Id_Company' },
			{ name: 'Id_Headquarter' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Name + ' ' + record.data.LastName;
                }
            }
        ],
            idProperty: 'Id_Functionary'
        });
    
        // Store que contiene la informacion de los funcionarios
        var functionaryInformationStore = new Ext.data.Store({
                model: 'functionaryInformationModel',
                remoteSort: false,
                proxy: {
                    type: 'jsonp',
                    url: aspPageFunctionary,
                    reader: { root: 'result', totalProperty: 'total' },
                    simpleSortMode: true,
                    extraParams: { accion: 'List', start: 0, limit: 0 }
                },
                autoLoad: true,
                sorters: [{
                    property: 'FullName',
                    direction: 'ASC'
        }]
                });
            
    var masterStore = new Ext.data.Store({
        pageSize: 20,
        model: 'MasterModel',
        remoteSort: true,
        proxy: {
            type: 'jsonp',
            url: auditEntryAspPage,
            reader: { root: 'Result', totalProperty: 'Total' },
            simpleSortMode: true,
            extraParams: { accion: 'List' }
        },
        sorters: [{ property: 'Id', direction: 'DESC'}]
    });
	
	var master_buscar_array = [
        ['null', 'Pendiente']
    ];
	
	var master_buscar_store = new Ext.data.ArrayStore({
            fields: ['campo', 'display_campo'],
            data: master_buscar_array
        });
		
	var master_buscar_combo = new Ext.form.ComboBox({
            store: master_buscar_store,
            hiddenName: 'campo',
            valueField: 'campo',
            displayField: 'display_campo',
            typeAhead: true,
            width: 150,
            mode: 'local',
            forceSelection: true,
            triggerAction: 'all',
            emptyText: 'Seleccione un campo',
            selectOnFocus: true
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
			Ext.create('Ext.grid.RowNumberer'),
			{ header: "Foto", width: 55, dataIndex: 'DocumentNumberEntryPerson', renderer: set_photo },
            /*{ header: 'Identificador', width: 80, dataIndex: 'Id' },
            { header: 'Persona que Ingresa',
                width: 250,
                dataIndex: 'EntryPerson',
                renderer: function(val, meta, rec) {
                    return getValueFromStore(val, meta, rec, funcionario_combo.getStore(), 'Id_Person', 'FullName');
                }
            },*/
			{ header: 'Documento Identificaci&oacute;n', width: 170, dataIndex: 'DocumentNumberEntryPerson' },
			{ header: 'Nombre Persona Ingresa', width: 200, dataIndex: 'NameEntryPerson' },
			{ header: 'Observaciones', width: 200, id: 'reason_column_id', dataIndex: 'Reason', renderer: cellRenderer },
			{ header: 'Cargo', width: 120, dataIndex: 'ChargeEntryPerson', hidden: true },
			{ header: 'Sede', width: 120, dataIndex: 'HeadquarterEntryPerson', hidden: true },
			{ header: 'Centro de Costo', width: 180, dataIndex: 'CostCenterEntryPerson', hidden: true },
			{ header: 'Empresa', width: 160, dataIndex: 'CompanyEntryPerson', hidden: true },
            { header: 'Fecha de Registro', width: 170, dataIndex: 'RecordDate', renderer: fixDate },
            { header: 'Dispositivo Biom&eacute;trico', width: 120, dataIndex: 'BiometricDeviceIP', hidden: true }
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
			'->',
			{
                xtype: 'label',
                html: 'B&uacute;squeda:'
            }, master_buscar_combo,
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
				if(master_buscar_combo.getValue() == null || master_buscar_combo.getValue() == ''){
						Ext.Msg.alert('Mensaje', 'Por favor selecciona un campo para realizar la b&uacute;squeda');
					}
					else
					{
						
					}
                }
            }
			
		],
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