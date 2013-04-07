Ext.onReady(function() {

    var aspPageRegisterDiary = 'RegisterDiary.aspx';
	
	var aspPageFunctionary = '../master_tables/Functionary.aspx';

    var tipo_ingreso_store = new Ext.data.Store({
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
        allowBlank: false,
        queryMode: 'local',
        store: tipo_ingreso_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageRegisterDiary, 'GetEntryType', "{'start':0,'limit':0}", tipo_ingreso_store, ingreso_agenda_tipo_ingreso_combo);

    var estado_store = new Ext.data.Store({
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
        allowBlank: false,
        queryMode: 'local',
        store: estado_store,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageRegisterDiary, 'GetState', "{'start':0,'limit':0}", estado_store, ingreso_agenda_estado_combo);
    
    Ext.define('personaVisitadaModel', {
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

    var personaVisitadaStore = new Ext.data.Store({
        model: 'personaVisitadaModel',
        remoteSort: false,
        proxy: {
            type: 'jsonp',
            url: aspPageFunctionary,
            reader: { root: 'result', totalProperty: 'total'},
            simpleSortMode: true,
            extraParams: { accion: 'List', start: 0, limit: 0 }
        },
        autoLoad: true,
        sorters: [{
            property: 'FullName',
            direction: 'ASC'
        }]
    });
	
	var ingreso_agenda_persona_visitada_combo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_registro_agenda_persona_visitada_combo',
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        fieldLabel: 'Nombre del Visitado',
        forceSelection: true,
        name: 'Id_Functionary',
        displayField: 'FullName',
        valueField: 'Id_Functionary',
        queryMode: 'local',
        hiddenValue: 'Id_Visitor',
        allowBlank: false,
        store: personaVisitadaStore
    });

    var persona_store = new Ext.data.Store({
        fields: [
            { name: 'Id_Person' },
            { name: 'Photo' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Id_Person + ' - ' + record.data.Name + ' ' + record.data.LastName;
                }
            },
            { name: 'Id_Visitor',
                convert: function(v, record) {
                    return record.data.Id_Person;
                }
            }
        ],
        data: []
    });
	
    var ingreso_agenda_persona_visitante_combo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_registro_agenda_persona_combo',
        mode: 'local',
        triggerAction: 'all',
        anchor: '100%',
        //pageSize: 10,
        fieldLabel: 'Nombre del Visitante',
        forceSelection: true,
        name: 'Id_Person',
        displayField: 'FullName',
        valueField: 'Id_Person',
        queryMode: 'local',
        hiddenValue: 'Id_Visitor',
        allowBlank: false,
        store: persona_store,
        listeners: {
            select: function(combo, arrRec, obj) {
                if (arrRec[0].get('Photo') != '' && arrRec[0].get('Photo') != null) {
                    Ext.get('foto_persona').dom.src = '../../images/Photo/' + arrRec[0].get('Photo');
                }
                else {
                    Ext.get('foto_persona').dom.src = '../../images/user.png';
                }
            }
        }
    });

    loadCombo(aspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store, ingreso_agenda_persona_visitante_combo);


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
			    items: [
					{
					    xtype: 'fieldset',
					    id: 'id_fieldset1',
					    border: false,
					    columnWidth: 0.75,
					    items: [
							ingreso_agenda_tipo_ingreso_combo,
							ingreso_agenda_estado_combo,
							ingreso_agenda_persona_visitante_combo,
							ingreso_agenda_persona_visitada_combo,
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
									    allowBlank: false,
									    width: 130,
									    value: new Date()
									},
									{
									    id: 'id_hora_ingreso',
									    xtype: 'timefield',
									    name: 'hora_ingreso',
									    allowBlank: false,
									    width: 130,
									    value: new Date()
									}
								]
							},
							{
							    xtype: 'textarea',
							    anchor: '100%',
							    fieldLabel: 'Motivo',
							    height: 50,
							    name: 'Description'
							},
							{
							    xtype: 'textarea',
							    id: 'id_forma_observaciones',
							    fieldLabel: 'Observaci&oacute;n',
							    name: 'Observations',
							    anchor: '100%'
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
			}
		],
        buttons: [
			{
			    text: 'Guardar',
			    iconCls: 'save',
			    handler: function() {
			        if (forma.getForm().isValid()) {

			            var initialDate = Ext.Date.format(Ext.getCmp('id_fecha_ingreso').getValue(), 'Y/m/d');
			            var initialHour = Ext.Date.format(Ext.getCmp('id_hora_ingreso').getValue(), 'H:i:s');
			            var initialDateHour = new Date(initialDate + ' ' + initialHour);

			            var currentDateHour = new Date(Ext.Date.format(new Date(), 'Y/m/d H:i:s'));

			            if (initialDateHour >= currentDateHour) {
			                var submitFields = forma.getForm().getValues();
			                submitFields.Id_Visitor = Ext.getCmp('id_registro_agenda_persona_combo').getValue();
			                submitFields.DateDiary = Ext.getCmp('id_fecha_ingreso').getValue();
			                submitFields.HourDiary = Ext.getCmp('id_hora_ingreso').getValue();

			                saveData(
			                    aspPageRegisterDiary,
			                    'Save',
			                    'DiaryProperties',
			                    submitFields,
			                    function(data) {
			                        //loadData(aspPageRegisterDiary, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
			                    },
			                    null
			                );
			            }
			            else {
			                Ext.Msg.alert('Mensaje', 'La fecha de ingreso debe ser mayor o igual a la fecha actual');
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

    //loadData(aspPageRegisterDiary, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
});