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

function upload(url, webMethod, params, functionSuccess, functionFailure) {
    Ext.Ajax.request({
        method: 'POST',
        url: url + '/' + webMethod,
        jsonData: params,
        headers: { 'Content-Type': 'application/json;charset=utf-8' },
        waitTitle: 'Enviando',
        waitMsg: 'Enviando datos...',
        timeout: 180000,
        success: function(response) {
            obj = Ext.JSON.decode(response.responseText);
            data = Ext.JSON.decode(obj.d);
            functionSuccess(data);
        },
        failure: function(response, opts) {
            obj = Ext.JSON.decode(response.responseText);
            data = Ext.JSON.decode(obj.d);
            functionFailure(data);
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
            if (funcFailure != null) {
                funcFailure(data);
            }
        }
    );
}

function saveData(url, method, webParam, params) {
    upload(
        url,
        method,
        "{" + webParam + ":'" + Ext.JSON.encode(params) + "'}",
        function(data) {
            Ext.Msg.alert('Mensaje', data.Message, function() { }, this);
        },
        function(data) {
            Ext.Msg.confirm('Error: ', data.Message, function() { }, this);
        }
    );
}

function deleteData(url, method, webParam, param) {
    upload(
        url,
        method,
        "{ " + webParam + ": '" + param + "' }",
        function(data) {
            Ext.Msg.alert('Mensaje', data.Message, function() { loadData(); }, this);
        },
        function(data) {
            Ext.Msg.alert('Mensaje', data.Message, function() { loadData(); }, this);
        }
    );
}