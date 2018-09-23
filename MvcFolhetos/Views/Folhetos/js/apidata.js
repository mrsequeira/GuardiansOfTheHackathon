///////////////////////////////////////////////////////
// Leitura de dados
///////////////////////////////////////////////////////

function getFolhetos() {
    return fetch("/api/folhetos", {
        header: { 'Accept': 'application/json' }
    })
    .then(resposta => resposta.json());
}

///////////////////////////////////////////////////////
// Mostrar dados no ecrã
///////////////////////////////////////////////////////

function divFolheto(folheto) {
    /**
    * Crio uma cópia do elemento HTML com ID "template-agente"
    * com a função "cloneNode". O "true" no "cloneNode" é para indicar
    * que quero também copiar os elementos filho.
    */
    let template = document.querySelector('#template-folheto').cloneNode(true);
    template.removeAttribute('id');
    if (folheto.FolhetoID != null) {
        fotoFolheto.src = `/imagens/folheto$(folheto.FolhetoID}/pagina1.jpeg`;
    } else {
        fotoFolheto.classList.add('hidden');
    }
        
    // Defino o nome e a esquadra no template...
    template.querySelector('.caption > h3').textContent = folheto.Titulo;
    template.querySelector('.caption > p').textContent = `De ${folheto.DataInic} a ${folheto.DataFim} `;

    return template;
}
//    /**
//    * Cria o <div /> de um Folheto, e adiciona-o à grelha
//    * de folhetos
//    **/
function adicionarFolheto(folheto) {
    let template = divFolheto(folheto);

    let grelha = document.querySelector('#grelha-folheto');

    grelha.appendChild(template);
}
///////////////////////////////////////////////////////
// Arranque
///////////////////////////////////////////////////////

/**
 * Inicia o ecrã dos folhetos.
 */
function iniciarFolhetos() {
    getFolhetos()
        .then(folhetos => {
            let grelha = document.querySelector('#grelha-folhetos');

            for (let folheto of folhetos) {
                adicionarFolheto(folheto);
            }
        })
}

iniciarFolhetos();


