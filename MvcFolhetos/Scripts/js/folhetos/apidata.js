
///////////////////////////////////////////////////////
// Leitura de dados
///////////////////////////////////////////////////////

function getFolhetos() {
    var url = "/api/folhetos";
    return fetch(url, {
        method: "GET",
        header: { 'Accept': 'application/json' }
    })
        .then(function (resposta) {
            if (resposta.status === 200) {
                return resposta.json();
            } else {
                return Promise.reject(new Error("Erro ao obter folhetos"));
            }
        });
}

function getFolhetosByID(folhetoID) {
    var url = "/api/folhetos/" + folhetoID;
    return fetch(url, {
        method: "GET",
        header: { 'Accept': 'application/json' }
    })
        .then(function (resposta) {
            if (resposta.status === 200) {
                
                return resposta.json();
            } else {
                return Promise.reject(new Error("Erro ao obter folhetos"));
            }
        });
}


function destroyFolheto(folhetoID) {
    var url = "/api/folhetos/" + folhetoID;
    return fetch(url, {
        method: "DELETE",
        header: { 'Accept': 'application/json' }
    })
        .then(function (resposta) {
            if (resposta.status === 200) {
                return resposta.json();
            } else {
                return Promise.reject(new Error("Erro ao obter folhetos"));
            }
        });
}

function getFolhetosNumPaginas(folhetoID) {
    var url = "/api/folhetos/" + folhetoID + "/Paginas";
    return fetch(url, {
        method: "GET",
        header: { 'Accept': 'application/json' }
    })
        .then(function (resposta) {
            if (resposta.status === 200) {
                console.log(resposta);
                return resposta.json();
            } else {
                return Promise.reject(new Error("Erro ao obter folhetos"));
            }
        });
}