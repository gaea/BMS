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
        fieldLabel: 'Empresa',
        forceSelection: true,
        name: 'Id_Company',
        displayField: 'CompanyName',
        valueField: 'Id_Company',
        queryMode: 'local',
        typeAhead: true,
        store: {
            fields: [
                { name: 'Id_Company' },
                { name: 'CompanyName' }
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
        autoScroll:true,
        width: Ext.getBody().getViewSize().width,
        height: Ext.getBody().getViewSize().height,
        monitorResize: true,
        bodyStyle: 'padding:5px',
        layout: 'column',
        columnWidth: 0.5,
        columns: 2,
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
					    items: [
							{
							    xtype: 'textfield',
							    fieldLabel: 'Nombre',
							    anchor: '100%',
							    name:'Name',
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
				                xtype: 'datefield',
				                fieldLabel: 'Fecha de Nacimiento',
				                name: 'Birthday',
				                dateFormat: 'd/m/Y',
				                submitFormat: 'd/m/Y',
				                allowBlank: false
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
							    xtype: 'textfield',
							    fieldLabel: 'Telefono',
							    name: 'TelephoneNumber'
							},
							{
							    xtype: 'textfield',
							    fieldLabel: 'Celular',
							    name: 'CelphoneNumber'
			                },
							{
							    xtype: 'textfield',
							    fieldLabel: 'Fax',
							    name: 'FaxNumber'
							},
							{
							    xtype: 'textfield',
							    fieldLabel: 'E-mail',
							    name: 'Email'
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
								]
					        }, //DateValidityARP
					        {
					            xtype: 'datefield',
					            fieldLabel: 'Fecha de Vigencia de ARP',
					            name: 'DateValidityARP',
					            dateFormat: 'd/m/Y',
					            submitFormat: 'd/m/Y'
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
			},
			{
			    xtype: 'fieldset',
			    columnWidth: 1,
			    title: 'Observaciones',
			    anchor: '100%',
			    items: [
					{
					    xtype: 'textarea',
					    name: 'Observations',
					    anchor: '100%'
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
			        
			        saveData(
			            AspPage,
			            'Save',
			            'UserProperties',
			            submitFields,
			            function(data) {
			                //loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
			            },
			        null
			        );
			    }
			},
			{
			    text: 'Cancelar'
			}
		],
        renderTo: Ext.getBody()
    });
});