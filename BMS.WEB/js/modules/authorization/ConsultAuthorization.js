Ext.onReady(function() {

    var aspPageRegisterAuthorization = 'RegisterAuthorization.aspx';
	
    var aspPageConsultAuthorization = 'ConsultAuthorization.aspx';

	var aspPagePerson = '../person/RegisterPerson.aspx';
	
	var aspPageFunctionary = '../master_tables/Functionary.aspx';
	
    function Visit() {
        this.Id_Visit = null,
        this.Id_Visitor = null,
        this.DateCreateTransaction = null,
        this.Id_Functionary = null,
        this.VisitDescription = null,
        this.ElementsToGetIn = null,
        this.Activity = null,
        this.InitialDate = null,
        this.InitialHour = null,
        this.FinalDate = null,
        this.FinalHour = null,
        this.VisitDuration = null,
        this.Id_Usuario = null,
        this.Id_Area = null,
        this.Tracing = null,
        this.OutEquipment = null,
        this.ScheduledVisit = null,
        this.BarCode = null,
        this.Provider = null,
        this.DateCreateRegistration = null,
        this.DateModifyRegistration = null,
        this.Id_UserCreateRegistration = null,
        this.Id_UserModifyRegistration = null
    };

    var ingreso_funcionarios_tipo_ingreso_store = new Ext.data.Store({
        fields: [{ name: 'Id_EntryType' }, { name: 'EntryTypeName'}],
        data: []
    });

    loadData(aspPageRegisterAuthorization, 'GetEntryType', "{'start':0,'limit':0}", ingreso_funcionarios_tipo_ingreso_store, null, null);

    var functionaryStore = new Ext.data.Store({
        fields: [
				 { name: 'Id_Functionary' }, 
				 { name: 'Name'},
				 { name: 'LastName' },
				 { name: 'FullName',
					convert: function(v, record) {
						return record.data.Name + ' ' + record.data.LastName;
					}
				 }
				 ],
        data: []
    });

    loadData(aspPageFunctionary, 'List', "{'start':0,'limit':0}", functionaryStore, null, null);

    var ingreso_funcionarios_estado_store = new Ext.data.Store({
        fields: [{ name: 'Id_State' }, { name: 'StateName'}],
        data: []
    });

    loadData(aspPageRegisterAuthorization, 'GetState', "{'start':0,'limit':0}", ingreso_funcionarios_estado_store, null, null);

	var companyStore = new Ext.data.Store({
        fields: [{ name: 'Id_Third' }, { name: 'Name'}],
        data: []
    });
	
	loadData(aspPagePerson, 'GetCompany', "{'start':0,'limit':0}", companyStore, null, null);
	
    var ingreso_funcionarios_funcionario_store = new Ext.data.Store({
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

    var ingreso_funcionarios_persona_autoriza_store = new Ext.data.Store({
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

    loadData(aspPageRegisterAuthorization, 'GetAprobatorPerson', "{'start':0,'limit':0}", ingreso_funcionarios_persona_autoriza_store, null, null);

    var master_buscar_array = [
        ['Id_Visitor', 'Documento Identificación'],
        ['Person.Name', 'Nombre del Visitante'],
        ['Person.LastName', 'Apellido del Visitante'],
        ['Person.Company.Name', 'Empresa del Visitante'],
        ['InitialDate', 'Fecha Inicial']
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
                if (arrRec[0].get('campo') == 'InitialDate') {
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
            return '<img src="../../images/photo/' + String(val) + '" onerror=this.src="../../images/user.png" width=45 heigth=75 align=center />';
        }
        else {
            return '<img src="../../images/user.png" width=45 heigth=75 align=center />';
        }
    }

    function fixDate(val, meta, rec) {
        return val != '' && val != null ? Ext.Date.format(Ext.Date.parse(val, "MS"), 'Y/m/d - H:i:s') : '';
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
        store: ({
            fields: getProperties(new Visit()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
				{ header: "Foto", width: 55, dataIndex: 'Id_Visitor', renderer: set_photo },
                { text: 'Documento de Identificaci&oacute;n', width: 150, dataIndex: 'Id_Visitor' },
                { text: 'Nombre del Visitante', width: 250, dataIndex: 'Id_Visitor',
                    renderer: function(val, meta, rec) 
					{
						return getValueFromStore(val, meta, rec, ingreso_funcionarios_funcionario_store, 'Id_Person', 'FullName');
					}
                },
				{ text: 'Empresa del Visitante', width: 150, dataIndex: 'Id_Visitor', renderer: function(val, meta, rec) 
					{	
						return getValueFromStoreSinceOtherValueToFind(val, meta, rec, companyStore, 'Id_Third', 'Name', getValueFromStore(val, meta, rec, ingreso_funcionarios_funcionario_store, 'Id_Person', 'Company'));
					}
				},
				{ text: "Autorizado por", width: 150, dataIndex: 'Id_Functionary', renderer: function(val, meta, rec) 
					{
						return getValueFromStore(val, meta, rec, functionaryStore, 'Id_Functionary', 'FullName');
					}
				},
                { text: 'Fecha Inicial', width: 150, dataIndex: 'InitialDate', renderer: fixDate },
                { text: 'Fecha Final', width: 150, dataIndex: 'FinalDate', renderer: fixDate },
                { text: 'Observaciones', width: 200, dataIndex: 'VisitDescription' },
                { text: 'Equipos', width: 200, dataIndex: 'ElementsToGetIn' }
        ],
        tbar: [
            {
                text: 'Recargar',
                iconCls: 'reload',
                handler: function() {
                    loadData(aspPageRegisterAuthorization, 'GetPerson', "{'start':0,'limit':0}", ingreso_funcionarios_funcionario_store,
                        function(data) {
                            loadData(aspPageConsultAuthorization, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
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
                dateFormat: 'd/m/Y',
                submitFormat: 'd/m/Y',
                hidden: true,
                listeners: {
                    scope: this,
                    specialkey: function(f, e) {
                        if (e.getKey() == e.ENTER) {
                            loadData(aspPageConsultAuthorization, 'Find', { objProperties: "{'field':'InitialDate','value':'" + Ext.getCmp('id_master_buscar_date').getValue() + "'}" }, MasterGrid.getStore(), null, null);
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
                            loadData(aspPageConsultAuthorization, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('id_master_buscar_text').getValue() + "'}" }, MasterGrid.getStore(), null, null);
                        }
                    }
                }
            },
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
                    var search = '';

                    if (master_buscar_combo.getValue() == 'InitialDate') {
                        search = Ext.Date.format(Ext.getCmp('id_master_buscar_date').getValue(), 'Y/m/d H:i:s');
                    }
                    else {
                        search = Ext.getCmp('id_master_buscar_text').getValue();
                    }

                    loadData(aspPageConsultAuthorization, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + search + "'}" }, MasterGrid.getStore(), null, null);
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    //return dateFormatter(val, 'Y-m-d');
    //return Ext.Date.format(date, 'd/m/Y');
    //myDate = Ext.Date.parse("2012-01-03 5:43:21 PM", "Y-m-d g:i:s A");
    //return date;

    loadData(aspPageRegisterAuthorization, 'GetPerson', "{'start':0,'limit':0}", ingreso_funcionarios_funcionario_store,
        function(data) {
            loadData(aspPageConsultAuthorization, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
        }, null);
});