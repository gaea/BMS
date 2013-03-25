Ext.onReady(function() {

    var AspPage = 'RegisterAuthorization.aspx';

    function Visit() {
        this.Id_Visit = null,
		  this.Id_Visitor = null,
		  this.DateCreateTransaction = null,
		  this.DocumentNumberVisitor = null,
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

    var ingreso_funcionarios_tipo_ingreso_combo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_ingreso_funcionarios_tipo_ingreso_combo',
        mode: 'local',
        triggerAction: 'all',
        fieldLabel: 'Tipo de ingreso',
        forceSelection: true,
        editable: false,
        name: 'Id_EntryType',
        displayField: 'EntryTypeName',
        valueField: 'Id_EntryType',
        queryMode: 'local',
        allowBlank: false,
        store: new Ext.data.Store({
            fields: [{ name: 'Id_EntryType' }, { name: 'EntryTypeName'}],
            data: []
        }),
        listeners: {
            select: function(combo, arrRec, obj) {
                if (arrRec[0].get('EntryTypeName') == 'Contratista') {
                    Ext.getCmp('AuthorizationARPVigente').setDisabled(false);
                }
                else {
                    Ext.getCmp('AuthorizationARPVigente').setDisabled(true);
                }
            }
        }
    });

    loadCombo(AspPage, 'GetEntryType', "{'start':0,'limit':0}", ingreso_funcionarios_tipo_ingreso_combo.getStore(), ingreso_funcionarios_tipo_ingreso_combo);

    var ingreso_funcionarios_estado_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        fieldLabel: 'Estado',
        forceSelection: true,
        editable: false,
        name: 'Id_State',
        displayField: 'StateName',
        valueField: 'Id_State',
        queryMode: 'local',
        store: new Ext.data.Store({
            fields: [{ name: 'Id_State' }, { name: 'StateName'}],
            data: []
        }),
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetState', "{'start':0,'limit':0}", ingreso_funcionarios_estado_combo.getStore(), ingreso_funcionarios_estado_combo);

    var ingreso_funcionarios_funcionario_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        fieldLabel: 'Nombre del Visitante',
        forceSelection: true,
        name: 'Id_Person',
        displayField: 'FullName',
        valueField: 'Id_Person',
        queryMode: 'local',
        hiddenName: 'Id_Person',
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
                //console.log(arrRec[0].get('Photo'));
                if (arrRec[0].get('Photo') != '' && arrRec[0].get('Photo') != null) {
                    Ext.get('foto_persona').dom.src = '../../images/Photo/' + arrRec[0].get('Photo');
                }
                else {
                    Ext.get('foto_persona').dom.src = '../../images/user.png';
                }
            }
        }
    });

    loadCombo(AspPage, 'GetPerson', "{'start':0,'limit':0}", ingreso_funcionarios_funcionario_combo.getStore(), ingreso_funcionarios_funcionario_combo);

    var ingreso_funcionarios_persona_autoriza_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        fieldLabel: 'Autorizado por',
        forceSelection: true,
        name: 'Id_Person',
        displayField: 'FullName',
        valueField: 'Id_Person',
        queryMode: 'local',
        typeAhead: true,
        store: new Ext.data.Store({
            fields: [
                { name: 'Id_Person' },
                { name: 'Name' },
                { name: 'LastName' },
                { name: 'FullName',
                    convert: function(v, record) {
                        return record.data.Name + ' ' + record.data.LastName;
                    }
                }
            ],
            data: []
        }),
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetAprobatorPerson', "{'start':0,'limit':0}", ingreso_funcionarios_persona_autoriza_combo.getStore(), ingreso_funcionarios_persona_autoriza_combo);

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
							ingreso_funcionarios_tipo_ingreso_combo,
							ingreso_funcionarios_estado_combo,
							ingreso_funcionarios_funcionario_combo,
							ingreso_funcionarios_persona_autoriza_combo,
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
									    id: 'AuthorizationInitialDate',
									    dateFormat: 'd/m/Y',
									    submitFormat: 'd/m/Y',
									    name: 'InitialDate',
									    allowBlank: false,
									    width: 130,
									    value: new Date()
									},
									{
									    xtype: 'timefield',
									    id: 'AuthorizationInitialHour',
									    name: 'InitialHour',
									    allowBlank: false,
									    dateFormat: 'H:i:s',
									    submitFormat: 'H:i:s',
									    width: 130,
									    value: new Date()
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
					                id: 'AuthorizationFinalDate',
					                dateFormat: 'd/m/Y',
					                submitFormat: 'd/m/Y',
					                name: 'FinalDate',
					                width: 130,
					                value: new Date(),
					                allowBlank: false
					            },
					            {
					                xtype: 'timefield',
					                id: 'AuthorizationFinalHour',
					                name: 'FinalHour',
					                allowBlank: false,
					                dateFormat: 'H:i:s',
					                submitFormat: 'H:i:s',
					                value: new Date(),
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
							    id: 'AuthorizationARPVigente',
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
							    html: '<img id="foto_persona" src="../../images/user.png" height="110" width="110" />'
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
			        if (forma.getForm().isValid()) {
			            var initialDate = Ext.Date.format(Ext.getCmp('AuthorizationInitialDate').getValue(), 'Y/m/d');
			            var initialHour = Ext.Date.format(Ext.getCmp('AuthorizationInitialHour').getValue(), 'H:i:s');
			            var initialDateHour = new Date( Ext.Date.format(new Date(initialDate + ' ' + initialHour), 'Y/m/d H:i:s') );

			            var finalDate = Ext.Date.format(Ext.getCmp('AuthorizationFinalDate').getValue(), 'Y/m/d');
			            var finalHour = Ext.Date.format(Ext.getCmp('AuthorizationFinalHour').getValue(), 'H:i:s');
			            var finalDateHour = new Date( Ext.Date.format(new Date(finalDate + ' ' + finalHour), 'Y/m/d H:i:s'));
                        
						var currentDateHour = new Date( Ext.Date.format(new Date(), 'Y/m/d') + ' ' + Ext.Date.format(new Date(), 'H:i:s'));
						
                        if (initialDateHour >= currentDateHour) {
			                if (finalDateHour > initialDateHour) {

			                    var submitFields = forma.getForm().getValues();
			                    submitFields.Id_Person = ingreso_funcionarios_funcionario_combo.getValue();

			                    saveData(
			                        AspPage,
			                        'Save',
			                        'VisitProperties',
			                        submitFields,
			                        function(data) {
			                            //loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
			                        },
			                        null
			                    );
			                }
			                else {
			                    alert('La fecha de ingreso debe ser menor a la fecha de salida');
			                }
			            }
			            else{
			                alert('La fecha de ingreso debe ser mayor o igual a la fecha actual');
			            }
			        }
			    }
			},
			{
			    text: 'Cancelar',
			    iconCls: 'cancel'

			}
		],
        renderTo: Ext.getBody()
    });

    //loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});