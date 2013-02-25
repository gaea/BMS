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

    var ingreso_funcionarios_tipo_ingreso_store = new Ext.data.Store({
        fields: [{ name: 'Id_EntryType' }, { name: 'EntryTypeName'}],
        data: []
    });

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
        //hiddenName: 'Id_EntryType',
        store: ingreso_funcionarios_tipo_ingreso_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetEntryType', "{'start':0,'limit':0}", ingreso_funcionarios_tipo_ingreso_store, ingreso_funcionarios_tipo_ingreso_combo);

    var ingreso_funcionarios_estado_store = new Ext.data.Store({
        fields: [{ name: 'Id_State' }, { name: 'StateName'}],
        data: []
    });

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
        store: ingreso_funcionarios_estado_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetState', "{'start':0,'limit':0}", ingreso_funcionarios_estado_store, ingreso_funcionarios_estado_combo);

    var ingreso_funcionarios_funcionario_store = new Ext.data.Store({
        fields: [
            { name: 'Id_Person' },
            { name: 'Name' },
            { name: 'LastName'},
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Id_Person + ' - ' + record.data.Name + ' ' + record.data.LastName;
                }
            }
        ],
        data: []
    });

    var ingreso_funcionarios_funcionario_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        fieldLabel: 'Nombre',
        forceSelection: true,
        name: 'Id_Person',
        displayField: 'FullName',
        valueField: 'Id_Person',
        queryMode: 'local',
        hiddenName: 'Id_Person',
        allowBlank: false,
        typeAhead:true,
        store: ingreso_funcionarios_funcionario_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetPerson', "{'start':0,'limit':0}", ingreso_funcionarios_funcionario_store, ingreso_funcionarios_funcionario_combo);

    var ingreso_funcionarios_persona_autoriza_store = new Ext.data.Store({
        fields: [
            { name: 'Id_Person' },
            { name: 'Name' },
            { name: 'LastName'},
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Name + ' ' + record.data.LastName;
                }
            }
        ],
        data: []
    });

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
        store: ingreso_funcionarios_persona_autoriza_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetAprobatorPerson', "{'start':0,'limit':0}", ingreso_funcionarios_persona_autoriza_store, ingreso_funcionarios_persona_autoriza_combo);

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
									    dateFormat: 'd/m/Y',
									    submitFormat: 'd/m/Y g:i:s A',
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
					                submitFormat: 'd/m/Y g:i:s A',
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
			    handler: function() {
			        Ext.Msg.confirm('Impresi&oacute;n Autorizaci&oacute;n', '¿Desea realizar la impresión del tiquete?');

			        var submitFields = forma.getForm().getValues();
			        submitFields.Id_Person = ingreso_funcionarios_funcionario_combo.getValue();
			        
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

    //loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});