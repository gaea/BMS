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

    var persona_empresa_store = new Ext.data.Store({
        fields: [
            { name: 'Id_Company' },
            { name: 'CompanyName' }
        ],
        data: []
    });

    var persona_empresa_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        fieldLabel: 'Autorizado por',
        forceSelection: true,
        name: 'Id_Company',
        displayField: 'CompanyName',
        valueField: 'Id_Company',
        queryMode: 'local',
        typeAhead: true,
        store: persona_empresa_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetCompany', "{'start':0,'limit':0}", persona_empresa_store, persona_empresa_combo);

    var forma = new Ext.form.Panel({
        frame: false,
        border: false,
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
			    title: 'Datos para la Autorizaci&oacute;n',
			    columnWidth: 1,
			    layout: 'column',
			    //height: Ext.getBody().getViewSize().height - 500,
			    items: [
					{
					    xtype: 'fieldset',
					    id: 'id_fieldset1',
					    border: false,
					    columnWidth: 0.75,
					    items: [
							{
							    xtype: 'fieldcontainer',
							    fieldLabel: 'Fecha de ingreso',
							    layout: 'hbox',
							    defaults: {
							        hideLabel: true
							    },
							    items: [
									{
									    xtype: 'datefield',
									    dateFormat: 'd/m/Y',
									    submitFormat: 'd/m/Y',
									    name: 'InitialDate',
									    width: 130
                                    },
									{
									    xtype: 'timefield',
									    name: 'InitialHour',
									    dateFormat: 'H:i:s',
									    submitFormat: 'H:i:s',
									    width: 130
									}
								]
							},
					    {
					        xtype: 'fieldcontainer',
					        fieldLabel: 'Fecha de salida',
					        layout: 'hbox',
					        defaults: {
					        hideLabel: true
					        },
					        items: [
					            {
					                xtype: 'datefield',
					                dateFormat: 'd/m/Y',
					                submitFormat: 'd/m/Y',
					                name: 'FinalDate',
					                width: 130
					            },
					            {
					                xtype: 'timefield',
					                name: 'FinalHour',
					                dateFormat: 'H:i:s',
					                submitFormat: 'H:i:s',
					                width: 130
					            }
					        ]
					        },
							    {
							    xtype: 'textfield',
							    anchor: '100%',
							    fieldLabel: 'Equipos',
							    name: 'ElementsToGetIn'
                            },
							{
							    xtype: 'textarea',
							    anchor: '100%',
							    fieldLabel: 'Motivo',
							    height: 50,
							    name: '123'
							},
							{
							    xtype: 'radiogroup',
							    fieldLabel: 'ARP Vigente',
							    vertical: true,
							    width: 200,
							    items: [
									{ boxLabel: 'Si', name: 'rb', inputValue: '1', checked: true },
									{ boxLabel: 'No', name: 'rb', inputValue: '0' }
								]
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
					    name: 'VisitDescription',
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
			            'SaveVisit',
			            'VisitProperties',
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