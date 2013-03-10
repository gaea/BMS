Ext.onReady(function() {

    var AspPageRegisterDiary = 'RegisterDiary.aspx';
    var AspPageConsultDiary = 'ConsultDiary.aspx';

    var agenda_store = new Ext.data.Store({
        fields: [{ name: 'Id_EntryType' }, { name: 'EntryTypeName'}],
        data: []
    });

    loadData(AspPageRegisterDiary, 'GetEntryType', "{'start':0,'limit':0}", agenda_store, null, null);

    var estado_store = new Ext.data.Store({
        fields: [{ name: 'Id_State' }, { name: 'StateName'}],
        data: []
    });

    loadData(AspPageRegisterDiary, 'GetState', "{'start':0,'limit':0}", estado_store, null, null);


    var persona_store = new Ext.data.Store({
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
    });

    //loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store, null, null);

    var master_buscar_array = [
        ['Id_Visitor', 'Documento Identificación'],
        ['Person.Name', 'Nombre'],
        ['Person.LastName', 'Apellido']/*,
        ['todos', 'Todos']*/
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
        width: 180,
        mode: 'local',
        forceSelection: true,
        triggerAction: 'all',
        emptyText: 'Seleccione un campo',
        selectOnFocus: true
    });

    function set_photo(val, x, store) {
        if (val != null && val != '') {
            return '<img src="../../images/photo/' + parseInt(val) + '" onerror=this.src="../../images/user.png" width=45 heigth=75 align=center />';
        }
        else {
            return '<img src="../../images/user.png" width=45 heigth=75 align=center />';
        }
    }

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
            fields: getProperties(new Diary()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
				{ header: "Foto", width: 55, dataIndex: 'Id_Visitor', renderer: set_photo },
                { text: 'Identificaci&oacute;n', width: 80, dataIndex: 'Id_Diary' },
				{ text: 'Documento Identificaci&oacute;n', width: 150, dataIndex: 'Id_Visitor' },
		        { text: 'Nombre', width: 150, dataIndex: 'Id_Visitor',
		            renderer: function(val, meta, rec) {
		                var render_value = '';
		                var ix = persona_store.findBy(
                            function(record, id) {
                                if (record.get('Id_Person') == val) {
                                    render_value = record.get('Name') + ' ' + record.get('LastName');
                                    return id;
                                }
                            }
                        );

		                return render_value;
		            }
		        },
				{ text: 'Fecha Agendada', width: 100, dataIndex: 'DateDiary' },
				{ text: 'Hora Agendada', width: 100, dataIndex: 'HourDiary' },
				{ text: 'Motivo', width: 150, dataIndex: 'Description' },
				{ text: 'Estado', width: 100, dataIndex: 'State' }
        ],
        tbar: [
            {
                text: 'Recargar',
                iconCls: 'reload',
                handler: function() {
                    loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store,
                        function(data) {
                            loadData(AspPageConsultDiary, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        }, null);
                }
            }, '->',
            {
                xtype: 'label',
                html: 'B&uacute;squeda:'
            },
                master_buscar_combo,
            {
                xtype: 'textfield',
                id: 'id_master_buscar_text',
                width: 180,
                listeners: {
                    scope: this,
                    specialkey: function(f, e) {
                        if (e.getKey() == e.ENTER) {
                            loadData(AspPageConsultDiary, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('id_master_buscar_text').getValue() + "'}" }, MasterGrid.getStore(), null, null);
                        }
                    }
                }
            },
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
                    loadData(AspPageConsultDiary, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('id_master_buscar_text').getValue() + "'}" }, MasterGrid.getStore(), null, null);
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store,
        function(data) {
            loadData(AspPageConsultDiary, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
        }, null);
});