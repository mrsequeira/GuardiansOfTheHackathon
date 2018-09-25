///////////////////////////////////////////////////////
// Arranque
///////////////////////////////////////////////////////
document.addEventListener('DOMContentLoaded', function main(e) {
    getstart.call();
    function getstart() {
        getTags()
            .then(tags => {
                let grelha = document.querySelector('#grelha-tags');

                for (let tag of tags) {
                    //console.log(folheto);
                    adicionarTags(tag);
                }
            });
    }
});

// Cria o <div /> de um Folheto, e adiciona-o à grelha
// de folhetos
function adicionarTags(tag) {
    let template = divFolheto(tag);

    let grelha = document.querySelector('#grelha-tags');

    grelha.appendChild(template);
}

///////////////////////////////////////////////////////
// Mostrar dados no ecrã
///////////////////////////////////////////////////////
function divFolheto(tag) {
    /**
    * Crio uma cópia do elemento HTML com ID "template-agente"
    * com a função "cloneNode". O "true" no "cloneNode" é para indicar
    * que quero também copiar os elementos filho.
    */
    let template = document.querySelector('#template-tag').cloneNode(true);
    template.removeAttribute('id');

    //template.querySelector('.list-group > li').textContent = tag.Info;
    let lblData = document.createElement("li");
    lblData.className = "list-group-item";
    lblData.textContent = tag.Info;
    let butao = document.createElement("button");
    butao.className = "btn btn-outline-danger btn-sm";
    butao.textContent = "Eliminar";
    lblData.appendChild(butao);
    template.querySelector('.list-group').appendChild(lblData);
    //template.querySelector('.list-group').appendChild(butao);
    return template;
}


// API DATA
function getTags() {
    var url = "/api/tags";
    return fetch(url, {
        method: "GET",
        header: { 'Accept': 'application/json' }
    })
        .then(function (resposta) {
            if (resposta.status === 200) {
                return resposta.json();
            } else {
                return Promise.reject(new Error("Erro ao obter tags"));
            }
        });
}


///////////////////////////////////////////////////////
// Formulário para adicionar um agente,
// e mostrar o agente criado.
///////////////////////////////////////////////////////

// Adicionar evento para submissão...
document.querySelector('#adicionar-tags').addEventListener('submit', function (e) {
    // Prevenir que o browser submeta o formulário por nós...
    e.preventDefault();

    // O this é o formulário submetido (<form id="adicionar-agente"></form>)
    let form = this;

    // Criar o objeto do Agente,
    // com os campos do Nome e da Esquadra,
    // através dos valores dos campos no formulário.
    let tag = {
        Info: form.querySelector('[name=info]').value
    };

    // Converter em JSON.
    let jsonData = JSON.stringify(tag);

    // Usar o fetch para enviar o JSON, como POST (quero CRIAR, logo POST)
    fetch('/api/tags', { // Ver  Api/AgentesController, método PostAgentes
        method: 'post', // Quero usar POST
        headers: { 'Content-Type': 'application/json' }, // Vou enviar JSON
        body: jsonData // Dados a enviar.
    })
        .then(resposta => { // Resposta da criação
            if (resposta.ok) { // "ok" indica se 200 <= status < 300.
                return resposta.json(); // JSON do Agente criado.
            } else {
                // Erro (vai parar ao catch abaixo)
                return resposta.json()
                    .then(erro => Promise.reject(erro));
            }
        })
        // Agente criado. "novoAgente" é o objeto do Agente.
        // vamos adicionar o novo agente ao ecrã.
        .then(newTags => adicionarTags(newTags))
        // Ocorreu um erro.
        .catch(erro => {
            // Ver o que se passou...
            // TPC: Mostrar o erro ao utilizador (ver objeto 'erro', estão lá os erros)
            console.error(erro);
        });
});
