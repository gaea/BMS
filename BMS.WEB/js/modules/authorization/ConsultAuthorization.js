﻿Ext.onReady(function() {

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
            return '<img src="../../images/photo/' + String(val) + '" onerror=this.src="../../images/user.png" width=45 heigth=75 align=center />';
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
            fields: getProperties(new Visit()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
				{ header: "Foto", width: 55, dataIndex: 'Id_Visitor', renderer: set_photo },
                { text: 'Identificaci&oacute;n', width: 120, dataIndex: 'Id_Visitor' },
                { text: 'Nombre', width: 250, dataIndex: 'Id_Visitor', renderer: function(val, meta, rec) {
                    var render_value = '';
                    var ix = ingreso_funcionarios_funcionario_store.findBy(
                        function(record, id) {
                            if (record.get('Id_Person') == val) {
                                render_value = record.get('Name') + ' ' + record.get('LastName');
                                return id;
                            }
                        }
                    );
                    //console.log(ingreso_funcionarios_funcionario_store);
                    return render_value;
                } 
                },
                { text: 'Fecha Inicial', width: 200, dataIndex: 'InitialDate', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } },
                //{ text: 'Hora Inicial', width: 150, dataIndex: 'InitialHour', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } },
                { text: 'Fecha Final', width: 200, dataIndex: 'FinalDate', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } },
                //{ text: 'Hora Final', width: 150, dataIndex: 'FinalHour', renderer: function(val, meta, rec) { return Ext.Date.parse(val, "MS"); } }
                {text: 'Observaciones', width: 200, dataIndex: 'VisitDescription' },
                { text: 'Equipos', width: 200, dataIndex: 'ElementsToGetIn' }
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
                            loadData(AspPage, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('id_master_buscar_text').getValue() + "'}" }, MasterGrid.getStore(), null, null);
                        }
                    }
                }
            },
            {
                text: 'Buscar',
                iconCls: 'search',
                handler: function() {
                    loadData(AspPage, 'Find', { objProperties: "{'field':'" + master_buscar_combo.getValue() + "','value':'" + Ext.getCmp('id_master_buscar_text').getValue() + "'}" }, MasterGrid.getStore(), null, null);
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