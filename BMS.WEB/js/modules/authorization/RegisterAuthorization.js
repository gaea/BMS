Ext.onReady(function() {

    var AspPage = 'authorization/RegisterAuthorization.aspx';

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
        //hiddenName: 'Id_EntryType',
        store: {
            fields: ['Id_EntryType', 'EntryTypeName'],
            data: [
                { Id_EntryType: '1', EntryTypeName: 'Funcionario' },
                { Id_EntryType: '2', EntryTypeName: 'Contratista' },
                { Id_EntryType: '3', EntryTypeName: 'Estudiante' }
            ]
        },
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    /*loadData(AspPage, 'GetEntryType', "{'start':0,'limit':0}", ingreso_funcionarios_tipo_ingreso_combo.getStore(),
        function(data) {
            console.log(ingreso_funcionarios_tipo_ingreso_combo.getStore());
        }
    , null);*/

    var ingreso_funcionarios_estado_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        fieldLabel: 'Estado',
        forceSelection: true,
        editable: false,
        name: 'est_codigo',
        displayField: 'est_nombre',
        valueField: 'est_codigo',
        store: {
            fields: ['est_codigo', 'est_nombre'],
            data: [
				{ est_codigo: 0, est_nombre: 'Inactivo' },
				{ est_codigo: 1, est_nombre: 'Activo' }
			]
        },
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    var ingreso_funcionarios_funcionario_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        pageSize: 10,
        fieldLabel: 'Nombre',
        forceSelection: true,
        name: 'func_codigo',
        displayField: 'func_nombre',
        valueField: 'func_codigo',
        store: { fields: ['func_codigo', 'func_nombre'], data: [{ func_codigo: 0, func_nombre: 'Agustin Barona'}] },
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    var ingreso_funcionarios_persona_autoriza_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        pageSize: 10,
        fieldLabel: 'Autorizado por',
        forceSelection: true,
        name: 'per_codigo',
        displayField: 'per_nombre',
        valueField: 'per_codigo',
        store: { fields: ['per_codigo', 'per_nombre'], data: [{ per_codigo: 0, per_nombre: 'Avis Fernando'}] },
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

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
									    name: 'fecha_ingreso',
									    width: 130
									},
									{
									    xtype: 'timefield',
									    name: 'hora_ingreso',
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
									    name: 'fecha_salida',
									    width: 130
									},
									{
									    xtype: 'timefield',
									    name: 'hora_salida',
									    width: 130
									}
								]
							},
							{
							    xtype: 'textfield',
							    anchor: '100%',
							    fieldLabel: 'Vehiculo'
							},
							{
							    xtype: 'textfield',
							    anchor: '100%',
							    fieldLabel: 'Equipos'
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
							},
							{
							    xtype: 'filefield',
							    name: 'pinta',
							    buttonText: '...',
							    labelWidth: 30,
							    width: 120,
							    fieldLabel: 'Foto'
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
					    xtype: 'htmleditor',
					    name: 'algo',
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
			        //alert('Mensaje', forma.getForm().getValues());

			        /*saveData(
                        AspPage,
                        'Save',
                        'DiaryProperties',
                        forma.getForm().getValues(),
                        function(data) {
                            //loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        },
                        null
                    );*/
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