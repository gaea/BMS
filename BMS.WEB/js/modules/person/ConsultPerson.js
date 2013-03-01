    var AspPage = 'RegisterPerson.aspx';

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
            fields: getProperties(new Person()),
            data: [{}]
        }),
        columns: [
                { text: 'Identificador', dataIndex: 'Id_Person' },
                { text: 'Identificador Lector', dataIndex: 'Id_BiometricReader'},
                { text: 'Empresa', dataIndex: 'Company' },
                { text: 'Nombre', dataIndex: 'Name'},
                { text: 'Apellido', dataIndex: 'LastName'},
                { text: 'Mes Nacimiento', dataIndex: 'BirthdayMonth'},
                { text: 'D&iacute;a Nacimiento', dataIndex: 'BirthdayDay'},
                { text: 'Direcci&oacute;n', dataIndex: 'Address'},
                { text: 'Ciudad', dataIndex: 'City'},
                { text: 'Tel&eacute;fono', dataIndex: 'TelephoneNumber'},
                { text: 'Celular', dataIndex: 'CelphoneNumber'},
                //{ text: 'N&uacute;mero Beeper', dataIndex: 'BeeperNumber', editor: new Ext.form.TextField({}) },
                //{ text: 'C&oacute;digo Beeper', dataIndex: 'BeeperCode', editor: new Ext.form.TextField({}) },
                //{ text: 'Fax', dataIndex: 'FaxNumber', editor: new Ext.form.TextField({}) },
                { text: 'Email', dataIndex: 'Email'},
                { text: 'Activo?', dataIndex: 'IsActive'}
                //{ text: 'Extensi&oacute;n', dataIndex: 'ExtensionNumber', editor: new Ext.form.TextField({}) }
        ],
        tbar: [
            {
                text: 'Adicionar',
                iconCls: 'add',
                handler: function() {
                    
                }
            }, '-',
            {
                text: 'Modificar',
                iconCls: 'modify',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    MasterRowEditor.cancelEdit();
                    MasterRowEditor.startEdit(records[0], 1);
                }
            }, '-',
            {
                text: 'Eliminar',
                iconCls: 'remove',
                handler: function() {
                    var records = MasterGrid.getSelectionModel().getSelection();
                    deleteData(
                        AspPage,
                        'Delete',
                        'Id_Person', 
                        records[0].get('Id_Person'),
                        function(data) {
                            loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);
                        },
                        null
                    );
                }
            }
        ],
        renderTo: Ext.getBody()
    });

    loadData(AspPage, 'List', "{'start':0,'limit':0}", MasterGrid.getStore(), null, null);