Ext.onReady(function() {

    var aspPageRegisterPerson = 'RegisterPerson.aspx';

    function Person() {
        this.Id_Person = null,
        this.Id_BiometricReader = null,
        this.Company = null,
        this.Name = null,
        this.LastName = null,
        this.BirthdayMonth = null,
        this.BirthdayDay = null,
        this.Address = null,
        this.City = null,
        this.TelephoneNumber = null,
        this.CelphoneNumber = null,
        this.FaxNumber = null,
        this.Email = null,
        this.IsActive = null,
        this.Observations = null,
        this.Photo = null,
        this.Id_UserCreateRegistration = null,
        this.DateCreateRegistration = null,
        this.Id_UserModifyRegistration = null,
        this.DateModifyRegistration = null,
        this.Contractor = null,
        this.DateValidityARP = null
    };

    var companyStore = new Ext.data.Store({
        fields: [
                { name: 'Id_Third' },
                { name: 'Name' }
            ],
        data: []
    });

    var persona_empresa_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '50%',
        labelWidth: 120,
        fieldLabel: 'Empresa',
        forceSelection: true,
        name: 'Id_Third',
        displayField: 'Name',
        valueField: 'Id_Third',
        queryMode: 'local',
        typeAhead: true,
        store: companyStore,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageRegisterPerson, 'GetCompany', "{'start':0,'limit':0}", persona_empresa_combo.getStore(), persona_empresa_combo);

    var cityStore = new Ext.data.Store({
        fields: [
                { name: 'Id_City' },
                { name: 'Name' },
                { name: 'Id_Department' }
            ],
        data: []
    });

    var persona_ciudad_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        labelWidth: 120,
        anchor: '50%',
        fieldLabel: 'Ciudad',
        forceSelection: true,
        name: 'Id_City',
        displayField: 'Name',
        valueField: 'Id_City',
        queryMode: 'local',
        typeAhead: true,
        store: cityStore,
        allowBlank: false,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageRegisterPerson, 'GetCity', "{'start':0,'limit':0}", persona_ciudad_combo.getStore(), persona_ciudad_combo);

    var persona_departamento_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        labelWidth: 120,
        triggerAction: 'all',
        anchor: '50%',
        fieldLabel: 'Departamento',
        forceSelection: true,
        name: 'Id_Department',
        displayField: 'Name',
        valueField: 'Id_Department',
        queryMode: 'local',
        typeAhead: true,
        store: {
            fields: [
                { name: 'Id_Department' },
                { name: 'Name' }
            ],
            data: []
        },
        listeners: {
            select: function(combo, arrRec, obj) {
                persona_ciudad_combo.getStore().clearFilter(true);
                persona_ciudad_combo.getStore().filter('Id_Department', arrRec[0].data.Id_Department);
            }
        }
    });

    loadCombo(aspPageRegisterPerson, 'GetDepartment', "{'start':0,'limit':0}", persona_departamento_combo.getStore(), persona_departamento_combo);

    var forma = new Ext.form.Panel({
        frame: false,
        border: false,
        autoScroll: true,
        hidden: true,
        width: Ext.getBody().getViewSize().width,
        monitorResize: true,
        bodyStyle: 'padding:5px',
        layout: 'column',
        columnWidth: 0.5,
        columns: 2,
        fileUpload: true,
        items: [
			{
			    xtype: 'fieldset',
			    title: 'Informaci&oacute;n Personal',
			    columnWidth: 1,
			    height: 560,
			    autoScroll: true,
			    layout: 'column',
			    items: [
					{
					    xtype: 'fieldset',
					    id: 'id_fieldset1',
					    border: false,
					    columnWidth: 0.75,
					    defaults: { labelWidth: 120 },
					    items: [
					        {
					            xtype: 'numberfield',
					            fieldLabel: 'Documento de Identificaci&oacute;n',
					            allowBlank: false,
					            name: 'Id_Person',
					            minValue: 0,
					            maxValue: 999999999999
					        },
							{
							    xtype: 'textfield',
							    fieldLabel: 'Nombre',
							    anchor: '100%',
							    name: 'Name',
							    allowBlank: false
							},
							{
							    xtype: 'textfield',
							    fieldLabel: 'Apellidos',
							    anchor: '100%',
							    name: 'LastName',
							    allowBlank: false
							},
							{
							    xtype: 'numberfield',
							    name: 'BirthdayMonth',
							    minValue: 1,
							    maxValue: 12,
							    fieldLabel: 'Mes de Cumpleaños'
							},
                            {
                                xtype: 'numberfield',
                                minValue: 1,
                                maxValue: 31,
                                fieldLabel: 'Dia de cumpleaños',
                                name: 'BirthdayDay'
                            },
					            persona_empresa_combo,
					            persona_departamento_combo,
					            persona_ciudad_combo,
							{
							    xtype: 'textfield',
							    anchor: '100%',
							    fieldLabel: 'Direcci&oacute;n',
							    name: 'Address'
							},
							{
							    xtype: 'numberfield',
							    fieldLabel: 'Telefono',
							    name: 'TelephoneNumber',
							    minValue: 0,
							    maxValue: 9999999,
							    regex: /^\d{7}$/i,
							    maskRe: /\d/i,
							    regexText: "El n&uacute;mero de tel&eacute;lefono es inv&aacute;lido, el valor debe ser num&eacute;rico de 7 d&iacute;gitos."
							},
							{
							    xtype: 'numberfield',
							    fieldLabel: 'Celular',
							    name: 'CelphoneNumber',
							    minValue: 0,
							    maxValue: 9999999999,
							    regex: /^\d{10}$/i,
							    maskRe: /\d/i,
							    regexText: "El n&uacute;mero de celular es inv&aacute;lido, el valor debe ser num&eacute;rico de 10 d&iacute;gitos."
							},
							{
							    xtype: 'numberfield',
							    fieldLabel: 'Fax',
							    minValue: 0,
							    maxValue: 9999999,
							    name: 'FaxNumber',
							    regex: /^\d{7}$/i,
							    maskRe: /\d/i,
							    regexText: "El n&uacute;mero de fax es inv&aacute;lido, el valor debe ser num&eacute;rico de 7 d&iacute;gitos."
							},
							{
							    xtype: 'textfield',
							    fieldLabel: 'E-mail',
							    name: 'Email',
							    regex: /^([\w\-\'\-]+)(\.[\w-\'\-]+)*@([\w\-]+\.){1,5}([A-Za-z]){2,4}$/,
							    regexText: "El email es inv&aacute;lido, debe tener la estructura user@domain.com."
							},
							{
							    xtype: 'radiogroup',
							    fieldLabel: 'Activo?',
							    vertical: true,
							    width: 200,
							    items: [
									{ boxLabel: 'Si', name: 'IsActive', inputValue: '1', checked: true },
									{ boxLabel: 'No', name: 'IsActive', inputValue: '0' }
								]
							},
							{
							    xtype: 'radiogroup',
							    fieldLabel: 'Es contratista?',
							    vertical: true,
							    width: 200,
							    items: [
									{ boxLabel: 'Si', name: 'Contractor', inputValue: '1', checked: true },
									{ boxLabel: 'No', name: 'Contractor', inputValue: '0' }
								],
							    listeners: {
							        change: function(radio, newValue, oldValue) {
							            if (newValue.Contractor == 0) {
							                Ext.getCmp('DateValidityARP').setDisabled(true);
							            }
							            else {
							                Ext.getCmp('DateValidityARP').setDisabled(false);
							            }
							        }
							    }
							},
					        {
					            xtype: 'datefield',
					            id: 'DateValidityARP',
					            fieldLabel: 'Fecha Vigencia ARP',
					            name: 'DateValidityARP',
					            dateFormat: 'd/m/Y',
					            submitFormat: 'd/m/Y',
					            value: new Date()
					        },
					        {
					            xtype: 'textarea',
					            name: 'Observations',
					            fieldLabel: 'Observaciones',
					            anchor: '100%',
					            height: 45
					        }
						]
					},
					{
					    xtype: 'fieldset',
					    frame: true,
					    border: false,
					    columnWidth: 0.25,
					    items: [
							{
							    xtype: 'fieldset',
							    width: 120,
							    height: 120,
							    html: '<img id="foto_persona" src="../../images/user.png" height="110" width="110" />'
							},
                            {
                                xtype: 'filefield',
                                id: 'id_foto_fileuploadfield',
                                name: 'Photo',
                                width: 120,
                                fieldLabel: 'Foto',
                                labelWidth: 30,
                                msgTarget: 'side',
                                buttonText: '...'
                            }
						]
					}
				]
			}
		],
        buttons: [
			{
			    text: 'Guardar',
			    iconCls: 'save',
			    handler: function() {
			        var submitFields = forma.getForm().getValues();

			        forma.getForm().submit({
			            url: aspPageRegisterPerson + '?accion=Save',
			            method: 'POST',
			            params: { objProperties: Ext.JSON.encode(submitFields) },
			            success: function(form, action) {
			                MasterStore.load();

			                obj = Ext.JSON.decode(action.response.responseText);
			                //console.log(obj);

			                Ext.Msg.alert('Mensaje', obj.data.Message, function() { }, this);
			                forma.getForm().reset();
			                forma.hide();
			                MasterGrid.show();
			            },
			            failure: function(form, action) {
			                alert("Error:" + action.result.message);
			            }
			        });
			    }
			},
			{
			    text: 'Cancelar',
			    iconCls: 'cancel',
			    handler: function() {
			        forma.getForm().reset();
			        forma.hide();
			        MasterGrid.show();
			    }
			}
		],
        renderTo: Ext.getBody()
    });

    var master_buscar_array = [
        ['Name', 'Nombre'],
        ['LastName', 'Apellido'],
        ['Email', 'Email'],
        ['Id_Person', 'Documento de Identificación']
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

    function setPhoto(val, x, store) {
        if (val != null && val != '') {
            return '<img src="../../images/photo/' + val + '" width=50 heigth=80 align=center />';
        }
        else {
            return '<img src="../../images/user.png" width=50 heigth=80 align=center />';
        }
    }

    Ext.define('MasterModel', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Functionary' },
            { name: 'Id_Person' },
            { name: 'Id_BiometricReader' },
            { name: 'Company' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'BirthdayMonth' },
            { name: 'BirthdayDay' },
            { name: 'Address' },
            { name: 'City' },
            { name: 'TelephoneNumber' },
            { name: 'CelphoneNumber' },
            { name: 'FaxNumber' },
            { name: 'Email' },
            { name: 'IsActive' },
            { name: 'Observations' },
            { name: 'Photo' },
            { name: 'Id_UserCreateRegistration' },
            { name: 'DateCreateRegistration' },
            { name: 'Id_UserModifyRegistration' },
            { name: 'DateModifyRegistration' },
            { name: 'Contractor' },
            { name: 'DateValidityARP' }
        ],
        idProperty: 'Id_Person'
    });

    var MasterStore = new Ext.data.Store({
        model: 'MasterModel',
        pageSize: 20,
        remoteSort: false,
        proxy: {
            type: 'jsonp',
            url: aspPageRegisterPerson,
            reader: { root: 'Result', totalProperty: 'Total' },
            simpleSortMode: true,
            extraParams: { accion: 'List' }
        },
        autoLoad: true,
        sorters: [{
            property: 'Name',
            direction: 'ASC'
}]
        });

        var MasterGrid = new Ext.grid.GridPanel({
            frame: false,
            border: false,
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
				{ header: "Foto", width: 70, dataIndex: 'Photo', renderer: setPhoto },
                { text: 'Documento de Identificaci&oacute;n', dataIndex: 'Id_Person' },
                { text: 'Empresa', dataIndex: 'Company', renderer: function(val, meta, rec) {
                    return getValueFromStore(val, meta, rec, companyStore, 'Id_Third', 'Name');
                }
                },
                { text: 'Nombre', dataIndex: 'Name' },
                { text: 'Apellido', dataIndex: 'LastName' },
                { text: 'Mes Nacimiento', dataIndex: 'BirthdayMonth', renderer: function(val, meta, rec) {
                    return getMonthFromInt(val);
                }
                },
                { text: 'D&iacute;a Nacimiento', dataIndex: 'BirthdayDay' },
                { text: 'Direcci&oacute;n', dataIndex: 'Address' },
                { text: 'Ciudad', dataIndex: 'City', renderer: function(val, meta, rec) {
                    return getValueFromStore(val, meta, rec, cityStore, 'Id_City', 'Name');
                }
                },
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber' },
                { text: 'Celular', dataIndex: 'CelphoneNumber' },
                { text: 'Email', dataIndex: 'Email' },
                { text: 'Activo?', dataIndex: 'IsActive', renderer: function(val, meta, rec) {
                    return getStringFromBoolean(val);
                }
                }
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
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterGrid.hide();
                    forma.show();
                    Ext.getCmp('id_foto_fileuploadfield').setValue('');
                    Ext.get('foto_persona').dom.src = '../../images/user.png';
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    var recCity = persona_ciudad_combo.getStore().getAt(persona_ciudad_combo.getStore().find('Id_City', records[0].get('City')));

                    forma.getForm().loadRecord(records[0]);
                    persona_empresa_combo.setValue(records[0].get('Company'));
                    persona_ciudad_combo.setValue(records[0].get('City'));

                    if (recCity != null) {
                        persona_departamento_combo.setValue(recCity.get('Id_Department'));
                    }

                    Ext.getCmp('DateValidityARP').setValue(Ext.Date.parse(records[0].get('DateValidityARP'), "MS"));

                    MasterGrid.hide();
                    forma.show();

                    if (records[0].get('Photo') != '' && records[0].get('Photo') != null) {
                        Ext.get('foto_persona').dom.src = '../../images/Photo/' + records[0].get('Photo');
                        Ext.getCmp('id_foto_fileuploadfield').setValue('');
                    }
                    else {
                        Ext.get('foto_persona').dom.src = '../../images/user.png';
                    }
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(
                        aspPageRegisterPerson,
                        'Delete',
                        'Id_Person',
                        records[0].get('Id_Person'),
                        function(data) {
                            MasterStore.load();
                        },
                        null
                    );
                }
            }, '-',
            {
                text: 'Recargar',
                iconCls: 'reload',
                handler: function() {
                    MasterStore.load();
                }
            }, '->',
            {
                xtype: 'label',
                html: 'B&uacute;squeda:'
            },
                master_buscar_combo,
            {
                xtype: 'textfield',
                id: 'master_buscar_text_id',
                width: 140,
                listeners: {
                    scope: this,
                    specialkey: function(f, e) {
                        if (e.getKey() == e.ENTER) {
                            MasterStore.load({ params: {
                                accion:'Find',
                                field: master_buscar_combo.getValue(),
                                value: Ext.getCmp('master_buscar_text_id').getValue()
                            } });
                        }
                    }
                }
            },
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
                    MasterStore.load({ params: {
                        accion: 'Find',
                        field: master_buscar_combo.getValue(),
                        value: Ext.getCmp('master_buscar_text_id').getValue()
                    } });
                }
            }
        ]
        });

        var masterForm = new Ext.Panel({
            width: Ext.getBody().getViewSize().width,
            height: Ext.getBody().getViewSize().height,
            border: false,
            items: [
            forma,
            MasterGrid
        ],
            renderTo: Ext.getBody()
        });
    });