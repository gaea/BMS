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

    loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store, null, null);

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

                { text: 'Identificaci&oacute;n', width: 80, dataIndex: 'Id_Diary' },
				{ text: 'Documento Identificaci&oacute;n', width: 150, dataIndex: 'Id_Visitor' },
		        { text: 'Nombre', width: 150, dataIndex: 'Id_Visitor', renderer: function(val, meta, rec) {
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
				}
				,
				{ text: 'Fecha Agendada', width: 100, dataIndex: 'DateDiary'},
				{ text: 'Hora Agendada', width: 100, dataIndex: 'HourDiary' },
				{ text: 'Motivo', width: 150, dataIndex: 'Description' },
				{ text: 'Estado', width: 100, dataIndex: 'State' }
        ],
        tbar:[
            {
                text:'Recargar',
                iconCls:'reload',
                handler:function(){
                    loadData(AspPageRegisterDiary, 'GetPerson', "{'start':0,'limit':0}", persona_store,
                        function(data) {
                            loadData(AspPageConsultDiary, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        }, null);
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