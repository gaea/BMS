Ext.onReady(function() {

    var aspPageFunctionary = 'Functionary.aspx';

    var aspPageCity = 'City.aspx';

    var aspPageHeadquarter = 'Headquarter.aspx';

    var aspPageCharge = 'Charge.aspx';

    function Functionary() {
        this.Id_Functionary = null,
        this.Id_BiometricReader = null,
        this.Id_Company = null,
        this.Id_Headquarter = null,
        this.Name = null,
        this.LastName = null,
        this.BirthdayMonth = null,
        this.BirthdayDay = null,
        this.Address = null,
        this.Id_City = null,
        this.PostalZone = null,
        this.ZipCode = null,
        this.AirSection = null,
		this.TelephoneNumber = null,
        this.CelphoneNumber = null,
        this.BeeperNumber = null,
        this.BeeperCode = null,
        this.FaxNumber = null,
        this.Email = null,
        this.Password = null,
        this.Id_Charge = null,
        this.ByPayroll = null,
        this.ByHour = null,
        this.IntegralSalary = null,
        this.ContractClass = null,
        this.IsActive = null,
        this.Id_Dependency = null,
        this.Id_CostCenter = null,
        this.Turn = null,
        this.ExtensionNumber = null,
        this.BossName = null,
        this.BossExtensionNumber = null,
        this.Observations = null,
        this.IndexReader = null,
        this.Id_Between = null,
        this.FingerPrint = null,
        this.Photo = null,
        this.Id_UserCreateRegistration = null,
        this.DateCreateRegistration = null,
        this.Id_UserModifyRegistration = null,
        this.DateModifyRegistration = null
    };

    var companyStore = new Ext.data.Store({
        fields: [{ name: 'Id_Third' }, { name: 'Name'}],
        data: []
    });

    var companyCombo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_company_combo',
        mode: 'local',
        triggerAction: 'all',
        forceSelection: true,
        editable: false,
        name: 'Id_Third',
        displayField: 'Name',
        valueField: 'Id_Third',
        queryMode: 'local',
        store: companyStore,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageFunctionary, 'GetCompany', "{'start':0,'limit':0}", companyStore, companyCombo);


    var headquarterStore = new Ext.data.Store({
        fields: [{ name: 'Id_Headquarter' }, { name: 'Description'}],
        data: []
    });

    var headquarterCombo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_headquarter_combo',
        mode: 'local',
        triggerAction: 'all',
        forceSelection: true,
        editable: false,
        name: 'Id_Headquarter',
        displayField: 'Description',
        valueField: 'Id_Headquarter',
        queryMode: 'local',
        store: companyStore,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageHeadquarter, 'List', "{'start':0,'limit':0}", headquarterStore, headquarterCombo);

    var chargeStore = new Ext.data.Store({
        fields: [{ name: 'Id_Charge' }, { name: 'Name'}],
        data: []
    });

    var chargeCombo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_charge_combo',
        mode: 'local',
        triggerAction: 'all',
        forceSelection: true,
        editable: false,
        name: 'Id_Charge',
        displayField: 'Name',
        valueField: 'Id_Charge',
        queryMode: 'local',
        store: companyStore,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageCharge, 'List', "{'start':0,'limit':0}", chargeStore, chargeCombo);

    var cityStore = new Ext.data.Store({
        fields: [{ name: 'Id_City' }, { name: 'Name'}],
        data: []
    });

    var cityCombo = Ext.create('Ext.form.field.ComboBox', {
        id: 'id_city_combo',
        mode: 'local',
        triggerAction: 'all',
        forceSelection: true,
        editable: false,
        name: 'Id_City',
        displayField: 'Name',
        valueField: 'Id_City',
        queryMode: 'local',
        store: cityStore,
        listeners: {
            select: function(combo, arrRec, obj) { }
        }
    });

    loadCombo(aspPageCity, 'List', "{'start':0,'limit':0}", cityStore, cityCombo);

    var MasterRowEditorPerson = new Ext.grid.plugin.RowEditing({
        errorSummary: false,
        listeners: {
            validateedit: function(editor, e, eOpts) {
                delete e.newValues[''];
                delete e.newValues['Photo'];

                saveData(
                    aspPageFunctionary,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        MasterStorePerson.load();
                        //loadData(aspPageFunctionary, 'List', "{'start':0,'limit':20}", MasterGridPerson.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

    Ext.define('MasterModelPerson', {
        extend: 'Ext.data.Model',
        fields: [
			{ name: 'Id_Functionary' },
            { name: 'Id_BiometricReader' },
            { name: 'Id_Company' },
            { name: 'Id_Headquarter' },
            { name: 'Name' },
            { name: 'LastName' },
            { name: 'BirthdayMonth' },
            { name: 'BirthdayDay' },
            { name: 'Address' },
            { name: 'Id_City' },
            { name: 'PostalZone' },
            { name: 'ZipCode' },
            { name: 'AirSection' },
            { name: 'TelephoneNumber' },
            { name: 'CelphoneNumber' },
            { name: 'BeeperNumber' },
            { name: 'BeeperCode' },
            { name: 'FaxNumber' },
            { name: 'Email' },
            { name: 'Password' },
            { name: 'Id_Charge' },
            { name: 'ByPayroll' },
            { name: 'ByHour' },
            { name: 'IntegralSalary' },
            { name: 'ContractClass' },
            { name: 'IsActive' },
            { name: 'Id_Dependency' },
            { name: 'Id_CostCenter' },
            { name: 'Turn' },
            { name: 'ExtensionNumber' },
            { name: 'BossName' },
            { name: 'BossExtensionNumber' },
            { name: 'Observations' },
            { name: 'IndexReader' },
            { name: 'Id_Between' },
            { name: 'FingerPrint' },
            { name: 'Photo' },
            { name: 'Id_UserCreateRegistration' },
            { name: 'DateCreateRegistration' },
            { name: 'Id_UserModifyRegistration' },
            { name: 'DateModifyRegistration' }
		],
        idProperty: 'Id_Functionary'
    });

    var MasterStorePerson = new Ext.data.Store({
        pageSize: 20,
        model: 'MasterModelPerson',
        remoteSort: true,
        proxy: {
            type: 'jsonp',
            url: aspPageFunctionary,
            reader: {
                root: 'result',
                totalProperty: 'total'
            },
            simpleSortMode: true,
            extraParams: {
                accion: 'List'
            }
        },
        sorters: [{
            property: 'Id_Functionary',
            direction: 'ASC'
        }]
    });

        MasterStorePerson.load();

        var MasterGridPerson = new Ext.grid.GridPanel({
            frame: false,
            border: true,
            width: Ext.getBody().getViewSize().width,
            height: Ext.getBody().getViewSize().height,
            monitorResize: true,
            stripeRows: true,
            columnLines: true,
            stateful: true,
            stateId: 'grid',
            store: MasterStorePerson,
            columns: [
				Ext.create('Ext.grid.RowNumberer'),
				{ header: "Foto", width: 70, dataIndex: 'Photo', renderer: setPhoto },
                { text: 'Documento de Identificaci&oacute;n', width: 160, dataIndex: 'Id_Functionary', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Identificador Lector', width: 150, dataIndex: 'Id_BiometricReader', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Nombre', width: 150, dataIndex: 'Name', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Apellido', width: 150, dataIndex: 'LastName', editor: new Ext.form.TextField({ allowBlank: false }) },
				{ text: 'Cargo', width: 150, dataIndex: 'Id_Charge', renderer: function(val, meta, rec) {
				    return getValueFromStore(val, meta, rec, chargeStore, 'Id_Charge', 'Name');
				}, editor: chargeCombo
				},
				{ text: 'Empresa', width: 150, dataIndex: 'Id_Company', renderer: function(val, meta, rec) {
				    return getValueFromStore(val, meta, rec, companyStore, 'Id_Third', 'Name');
				}, editor: companyCombo
				},
				{ text: 'Sede', width: 150, dataIndex: 'Id_Headquarter', renderer: function(val, meta, rec) {
				    return getValueFromStore(val, meta, rec, headquarterStore, 'Id_Headquarter', 'Description');
				}, editor: headquarterCombo
				},
				{ text: 'Password', width: 80, dataIndex: 'Password', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Mes Nacimiento', dataIndex: 'BirthdayMonth', editor: new Ext.form.TextField({}), renderer: function(val, meta, rec) {
                    return getMonthFromInt(val);
                }
                },
                { text: 'D&iacute;a Nacimiento', dataIndex: 'BirthdayDay', editor: new Ext.form.TextField({}) },
                { text: 'Direcci&oacute;n', dataIndex: 'Address', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Ciudad', dataIndex: 'Id_City', renderer: function(val, meta, rec) {
                    return getValueFromStore(val, meta, rec, cityStore, 'Id_City', 'Name');
                }, editor: cityCombo
                },
				{ text: 'Apartado A&eacute;reo', dataIndex: 'AirSection', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber', editor: new Ext.form.TextField({}) },
                { text: 'Celular', dataIndex: 'CelphoneNumber', editor: new Ext.form.TextField({}) },
				{ text: 'N&uacute;mero de Beeper', dataIndex: 'BeeperNumber', editor: new Ext.form.TextField({ allowBlank: false }) },
				{ text: 'C&oacute;digo de Beeper', dataIndex: 'BeeperCode', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Email', dataIndex: 'Email', editor: new Ext.form.TextField({ allowBlank: false }) },
				{ text: 'Nombre del Jefe', dataIndex: 'BossName', editor: new Ext.form.TextField({ allowBlank: false }) },
				{ text: 'Observaciones', width: 150, dataIndex: 'Observations', editor: new Ext.form.TextField({ allowBlank: false }) },
				{ text: 'Turno?', dataIndex: 'Turn', editor: new Ext.form.field.Checkbox({}), renderer: function(val, meta, rec) {
				    return getStringFromBoolean(val);
				}
				},
                { text: 'Activo?', dataIndex: 'IsActive', editor: new Ext.form.field.Checkbox({}), renderer: function(val, meta, rec) {
                    return getStringFromBoolean(val);
                }
                }
        ],
            plugins: [MasterRowEditorPerson],
            tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorPerson.cancelEdit();
                    MasterGridPerson.getStore().insert(0, new Functionary());
                    MasterRowEditorPerson.startEdit(MasterGridPerson.getStore().getAt(0), 0);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGridPerson.getSelectionModel().getSelection();
                    MasterRowEditorPerson.cancelEdit();
                    MasterRowEditorPerson.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGridPerson.getSelectionModel().getSelection();

                    deleteData(
                        aspPageFunctionary,
                        'Delete',
                        'Id_Functionary',
                        records[0].get('Id_Functionary'),
                        function(data) {
                            loadData(aspPageFunctionary, 'List', "{'start':0,'limit':0}", MasterGridPerson.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
            bbar: new Ext.PagingToolbar({
                pageSize: 20,
                store: MasterStorePerson,
                displayInfo: true,
                displayMsg: 'Registros {0} - {1} de {2}',
                emptyMsg: "No hay registros"
            }),
            renderTo: Ext.getBody()
        });

        //loadData(aspPageFunctionary, 'List', "{'start':0,'limit':0}", MasterGridPerson.getStore(), null, null);
    });