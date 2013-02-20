Ext.define('MyDesktop.BiometricAuthorization', {
    extend: 'Ext.ux.desktop.Module',

    requires: [
        'Ext.data.ArrayStore',
        'Ext.util.Format',
        'Ext.grid.Panel',
        'Ext.grid.RowNumberer'
    ],

    id:'authorization-win',

    init : function(){
        this.launcher = {
            text: 'Registro Autorizaciones',
            iconCls:'icon-biometric-authorization16'
        };
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('authorization-win');
        if(!win){
			var ingreso_funcionarios_datastore = new Ext.data.Store({
				proxy:new Ext.data.HttpProxy(
				{url:'ingreso_visitantes.html', method:'POST'}),
				baseParams:{},
				reader:new Ext.data.JsonReader({root:'results',totalProperty:'total'},
				[{name:'id_visitante'}]),
				sortInfo: {field: 'id_visitante', direction: "ASC"}
			});
			
			var ingreso_funcionarios_tipo_ingreso_combo = Ext.create('Ext.form.field.ComboBox',{
				mode:'local',
				triggerAction:'all',
				fieldLabel:'Tipo de ingreso',
				forceSelection:true,
				editable:false,
				name:'tii_codigo', 
				displayField:'tii_nombre',
				valueField:'tii_codigo',
				store:{ 
					fields:['tii_codigo','tii_nombre'],
					data:[
						{tii_codigo:0,tii_nombre:'Funcionario'},
						{tii_codigo:1,tii_nombre:'Contratista'},
						{tii_codigo:2,tii_nombre:'Estudiante'}
					]
				},
				listeners:{
					select:function(combo, arrRec, obj){ }
				}
			});
			
			var ingreso_funcionarios_estado_combo = Ext.create('Ext.form.field.ComboBox',{
				mode:'local',
				triggerAction:'all',
				fieldLabel:'Estado',
				forceSelection:true,
				editable:false,
				name:'est_codigo', 
				displayField:'est_nombre',
				valueField:'est_codigo',
				store:{ 
					fields:['est_codigo','est_nombre'],
					data:[
						{est_codigo:0,est_nombre:'Inactivo'},
						{est_codigo:1,est_nombre:'Activo'}
					]
				},
				listeners:{
					select:function(combo, arrRec, obj){ }
				}
			});
			
			var ingreso_funcionarios_funcionario_combo = Ext.create('Ext.form.field.ComboBox',{
				mode:'local',
				triggerAction:'all',
				anchor:'100%',
				pageSize:10,
				fieldLabel:'Nombre',
				forceSelection:true,
				name:'func_codigo', 
				displayField:'func_nombre',
				valueField:'func_codigo',
				store:{ fields:['func_codigo','func_nombre'],data:[{func_codigo:0,func_nombre:'Agustin Barona'}]},
				listeners:{
					select:function(combo, arrRec, obj){ }
				}
			});
			
			var ingreso_funcionarios_persona_autoriza_combo = Ext.create('Ext.form.field.ComboBox',{
				mode:'local',
				triggerAction:'all',
				anchor:'100%',
				pageSize:10,
				fieldLabel:'Autorizado por',
				forceSelection:true,
				name:'per_codigo', 
				displayField:'per_nombre',
				valueField:'per_codigo',
				store:{ fields:['per_codigo','per_nombre'],data:[{per_codigo:0,per_nombre:'Avis Fernando'}]},
				listeners:{
					select:function(combo, arrRec, obj){ }
				}
			});
		
            win = desktop.createWindow({
                title:'Registro Autorizaciones',
				id: 'authorization-win',
				iconCls: 'icon-biometric-authorization16',
				animCollapse:false,
				constrainHeader:true,
				border:false,
				layout:'column',
				width:800,
				items:[
					new Ext.tree.Panel({
						columnWidth:0.2,
						height:562,
						useArrows:true,
						store: new Ext.data.TreeStore({
							root: {
								expanded: true,
								children: [
									{ text: "Autorizaciones", expanded: true, children: [
										{ text: "Registro", leaf: true, expanded:true },
										{ text: "Aprobaci&oacute;n", leaf: true}
									] }
								]
							}
						}),
						rootVisible: false
					}),
					{
						xtype:'form',
						bodyStyle:'padding:5px',
						layout:'column',
						columnWidth:0.8,
						items:[
							{
								xtype:'fieldset',
								title:'Datos para la Autorizaci&oacute;n',
								columnWidth:1,
								layout:'column',
								items:[
									{
										xtype:'fieldset',
										border:false,
										columnWidth:0.75,
										items:[
											ingreso_funcionarios_tipo_ingreso_combo,
											ingreso_funcionarios_estado_combo,
											ingreso_funcionarios_funcionario_combo,
											ingreso_funcionarios_persona_autoriza_combo,
											{
												xtype:'fieldcontainer',
												fieldLabel:'Fecha de ingreso',
												layout: 'hbox',
												defaults: {
													hideLabel: true
												},
												items:[
													{
														xtype:'datefield',
														name:'fecha_ingreso'
													},
													{
														xtype:'timefield',
														name:'hora_ingreso'
													}
												]
											},
											{
												xtype:'fieldcontainer',
												fieldLabel:'Fecha de salida',
												layout: 'hbox',
												defaults: {
													hideLabel: true
												},
												items:[
													{
														xtype:'datefield',
														name:'fecha_salida'
													},
													{
														xtype:'timefield',
														name:'hora_salida'
													}
												]
											},
											{
												xtype:'textfield',
												anchor:'100%',
												fieldLabel:'Vehiculo'
											},
											{
												xtype:'textfield',
												anchor:'100%',
												fieldLabel:'Equipos'
											},
											{
												xtype:'textarea',
												anchor:'100%',
												fieldLabel:'Motivo',
												height:50,
												name:'123'
											},
											{
												xtype: 'radiogroup',
												fieldLabel: 'ARP Vigente',
												vertical:true,
												width:200,
												items: [
													{ boxLabel: 'Si', name: 'rb', inputValue: '1', checked: true },
													{ boxLabel: 'No', name: 'rb', inputValue: '0' }
												]
											}
										]
									},
									{
										xtype:'fieldset',
										frame:true,
										border:false,
										columnWidth:0.25,
										items:[
											{
												xtype:'fieldset',
												height:120, 
												html:'<img src="images/user.png" height="110" width="110" />'
											},
											{
												xtype: 'filefield',
												name: 'pinta',
												buttonText:'...',
												labelWidth:30,
												anchor:'100%',
												fieldLabel: 'Foto'
											}
										]
									}
								]
							},
							{
								xtype:'fieldset',
								columnWidth:1,
								title:'Observaciones',
								anchor:'100%',
								items:[
									{
										xtype:'htmleditor',
										name:'algo',
										anchor:'100%'
									}
								]
							}
						],
						buttons:[
							{
								text:'Guardar',
								handler:function(){
									Ext.Msg.confirm('Impresi&oacute;n Autorizaci&oacute;n', '¿Desea realizar la impresión del tiquete?');
								}
							},
							{
								text:'Cancelar'
							}
						]
					}
				]
            });
        }
        return win;
    }
	

});

