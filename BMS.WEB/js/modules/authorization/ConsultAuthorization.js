Ext.onReady(function() {

    var AspPageRegisterAuthorization = 'RegisterAuthorization.aspx';
    var AspPage = 'ConsultAuthorization.aspx';

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

    loadData(AspPageRegisterAuthorization, 'GetEntryType', "{'start':0,'limit':0}", ingreso_funcionarios_tipo_ingreso_store, null, null);

    var ingreso_funcionarios_estado_store = new Ext.data.Store({
        fields: [{ name: 'Id_State' }, { name: 'StateName'}],
        data: []
    });

    loadData(AspPageRegisterAuthorization, 'GetState', "{'start':0,'limit':0}", ingreso_funcionarios_estado_store, null, null);

    var ingreso_funcionarios_funcionario_store = new Ext.data.Store({
        fields: [
            { name: 'Id_Person' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'FullName',
                convert: function(v, record) {
                    return record.data.Id_Person + ' - ' + record.data.Name + ' ' + record.data.LastName;
                }
            }
        ],
        data: []
    });

    var ingreso_funcionarios_persona_autoriza_store = new Ext.data.Store({
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

    loadData(AspPageRegisterAuthorization, 'GetAprobatorPerson', "{'start':0,'limit':0}", ingreso_funcionarios_persona_autoriza_store, null, null);

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
            fields: getProperties(new Visit()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificaci&oacute;n', width: 150, dataIndex: 'Id_Visitor' },
                { text: 'Nombre', width: 150, dataIndex: 'Id_Visitor', renderer: function(val, meta, rec) {
                    var render_value = '';
                    var ix = ingreso_funcionarios_funcionario_store.findBy(
                        function(record, id) {
                            if (record.get('Id_Person') == val) {
                                render_value = record.get('Name') + ' ' + record.get('LastName');
                                return id;
                            }
                        }
                    );
                    console.log(ingreso_funcionarios_funcionario_store);
                    return render_value;
                } 
                },
                { text: 'Fecha Inicial', width: 150, dataIndex: 'InitialDate', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } },
                { text: 'Hora Inicial', width: 150, dataIndex: 'InitialHour', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } },
                { text: 'Fecha Final', width: 150, dataIndex: 'FinalDate', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } },
                { text: 'Hora Final', width: 150, dataIndex: 'FinalHour', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } }
        ],
        tbar:[
            {
                text:'Recargar',
                iconCls:'reload',
                handler:function(){
                    loadData(AspPageRegisterAuthorization, 'GetPerson', "{'start':0,'limit':0}", ingreso_funcionarios_funcionario_store,
                        function(data) {
                            loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        }, null);
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    //return dateFormatter(val, 'Y-m-d');
    //return Ext.Date.format(date, 'd/m/Y');
    //myDate = Ext.Date.parse("2012-01-03 5:43:21 PM", "Y-m-d g:i:s A");
    //return date;

    loadData(AspPageRegisterAuthorization, 'GetPerson', "{'start':0,'limit':0}", ingreso_funcionarios_funcionario_store,
        function(data) {
            loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
        }, null);
});