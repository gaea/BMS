function objectProperties(obj) {
    for (inx in obj) {
        console.log("PROPIEDAD: {" + inx + "} <------> VALOR: {" + obj[inx] + "}.");
    }
}

function getProperties(obj) {
    var keys = [];
    for (var key in obj) {
        keys.push(key);
    }
    return keys;
}

function upload(url, webMethod, extraparams, functionSuccess, functionFailure) {
    Ext.Ajax.request({
        method: 'POST',
        url: url + '?accion=' + webMethod,
        params: extraparams,
        waitTitle: 'Enviando',
        waitMsg: 'Enviando datos...',
        timeout: 180000,
        success: function(response) {
            obj = Ext.JSON.decode(response.responseText);
            functionSuccess(obj.data);
        },
        failure: function(response, opts) {
            obj = Ext.JSON.decode(response.responseText);
            functionFailure(obj);
        }
    });
}

function loadData(url, method, params, store, funcSucces, funcFailure) {
    upload(
        url,
        method,
        params,
        function(data) {
            store.loadData(data);
            if (funcSucces != null)
                funcSucces(data);
        },
        function(data) {
            if (funcFailure != null)
                funcFailure(data);
        }
    );
}

function loadCombo(page, module, params, store, combo) {
    loadData(page, module, params, store,
        function(data) {
            combo.bindStore(store);
        }
    , null);
}

function saveData(url, method, webParam, params, funcSucces, funcFailure) {
    upload(
        url,
        method,
        { objProperties: Ext.JSON.encode(params) },
        function(data) {
            Ext.Msg.alert('Mensaje', data.Message, function() { }, this);
            if (funcSucces != null)
                funcSucces(data);
        },
        function(data) {
            Ext.Msg.confirm('Error: ', data.Message, function() { }, this);
            if (funcFailure != null)
                funcFailure(data);
        }
    );
}

function deleteData(url, method, webParam, param, funcSucces, funcFailure) {
    upload(
        url,
        method,
        { objProperties: Ext.JSON.encode(param) },
        function(data) {
            Ext.Msg.alert('Mensaje', data.Message, function() { }, this);
            if (funcSucces != null)
                funcSucces(data);
        },
        function(data) {
            Ext.Msg.confirm('Error: ', data.Message, function() { }, this);
            if (funcFailure != null)
                funcFailure(data);
        }
    );
}

function setPhoto(val, x, store) {
        if (val != null && val != '') {
            return '<img src="../../images/photo/' + val + '" width=50 heigth=80 align=center />';
        }
        else {
            return '<img src="../../images/user.png" width=50 heigth=80 align=center />';
        }
}


function getStringFromBoolean(val){
	var render_value = '';
	if(val == true)
		render_value = 'Si';
	else
		render_value = 'No';
	return render_value;
}

function getValueFromStore(val, meta, rec, store, key, value) {
	var render_value = '';
	var ix = store.findBy(
	function(record, id) {
		if (record.get(key) == val) {
			render_value = record.get(value);
			return id;
		}
	}
	);
	return render_value;
}

function getMonthFromInt(month){
	var monthNames = [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ];
	return monthNames[month-1];
}

function getDocumentTypeFromInt(documentNumber){
	var documentType = [ "Cédula"];
	return documentType[documentNumber-1];
}
