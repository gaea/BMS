Ext.onReady(function() {

    var aspPageCompany = 'Company.aspx';

    function Company() {
        this.Id_Third = null,
		this.Id_Subsidiary = null,
		this.VerificationDigit = null,
		this.Name = null,
		this.Address = null,
		this.Id_City = null,
		this.AirSection = null,
		this.TelephoneNumber = null,
		this.FaxNumber = null,
		this.CodeLegalRepresentation = null,
		this.NameLegalRepresentation = null,
		this.DocumentNumberLegalRepresentation = null,
		this.Observations = null,
		this.LicencySoftware = null,
		this.Logo = null,
		this.PayrollCode = null,
		this.BiometricReader = null,
		this.UserCreateRegistration = null,
		this.DateCreateRegistration = null,
		this.UserModifyRegistration = null,
		this.DateModifyRegistration = null
    };

    var MasterRowEditorDepartment = new Ext.grid.plugin.RowEditing({
        listeners: {
            validateedit: function(editor, e, eOpts) {
				delete e.newValues[''];
                saveData(
                    aspPageCompany,
                    'Save',
                    'objProperties',
                    e.newValues,
                    function(data) {
                        loadData(aspPageCompany, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
                    },
                    null
                );
            }
        }
    });

    var MasterGridDepartment = new Ext.grid.GridPanel({
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
            fields: getProperties(new Company()),
            data: [{}]
        }),
        columns: [
				Ext.create('Ext.grid.RowNumberer'),
                { text: 'Identificador', dataIndex: 'Id_Third' },
                { text: 'Sucursal', dataIndex: 'Id_Subsidiary', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'D&iacute;gito Verificaci&oacute;n', dataIndex: 'VerificationDigit', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Nombre', dataIndex: 'Name', editor: new Ext.form.TextField({ msgTarget: 'none', allowBlank: false, labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Direicci&oacute;n', dataIndex: 'Address', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Ciudad', dataIndex: 'Id_City', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Apartado A&eacute;reo', dataIndex: 'AirSection', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'N&uacute;mero de Telef&oacute;no', dataIndex: 'TelephoneNumber', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'N&uacute;mero de Fax', dataIndex: 'FaxNumber', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'C&oacute;digo del Representante Legal', dataIndex: 'CodeLegalRepresentation', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Nombre del Representante Legal', dataIndex: 'NameLegalRepresentation', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'C&eacute;dula del Representante Legal', dataIndex: 'DocumentNumberLegalRepresentation', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Observaciones', dataIndex: 'Observations', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'C&oacute;digo de N&oacute;mina', dataIndex: 'PayrollCode', editor: new Ext.form.TextField({ msgTarget: 'none', labelWidth: 75, minText: 'Texto de ejemplo' }) },
				{ text: 'Lector Biom&eacute;trico', dataIndex: 'BiometricReader', editor: new Ext.form.TextField() }
				
        ],
        plugins: [MasterRowEditorDepartment],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    MasterRowEditorDepartment.cancelEdit();
                    MasterGridDepartment.getStore().insert(0, new Company());
                    MasterRowEditorDepartment.startEdit(MasterGridDepartment.getStore().getAt(0), 0);
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGridDepartment.getSelectionModel().getSelection();
                    MasterRowEditorDepartment.cancelEdit();
                    MasterRowEditorDepartment.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGridDepartment.getSelectionModel().getSelection();
					
                    deleteData(
                        aspPageCompany,
                        'Delete',
                        'Id_Third',
                        records[0].get('Id_Third'),
                        function(data) {
                            loadData(aspPageCompany, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(aspPageCompany, 'List', "{'start':0,'limit':0}", MasterGridDepartment.getStore(), null, null);
});