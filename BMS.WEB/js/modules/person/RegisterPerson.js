Ext.onReady(function() {

    var AspPage = 'RegisterPerson.aspx';

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
        store: {
            fields: [
                { name: 'Id_Third' },
                { name: 'Name' }
            ],
            data: []
        },
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetCompany', "{'start':0,'limit':0}", persona_empresa_combo.getStore(), persona_empresa_combo);

    var persona_ciudad_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        labelWidth: 120,
        //allowBlank: false,
        anchor: '50%',
        fieldLabel: 'Ciudad',
        forceSelection: true,
        name: 'Id_City',
        displayField: 'Name',
        valueField: 'Id_City',
        queryMode: 'local',
        typeAhead: true,
        store: {
            fields: [
                { name: 'Id_City' },
                { name: 'Name' },
                { name: 'Id_Department' }
            ],
            data: []
        },
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetCity', "{'start':0,'limit':0}", persona_ciudad_combo.getStore(), persona_ciudad_combo);

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
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetDepartment', "{'start':0,'limit':0}", persona_departamento_combo.getStore(), persona_departamento_combo);

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
					            fieldLabel: 'Id Persona',
					            name: 'Id_Person',
					            readOnly: true
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
							    fieldLabel: 'Mes de Cumpleaños'
							},
                            {
                                xtype: 'numberfield',
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
							    regex: /^\d{7}$/i,
							    maskRe: /\d/i,
							    regexText: "El n&uacute;mero de tel&eacute;lefono es inv&aacute;lido, el valor debe ser num&eacute;rico de 7 d&iacute;gitos."
							},
							{
							    xtype: 'numberfield',
							    fieldLabel: 'Celular',
							    name: 'CelphoneNumber',
							    regex: /^\d{10}$/i,
							    maskRe: /\d/i,
							    regexText: "El n&uacute;mero de celular es inv&aacute;lido, el valor debe ser num&eacute;rico de 10 d&iacute;gitos."
							},
							{
							    xtype: 'numberfield',
							    fieldLabel: 'Fax',
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
									{ boxLabel: 'Si', name: 'IsActive', inputValue: true, checked: true },
									{ boxLabel: 'No', name: 'IsActive', inputValue: false }
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
								]
							},
					        {
					            xtype: 'datefield',
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
							    html: '<img src="../../images/user.png" height="110" width="110" />'
							},
                            {
                                xtype: 'filefield',
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
			            url: AspPage + '?accion=Save',
			            method: 'POST',
			            params: { objProperties: Ext.JSON.encode(submitFields) },
			            success: function(form, action) {
			                console.log(action);
			                obj = Ext.JSON.decode(response.responseText);
			                //functionSuccess(obj.data);
			            },
			            failure: function(form, action) {
			                alert("Error:" + action.result.message);
			            }

			        });


			        /*saveData(
			        AspPage,
			        'Save',
			        'UserProperties',
			        submitFields,
			        function(data) {
			        forma.getForm().reset();
			        forma.hide();
			        MasterGrid.show();
			        loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
			        },
			        null
			        );*/
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
        ['LastName', 'Apellidos'],
        ['Email', 'Email']
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
            fields: getProperties(new Person()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Person' },
                { text: 'Id. Lector', dataIndex: 'Id_BiometricReader' },
                { text: 'Empresa', dataIndex: 'Company' },
                { text: 'Nombre', dataIndex: 'Name' },
                { text: 'Apellido', dataIndex: 'LastName' },
                { text: 'Mes Nacimiento', dataIndex: 'BirthdayMonth' },
                { text: 'D&iacute;a Nacimiento', dataIndex: 'BirthdayDay' },
                { text: 'Direcci&oacute;n', dataIndex: 'Address' },
                { text: 'Ciudad', dataIndex: 'City' },
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber' },
                { text: 'Celular', dataIndex: 'CelphoneNumber' },
                { text: 'Email', dataIndex: 'Email' },
                { text: 'Activo?', dataIndex: 'IsActive' }
        ],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    forma.show();
                    MasterGrid.hide();
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();

                    forma.getForm().loadRecord(records[0]);
                    persona_empresa_combo.setValue(records[0].get('Company'));
                    persona_ciudad_combo.setValue(records[0].get('City'));

                    forma.show();
                    MasterGrid.hide();
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(
                        AspPage,
                        'Delete',
                        'Id_Person',
                        records[0].get('Id_Person'),
                        function(data) {
                            loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        },
                        null
                    );
                }
            },
            {
                text: 'Recargar',
                iconCls: 'reload',
                handler: function() {
                    loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
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
                            loadData(AspPage, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('master_buscar_text_id').getValue() + "'}" }, MasterGrid.getStore(), null, null);
                        }
                    }
                }
            },
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
                    loadData(AspPage, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('master_buscar_text_id').getValue() + "'}" }, MasterGrid.getStore(), null, null);
                }
            }
        ]
    });

    loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);

    var masterForm = new Ext.Panel({
        width: Ext.getBody().getViewSize().width,
        height: Ext.getBody().getViewSize().height,
        items: [
            forma,
            MasterGrid
        ],
        renderTo: Ext.getBody()
    });
});