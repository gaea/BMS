Ext.onReady(function() {

    var AspPage = 'RegisterDiary.aspx';

    function Diary() {
        this.Id_Diary = null,
		this.Id_Visitor = null,
		this.DateDiary = null,
		this.HourDiary = null,
		this.Description = null,
		this.DateCreateRegistration = null,
		this.DateModifyRegistration = null,
		this.Id_UserCreateRegistration = null,
		this.Id_UserModifyRegistration = null,
		this.CenterCost = null,
        this.State = null,
        this.Id_User = null
        
    };

	var ingreso_agenda_tipo_ingreso_store = new Ext.data.Store({
        fields: [{ name: 'Id_EntryType' }, { name: 'EntryTypeName'}],
        data: []
    });

    var ingreso_agenda_tipo_ingreso_combo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_ingreso_agenda_tipo_ingreso_combo',
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
        store: ingreso_agenda_tipo_ingreso_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetEntryType', "{'start':0,'limit':0}", ingreso_agenda_tipo_ingreso_store, ingreso_agenda_tipo_ingreso_combo);

    var ingreso_agenda_estado_store = new Ext.data.Store({
        fields: [{ name: 'Id_State' }, { name: 'StateName'}],
        data: []
    });

    var ingreso_agenda_estado_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        fieldLabel: 'Estado',
        forceSelection: true,
        editable: false,
        name: 'Id_State',
        displayField: 'StateName',
        valueField: 'Id_State',
        queryMode: 'local',
        store: ingreso_agenda_estado_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetState', "{'start':0,'limit':0}", ingreso_agenda_estado_store, ingreso_agenda_estado_combo);

    var ingreso_agenda_funcionario_store = new Ext.data.Store({
        fields: [
            { name: 'Id_Person' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Id_Person + ' - ' + record.data.Name + ' ' + record.data.LastName;
                }
            },
            { name: 'Id_Visitor',
                convert: function(v, record) {
                    return record.data.id_Person;
                }
            }
        ],
        data: []
    });

    var ingreso_agenda_funcionario_combo = Ext.create('Ext.form.field.ComboBox', {
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        //pageSize: 10,
        fieldLabel: 'Nombre',
        forceSelection: true,
        name: 'Id_Person',
        displayField: 'FullName',
        valueField: 'Id_Person',
        queryMode: 'local',
        hiddenValue: 'Id_Visitor',
        store: ingreso_agenda_funcionario_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(AspPage, 'GetPerson', "{'start':0,'limit':0}", ingreso_agenda_funcionario_store, ingreso_agenda_funcionario_combo);
	
	
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
			    title: 'Datos para la Agenda',
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
							ingreso_agenda_tipo_ingreso_combo,
							ingreso_agenda_estado_combo,
							ingreso_agenda_funcionario_combo,
							{
							    xtype: 'fieldcontainer',
							    fieldLabel: 'Fecha para agendar',
							    layout: 'hbox',
							    defaults: {
							        hideLabel: true
							    },
							    items: [
									{
										id: 'id_fecha_ingreso',
									    xtype: 'datefield',
									    name: 'fecha_ingreso',
									    width: 130
									},
									{
										id: 'id_hora_ingreso',
									    xtype: 'timefield',
									    name: 'hora_ingreso',
									    width: 130
									}
								]
							},
							{
							    xtype: 'textarea',
							    anchor: '100%',
							    fieldLabel: 'Motivo',
							    height: 50,
							    name: 'Description'
							}
						]
					}//,
					//{
					//   xtype: 'fieldset',
					//    frame: true,
					//    border: false,
					//    columnWidth: 0.25,
					//    items: [
					//		{
					//		    xtype: 'fieldset',
					//		    width: 120,
					//		    height: 120,
					//		    html: '<img src="../../images/user.png" height="110" width="110" />'
					//		}
					//	]
					//}
				]
			},
			{
			    xtype: 'fieldset',
			    columnWidth: 1,
			    title: 'Observaciones',
			    anchor: '100%',
			    items: [
					{
						id: 'id_forma_observaciones',
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
			        submitFields.DateDiary = Ext.getCmp('id_fecha_ingreso').getValue();
			        submitFields.HourDiary = Ext.getCmp('id_hora_ingreso').getValue();
			        saveData(
			            AspPage,
			            'Save',
			            'DiaryProperties',
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