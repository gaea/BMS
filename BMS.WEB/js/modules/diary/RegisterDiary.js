Ext.onReady(function() {

    var AspPage = 'diary/RegisterDiary.aspx';

    function Diary() {
        this.Id_Diary = null
    };

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

    var ingreso_agenda_estado_combo = Ext.create('Ext.form.field.ComboBox', {
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

    var ingreso_agenda_funcionario_combo = Ext.create('Ext.form.field.ComboBox', {
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
							    xtype: 'textarea',
							    anchor: '100%',
							    fieldLabel: 'Motivo',
							    height: 50,
							    name: '123'
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
					    xtype: 'textarea',
					    name: 'algo',
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