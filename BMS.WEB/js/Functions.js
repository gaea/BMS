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