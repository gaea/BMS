Ext.onReady(function() {

    var aspPagePerson = 'Person.aspx';

    function Person() {
        this.Id_Person                      = null,
        this.Id_BiometricReader             = null,
        this.Company                        = null,
        this.Id_Headquarter                 = null,
        this.Name                           = null,
        this.LastName                       = null,
        this.BirthdayMonth                  = null,
        this.BirthdayDay                    = null,
        this.Address                        = null,
        this.City                           = null,
        this.PostalZone                     = null,
        this.ZipCode                        = null,
        this.TelephoneNumber                = null,
        this.CelphoneNumber                 = null,
        this.BeeperNumber                   = null,
        this.BeeperCode                     = null,
        this.FaxNumber                      = null,
        this.Email                          = null,
        this.Password                       = null,
        this.ChargeCode                     = null,
        this.ByPayroll                      = null,
        this.ByHour                         = null,
        this.IntegralSalary                 = null,
        this.ContractClass                  = null,
        this.IsActive                       = null,
        this.DependencyCode                 = null,
        this.CenterCost                     = null,
        this.Turn                           = null,
        this.ExtensionNumber                = null,
        this.BossName                       = null,
        this.ExtensionBoss                  = null,
        this.Observations                   = null,
        this.IndexReader                    = null,
        this.IndexOther                     = null,
        this.FingerPrint                    = null,
        this.Photo                          = null,
        this.Id_UserCreateRegistration      = null,
        this.DateCreateRegistration         = null,
        this.Id_UserModifyRegistration      = null,
        this.DateModifyRegistration         = null,
        this.Contractor                     = null,
        this.DateValidityARP                = null
    };

    var MasterRowEditorPerson = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
				
                saveData(
                    aspPagePerson,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPagePerson, 'List', "{'start':0,'limit':0}", MasterGridPerson.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

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
        store: ({
            fields: getProperties(new Person()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Person' },
                { text: 'Identificador Lector', dataIndex: 'Id_BiometricReader', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Empresa', dataIndex: 'Company', editor: new Ext.form.TextField() },
                { text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ allowBlank: false }) },
                { text: 'Apellido', dataIndex: 'LastName', editor: new Ext.form.TextField({}) },
                { text: 'Mes Nacimiento', dataIndex: 'BirthdayMonth', editor: new Ext.form.TextField({}) },
                { text: 'D&iacute;a Nacimiento', dataIndex: 'BirthdayDay', editor: new Ext.form.TextField({}) },
                { text: 'Direcci&oacute;n', dataIndex: 'Address', editor: new Ext.form.TextField({}) },
                { text: 'Ciudad', dataIndex: 'City', editor: new Ext.form.TextField({}) },
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber', editor: new Ext.form.TextField({}) },
                { text: 'Celular', dataIndex: 'CelphoneNumber', editor: new Ext.form.TextField({}) },
                //{ text: 'N&uacute;mero Beeper', dataIndex: 'BeeperNumber', editor: new Ext.form.TextField({}) },
                //{ text: 'C&oacute;digo Beeper', dataIndex: 'BeeperCode', editor: new Ext.form.TextField({}) },
                //{ text: 'Fax', dataIndex: 'FaxNumber', editor: new Ext.form.TextField({}) },
                { text: 'Email', dataIndex: 'Email', editor: new Ext.form.TextField({}) },
                { text: 'Activo?', dataIndex: 'IsActive', editor: new Ext.form.field.Checkbox({}) }
                //{ text: 'Extensi&oacute;n', dataIndex: 'ExtensionNumber', editor: new Ext.form.TextField({}) }
        ],
        plugins: [MasterRowEditorPerson],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorPerson.cancelEdit();
                    MasterGridPerson.getStore().insert(0, new Person());
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
                        aspPagePerson,
                        'Delete',
                        'Id_Person', 
                        records[0].get('Id_Person'),
                        function(data) {
                            loadData(aspPagePerson, 'List', "{'start':0,'limit':0}", MasterGridPerson.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPagePerson, 'List', "{'start':0,'limit':0}", MasterGridPerson.getStore(), null, null);
});