Ext.onReady(function() {

    var AspPageRegisterDiary = 'RegisterDiary.aspx';

    var AspPageConsultDiary = 'ConsultDiary.aspx';

    var aspPagePerson = '../person/RegisterPerson.aspx';

    var aspPageFunctionary = '../master_tables/Functionary.aspx';

    var agenda_store = new Ext.data.Store({
        fields: [{ name: 'Id_EntryType' }, { name: 'EntryTypeName'}],
        data: []
    });

    loadData(AspPageRegisterDiary, 'GetEntryType', "{'start':0,'limit':0}", agenda_store, null, null);

    var estado_store = new Ext.data.Store({
        fields: [{ name: 'Id_State' }, { name: 'StateName'}],
        data: []
    });

    loadData(AspPageRegisterDiary, 'GetState', "{'start':0,'limit':0}", estado_store, null, null);

    Ext.define('functionaryModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Functionary' },
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

    var functionaryStore = new Ext.data.Store({
        model: 'functionaryModel',
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

        var companyStore = new Ext.data.Store({
            fields: [{ name: 'Id_Third' }, { name: 'Name'}],
            data: []
        });

        loadData(aspPagePerson, 'GetCompany', "{'start':0,'limit':0}", companyStore, null, null);

        var persona_store = new Ext.data.Store({
            fields: [
            { name: 'Id_Person' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Name + ' ' + record.data.LastName;
                }
            },
			{ name: 'Company' }
        ],
            data: []
        });

        //loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store, null, null);

        var master_buscar_array = [
            ['Id_Visitor', 'Documento Identificación'],
            ['Person.Name', 'Nombre del Visitante'],
            ['Person.LastName', 'Apellido del Visitante'],
            ['Person.Company.Name', 'Empresa del Visitante'],
		    ['Diary.Functionary.Name', 'Nombre del Funcionario Agendado'],
            ['DateDiary', 'Fecha Agendada']
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
            width: 180,
            mode: 'local',
            forceSelection: true,
            triggerAction: 'all',
            emptyText: 'Seleccione un campo',
            selectOnFocus: true,
            listeners: {
                select: function(combo, arrRec, obj) {
                    if (arrRec[0].get('campo') == 'DateDiary') {
                        Ext.getCmp('id_master_buscar_text').hide();
                        Ext.getCmp('id_master_buscar_date').show();
                    }
                    else {
                        Ext.getCmp('id_master_buscar_date').hide();
                        Ext.getCmp('id_master_buscar_text').show();
                    }
                }
            }
        });

        function set_photo(val, x, store) {
            if (val != null && val != '') {
                return '<img src="../../images/photo/' + parseInt(val) + '" onerror=this.src="../../images/user.png" width=45 heigth=75 align=center />';
            }
            else {
                return '<img src="../../images/user.png" width=45 heigth=75 align=center />';
            }
        }

        Ext.define('MasterModel', {
            extend: 'Ext.data.Model',
            fields: [
			    { name: 'Id_Diary' },
                { name: 'Id_Functionary' },
	            { name: 'Id_Visitor' },
	            { name: 'DateDiary' },
	            { name: 'HourDiary' },
	            { name: 'Description' },
	            { name: 'DateCreateRegistration' },
	            { name: 'DateModifyRegistration' },
	            { name: 'Id_UserCreateRegistration' },
	            { name: 'Id_UserModifyRegistration' },
	            { name: 'CenterCost' },
                { name: 'State' },
                { name: 'Id_User' }
            ],
            idProperty: 'Id_Diary'
        });

        var MasterStore = new Ext.data.Store({
            model: 'MasterModel',
            pageSize: 20,
            remoteSort: false,
            proxy: {
                type: 'jsonp',
                url: AspPageConsultDiary,
                reader: { root: 'Result', totalProperty: 'Total' },
                simpleSortMode: true,
                extraParams: { accion: 'List' }
            },
            //autoLoad: true,
            sorters: [{
                property: 'Id_Diary',
                direction: 'DESC'
            }]
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
            store: MasterStore,
            columns: [
				Ext.create('Ext.grid.RowNumberer'),
				{ header: "Foto", width: 55, dataIndex: 'Id_Visitor', renderer: set_photo },
				{ text: 'Documento Identificaci&oacute;n', width: 170, dataIndex: 'Id_Visitor' },
		        { text: 'Nombre del Visitante', width: 200, dataIndex: 'Id_Visitor',
		            renderer: function(val, meta, rec) {
		                return getValueFromStore(val, meta, rec, persona_store, 'Id_Person', 'FullName');
		            }
		        },
				{ text: 'Empresa del Visitante', width: 150, dataIndex: 'Id_Visitor', renderer: function(val, meta, rec) {
				    return getValueFromStoreSinceOtherValueToFind(val, meta, rec, companyStore, 'Id_Third', 'Name', getValueFromStore(val, meta, rec, persona_store, 'Id_Person', 'Company'));
				}, hidden: true
				},
				{ text: 'Nombre del Funcionario Agendado', width: 220, dataIndex: 'Id_Functionary', renderer: function(val, meta, rec) {
				    return getValueFromStore(val, meta, rec, functionaryStore, 'Id_Functionary', 'FullName');
				}
				},
				{ text: 'Fecha Agendada', width: 120, dataIndex: 'DateDiary' },
				{ text: 'Hora Agendada', width: 100, dataIndex: 'HourDiary', hidden: true },
				{ text: 'Motivo', width: 150, dataIndex: 'Description' }/*,
				{ text: 'Estado', width: 100, dataIndex: 'State' }*/
        ],
		bbar: new Ext.PagingToolbar({
		    pageSize: 20,
		    store: MasterStore,
		    displayInfo: true,
		    displayMsg: 'Registros {0} - {1} de {2}',
		    emptyMsg: "No hay registros"
		}),
        tbar: [
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();

                    if (records.length > 0) {
                        var initialDateHour = records[0].get('DateDiary') + ' ' + records[0].get('HourDiary');
                        initialDateHour = initialDateHour.replace(/-/g, "/");

                        initialDateHour = initialDateHour.replace("a", '');
                        initialDateHour = initialDateHour.replace("p", '');
                        initialDateHour = initialDateHour.replace("m", '');
                        initialDateHour = initialDateHour.replace(".", '');
                        initialDateHour = initialDateHour.replace(".", '');

                        initialDateHour = new Date(initialDateHour);

                        var currentDateHour = new Date()

                        if (initialDateHour > currentDateHour) {
                            deleteData(
                                AspPageConsultDiary,
                                'Delete',
                                'Id_Visitor',
                                records[0].get('Id_Diary'),
                                function(data) {
                                    loadData(AspPageConsultDiary, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                                },
                                null
                            );
                        }
                        else {
                            Ext.Msg.alert('Mensaje', 'La agenda a eliminar debe presentar una fecha mayor a la fecha actual');
                        }
                    }
                }
            }, '-',
            {
                text: 'Recargar',
                iconCls: 'reload',
                handler: function() {
                    loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store,
                        function(data) {
                            MasterStore.load();
                        }, null);
                }
            }, '->',
            {
                xtype: 'label',
                html: 'B&uacute;squeda:'
            },
                master_buscar_combo,
            {
                xtype: 'datefield',
                id: 'id_master_buscar_date',
                width: 180,
                dateFormat: 'Y-m-d',
                submitFormat: 'Y-m-d',
                format: 'Y-m-d',
                hidden: true,
                listeners: {
                    scope: this,
                    specialkey: function(f, e) {
                        if (e.getKey() == e.ENTER) {
                            MasterStore.load({ params: {
                                accion: 'Find',
                                field: 'InitialDate',
                                value: Ext.getCmp('id_master_buscar_date').getValue()
                            }});
                        }
                    }
                }
            },
            {
                xtype: 'textfield',
                id: 'id_master_buscar_text',
                width: 180,
                listeners: {
                    scope: this,
                    specialkey: function(f, e) {
                        if (e.getKey() == e.ENTER) {
                            MasterStore.load({ params: {
                                accion: 'Find',
                                field: master_buscar_combo.getValue(),
                                value: Ext.getCmp('id_master_buscar_text').getValue()
                            }});
                        }
                    }
                }
            },
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
                    var search = '';

                    if (master_buscar_combo.getValue() == 'DateDiary') {
                        search = Ext.Date.format(Ext.getCmp('id_master_buscar_date').getValue(), 'Y-m-d');
                    }
                    else {
                        search = Ext.getCmp('id_master_buscar_text').getValue();
                    }

                    MasterStore.load({ params: {
                        accion: 'Find',
                        field: master_buscar_combo.getValue(),
                        value: search
                    }});
                    
                    //loadData(AspPageConsultDiary, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + search + "'}" }, MasterGrid.getStore(), null, null);
                }
            }
        ],
                renderTo: Ext.getBody()
            });

            //MasterStore.load();

    loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store,
        function(data) {
            MasterStore.load();
        }, null);
    });