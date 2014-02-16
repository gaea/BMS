Ext.onReady(function() {

    var AspPage = 'RegisterRequest.aspx';
    
    var aspPageFunctionary = '../master_tables/Functionary.aspx';

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Authorization' },
            { name: 'Id_PersonEntry' },
			{ name: 'DocumentNumberEntryPerson' },
			{ name: 'NameEntryPerson' },
			{ name: 'ChargeEntryPerson' },
			{ name: 'HeadquarterEntryPerson' },
			{ name: 'CostCenterEntryPerson' },
			{ name: 'CompanyEntryPerson' },
            { name: 'Authorized' },
            { name: 'StartDate' },
            { name: 'EndDate' },
            { name: 'RecordDate' },
            { name: 'Id_PersonAuthorizing' },
            { name: 'Id_EntryType' },
			{ name: 'BiometricDeviceIP' },
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
            extraParams: { accion: 'List', field: 'Authorized', value: 'null' }
        },
        sorters: [{ property: 'StartDate', direction: 'ASC'}]
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


    function fixDateTime(val, meta, rec) {
        return val != '' && val != null ? Ext.Date.format(Ext.Date.parse(val, "MS"), 'Y/m/d H:i:s') : '';
    }
    function fixDate(val, meta, rec) {
        return val != '' && val != null ? Ext.Date.format(Ext.Date.parse(val, "MS"), 'Y/m/d') : '';
    }

    function fixHour(val, meta, rec) {
        return val != '' && val != null ? Ext.Date.format(Ext.Date.parse(val, "MS"), 'H:i:s') : '';
    }

    var masterRowEditor = new Ext.grid.plugin.RowEditing({
        errorSummary: false,
        listeners: {
            validateedit: function(editor, e, eOpts) {
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
    });

    function fixPendingAuthorization(val, meta, rec) {
        var estado = '';

        switch (val) {
            case true:
                estado = 'Aprobado';
                break;
            case false:
                estado = 'Rechazado';
                break;
            case null:
                estado = 'Pendiente';
                break;
        }

        return estado;
    }

	function imageByStateRenderer(state){
		var imageAndState = '';
		switch (state){
		case true:
			imageAndState = '<img src="../../images/icons/acept.png" align="center" width=16 heigth=16/>';  
	        break;
		case false:
			imageAndState = '<img src="../../images/icons/cancelar.png" align="center" width=16 heigth=16/>';  
	        break;
		case null:
			imageAndState = '<img src="../../images/icons/tiempo.png" align="center" width=16 heigth=16/>';  
	        break;
		}
		return imageAndState;
	}
	
    var ingreso_funcionarios_funcionario_combo = new Ext.form.field.ComboBox({
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

    Ext.define('functionaryModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Functionary' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Id_Functionary + ' - ' + record.data.Name + ' ' + record.data.LastName;
                }
            }
        ],
        idProperty: 'Id_Functionary'
    });

    var functionaryStore = new Ext.data.Store({
        model: 'functionaryModel',
        remoteSort: false,
        proxy: {
            type: 'jsonp',
            url: '../master_tables/Functionary.aspx',
            reader: { root: 'result', totalProperty: 'total' },
            simpleSortMode: true,
            extraParams: { accion: 'List', start: 0, limit: 0 }
        },
        //autoLoad: true,
        sorters: [{
            property: 'FullName',
            direction: 'ASC'
}]
        });

        var ingreso_funcionarios_persona_autoriza_combo = Ext.create('Ext.form.field.ComboBox', {
            mode: 'local',
            triggerAction: 'all',
            labelWidth: 120,
            anchor: '100%',
            fieldLabel: 'Autorizado por',
            forceSelection: true,
            name: 'Id_Functionary',
            displayField: 'FullName',
            valueField: 'Id_Functionary',
            queryMode: 'local',
            typeAhead: true,
            store: functionaryStore,
            allowBlank: false
        });

        var MasterForm = new Ext.FormPanel({
            width: 450,
            //padding: '10',
            bodyStyle: 'padding:10px',
            labelWidth: 200,
            frame: false,
            border: false,
            height: 490,
            items: [
                {
                    xtype: 'textfield',
                    fieldLabel: 'Identificador Solicitud',
                    labelWidth: 120,
                    readOnly: true,
                    name: 'Id_Authorization'
                },
                {
                    xtype: 'textfield',
                    fieldLabel: 'Id Lector',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 50,
                    readOnly: true,
                    name: 'Id_PersonEntry'
                },
                
                {
                    xtype: 'textfield',
                    fieldLabel: 'Nombre del Visitante',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 150,
                    readOnly: true,
                    name: 'NameEntryPerson'
                },
                /*{
                    xtype: 'textfield',
                    fieldLabel: 'Identificaci&oacute;n del Visitante',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 50,
                    name: 'DocumentNumberEntryPerson'
                },
                {
                    xtype: 'textfield',
                    fieldLabel: 'Cargo',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 50,
                    name: 'ChargeEntryPerson'
                },
                {
                    xtype: 'textfield',
                    fieldLabel: 'Empresa',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 150,
                    name: 'CompanyEntryPerson'
                },
                {
                    xtype: 'textfield',
                    fieldLabel: 'Centro de costos',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 50,
                    name: 'CostCenterEntryPerson'
                },
                {
                    xtype: 'textfield',
                    fieldLabel: 'Sede',
                    labelWidth: 120,
                    anchor: '100%',
                    maxLength: 150,
                    name: 'HeadquarterEntryPerson'
                },
                ingreso_funcionarios_persona_autoriza_combo,
                
                {
                    id: 'AuthorizationRecordDate',
                    xtype: 'textfield',
                    fieldLabel: 'Fecha de Registro',
                    labelWidth: 120,
                    readOnly: true,
                    
                    rendererData: fixDateTime,
                    name: 'RecordDate'
                },*/
                {
                    id: 'AuthorizationStartDate',
                    xtype: 'datefield',
                    format: 'Y/m/d',
                    fieldLabel: 'Fecha de Ingreso',
                    labelWidth: 120,
                    name: 'StartDate'
                },
                {
                    id: 'AuthorizationStartHour',
                    xtype: 'timefield',
                    format: 'H:i:s',
                    fieldLabel: 'Hora de Ingreso',
                    labelWidth: 120,
                    name: 'StartHour'
                },
                {
                    id: 'AuthorizationEndDate',
                    xtype: 'datefield',
                    format: 'Y/m/d',
                    fieldLabel: 'Fecha de Salida',
                    labelWidth: 120,
                    name: 'EndDate'
                },
                {
                    id: 'AuthorizationEndHour',
                    xtype: 'timefield',
                    format: 'H:i:s',
                    fieldLabel: 'Hora de Salida',
                    labelWidth: 120,
                    name: 'EndHour'
                },
                {
                    xtype: 'textarea',
                    anchor: '100%',
                    fieldLabel: 'Motivo Aprobaci&oacute;n',
                    name: 'Reason',
                    labelWidth: 120
                }
            ],
            buttons: [
                {
                    text: 'Guardar',
                    iconCls: 'save',
                    handler: function() {
                        saveData(
	                        AspPage,
	                        'Save',
	                        'objProperties',
	                        MasterForm.getForm().getValues(),
	                        function(data) {
	                            masterStore.load();
	                            MasterWindow.hide();
	                            MasterForm.getForm().reset();
	                        },
	                        null
	                    );
                    }
                },
                {
                    text: 'Cancelar',
                    iconCls: 'cancel',
                    handler: function() {
                        MasterWindow.hide();
                        MasterForm.getForm().reset();
                    }
                }
            ]
        });

        var MasterWindow = new Ext.Window({
            title: 'Autorizaciones',
            closeAction: 'hide',
            modal: true,
            items: [
                MasterForm
            ]
        });

        var master_buscar_array = [
        ['null', 'Pendiente'],
        ['true', 'Aprobado'],
        ['false', 'Rechazado']
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
            emptyText: 'Seleccione un estado',
            selectOnFocus: true
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
			{ width: 25, dataIndex: 'Authorized', renderer: imageByStateRenderer },
			{ header: "Foto", width: 55, dataIndex: 'Id_PersonEntry', renderer: set_photo },
            { header: 'Estado', width: 80, dataIndex: 'Authorized', renderer: fixPendingAuthorization },
            { header: 'Id en Lector', width: 90, dataIndex: 'Id_PersonEntry'},
			{ header: "N&uacute;mero Identificaci&oacute;n", width: 150, dataIndex: 'Id_PersonEntry', renderer: 
                function(val, meta, rec) {
			    return getValueFromStore(val, meta, rec, functionaryInformationStore, 'Id_BiometricReader', 'Id_Functionary'); 
			    }
			},
            { header: "Nombre", width: 250, dataIndex: 'Id_PersonEntry', renderer: 
                function(val, meta, rec) {
                return getValueFromStore(val, meta, rec, functionaryInformationStore, 'Id_BiometricReader', 'FullName'); 
			    }
			},
			{ header: 'Fecha de Registro', width: 170, dataIndex: 'RecordDate', renderer: fixDateTime },
            { header: 'Fecha de Ingreso', width: 110, dataIndex: 'StartDate', renderer: fixDate, editor: new Ext.form.field.Date({}), hidden: true},
            { header: 'Hora de Ingreso', width: 110, dataIndex: 'StartDate', renderer: fixHour, editor: new Ext.form.field.Time({}), hidden: true },
            { header: 'Fecha de Salida', width: 110, dataIndex: 'EndDate', renderer: fixDate, editor: new Ext.form.field.Date({}), hidden: true },
            { header: 'Hora de Salida', width: 110, dataIndex: 'EndDate', renderer: fixHour, editor: new Ext.form.field.Time({}), hidden: true },
			{ header: 'Dispositivo Biom&eacute;trico', width: 120, dataIndex: 'BiometricDeviceIP', hidden: true },
            { header: 'Motivo Aprobaci&oacute;n', width: 200, id: 'reason_column_id', dataIndex: 'Reason', editor: new Ext.form.field.Text({}), renderer: cellRenderer },
            { header: 'Persona Aprueba',
                width: 250,
                dataIndex: 'Id_PersonAuthorizing',
                renderer: function(val, meta, rec) {
                    return getValueFromStore(val, meta, rec, ingreso_funcionarios_persona_autoriza_combo.getStore(), 'Id_Functionary', 'FullName');
                }
            }
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
                    if (records[0].get('Authorized') == null) {
                        var Id_Authorization = records[0].get('Id_Authorization');
                        uploadData(
                        AspPage,
                        'Acept',
                        { Id_Authorization: Id_Authorization },
                        function(data) {
                            Ext.Msg.alert('Mensaje', data.Message, function() { masterStore.load(); }, this);
                        },
                        function(data) { }
                    );
                    }
                    else {
                        Ext.Msg.alert('Mensaje', 'No se puede modificar el estado de la autorizaci&oacute;n', function() { masterStore.load(); }, this);
                    }
                }
            }, '-',
            {
                text: 'Rechazar',
                iconCls: 'cancel',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();

                    if (records[0].get('Authorized') == null) {
                        var Id_Authorization = records[0].get('Id_Authorization');
                        uploadData(
                            AspPage,
                            'Rejected',
                            { Id_Authorization: Id_Authorization },
                            function(data) {
                                Ext.Msg.alert('Mensaje', data.Message, function() { masterStore.load(); }, this);
                            },
                            function(data) { }
                        );
                    }
                    else {
                        Ext.Msg.alert('Mensaje', 'No se puede modificar el estado de la autorizaci&oacute;n', function() { masterStore.load(); }, this);
                    }
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
				var records = MasterGrid.getSelectionModel().getSelection();

                    if (records[0].get('Authorized') == null) {
                        if (MasterGrid.getSelectionModel().getSelection().length == 0) {
							Ext.Msg.alert('Mensaje', 'Por favor seleccione un registro');
                    }
                    else {
                        MasterWindow.show();

                        var MasterRecord = MasterGrid.getSelectionModel().getSelection()[0];

                        MasterForm.getForm().loadRecord(MasterRecord)

                        ingreso_funcionarios_funcionario_combo.setValue(parseInt(MasterRecord.get('Id_PersonEntry')));
                        ingreso_funcionarios_persona_autoriza_combo.setValue(MasterRecord.get('Id_PersonAuthorizing'));

                        Ext.getCmp('AuthorizationStartDate').setValue(fixDate(MasterRecord.get('StartDate')));
                        Ext.getCmp('AuthorizationStartHour').setValue(fixHour(MasterRecord.get('StartDate')));
                        Ext.getCmp('AuthorizationEndDate').setValue(fixDate(MasterRecord.get('EndDate')));
                        Ext.getCmp('AuthorizationEndHour').setValue(fixHour(MasterRecord.get('EndDate')));
                    }
                    }
                    else {
                        Ext.Msg.alert('Mensaje', 'No se puede modificar el estado de la autorizaci&oacute;n', function() { masterStore.load(); }, this);
                    }
                }
            }, '->',
            {
                xtype: 'label',
                html: 'Estado:'
            },
                master_buscar_combo,
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
				if(master_buscar_combo.getValue() == null || master_buscar_combo.getValue() == ''){
						Ext.Msg.alert('Mensaje', 'Por favor selecciona un campo para realizar la b&uacute;squeda');
					}
					else
					{
						masterStore.getProxy().setExtraParam("field", "Authorized");
						masterStore.getProxy().setExtraParam("value", master_buscar_combo.getValue())
						masterStore.load();
					}
                }
            }
        ],
            renderTo: Ext.getBody()
        });
		
        var task = null;

        loadCombo('RegisterAuthorization.aspx',
        'GetPerson',
        "{'start':0,'limit':0}",
        ingreso_funcionarios_funcionario_combo.getStore(),
        ingreso_funcionarios_funcionario_combo,
        function() {
            functionaryStore.load({
                callback: function() {
                    task = Ext.TaskManager.start({
                        run: function() {
                            masterStore.load();
                        },
                        interval: 30000
                    });
                }
            });
        },
        function() { }
    );
    });