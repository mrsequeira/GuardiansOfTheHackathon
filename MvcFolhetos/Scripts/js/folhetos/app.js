///////////////////////////////////////////////////////
// Arranque
///////////////////////////////////////////////////////
document.addEventListener('DOMContentLoaded', function main(e) {


    /**
    * Inicia o ecrã dos folhetos.
    */
    getstart.call();
    function getstart() {
        getFolhetos()
            .then(folhetos => {
                let grelha = document.querySelector('#grelha-folhetos');

                for (let folheto of folhetos) {
                    //console.log(folheto);
                    adicionarFolheto(folheto);
                }
            });
    }
 
    // Cria o <div /> de um Folheto, e adiciona-o à grelha
    // de folhetos
    function adicionarFolheto(folheto) {
        let template = divFolheto(folheto);

        let grelha = document.querySelector('#grelha-folhetos');

        grelha.appendChild(template);
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
        // A partir do template, obter o <img />
        let fotoFolheto = template.querySelector('img');

        
        //fotoFolheto.max-height = "250px";
        //colocar try catch aqui, caso nao haja imagem nao colocar nada

        template.querySelector('.card-header').textContent = folheto.NomeEmpresa;
        fotoFolheto.src = "/imagens/folheto" + folheto.FolhetosID + "/pagina1.jpeg";

        // Defino o nome e a esquadra no template...
        var d = new Date();
        var n = d.toDateString();
        console.log(n);

        template.querySelector('.card-body > h6').textContent = folheto.Titulo;
        template.querySelector('.card-footer').textContent = folheto.DataInic + " a " + folheto.DataFim;//
        fotoFolheto.addEventListener('click', function (e) {
            console.log(folheto.FolhetosID);
            ecraDetalhes(folheto.FolhetosID);

        });
        template.querySelector('.card-body > button').addEventListener('click', function (e) {
            console.log(folheto.FolhetoID);
            eliminarFolheto(folheto.FolhetosID);
        });


        return template;
    }

    function eliminarFolheto(Folhetodelete) {
        destroyFolheto(Folhetodelete)
            .then(function (info) {
                console.log(info);
                getFolhetos.call();
            })
            .catch(function (erro) {
                console.error(erro);
            });

    }
    ///////////////////////////////////////////////////////
    // Get informação e limpeza 
    ///////////////////////////////////////////////////////
    function ecraDetalhes(folhetoEscolhidoID) {
        let grelha = document.querySelector('#grelha-folhetos'); 
        grelha.innerHTML = "";

        return getFolhetosByID(folhetoEscolhidoID)
            .then(function (info) {
                console.log(info);
                mostraDetalhes(info);
            })
            .catch(function (erro){
            console.error(erro);
            });


    }
    ///////////////////////////////////////////////////////
    // Mostrar detalhes dos folhetos
    ///////////////////////////////////////////////////////
    function mostraDetalhes(info) {
        let carousel = document.querySelector('#carouselExampleIndicators').cloneNode(true);
        let grelha = document.querySelector('#grelha-folhetos');


        // A partir do template, obter o <img />
        //let fotoFolheto = document.createElement("img");
        //let fotoFolheto = template.querySelector('img');
        //colocar try catch aqui, caso nao haja imagem nao colocar nada
        var i = 1;
        imgSource = "/imagens/folheto" + info.FolhetosID + "/pagina" + i + ".jpeg";
        //fotoFolheto.src = imgSource;


        carousel.querySelector('.carousel-item > img').src = imgSource;
        

        //let nPaginas = getFolhetosNumPaginas(info.FolhetosID);
        //console.log(nPaginas);
        //console.log(info.Titulo);
        //for (i = 1; i < nPaginas.npaginas; i++) {
        //    fotoFolheto.src = imgSource;
        //}
        //// Defino o nome e a esquadra no template...

        let lblTitulo = document.createElement("h5");
        lblTitulo.textContent = info.Titulo;

        let lblData = document.createElement("p");
        lblData.textContent = info.DataInic + " a "+ info.DataFim;

        let lbldescription = document.createElement("p");
        lbldescription.textContent = info.Descricao;

        grelha.appendChild(lbldescription);
        grelha.appendChild(carousel);
        grelha.appendChild(lblData);

        //grelha.appendChild(template);  
        return template;
    }

    ///////////////////////////////////////////////////////
    // Formulário para adicionar um agente,
    // e mostrar o agente criado.
    ///////////////////////////////////////////////////////

    // Adicionar evento para submissão...
    document.querySelector('#adicionar-folheto').addEventListener('submit', function (e) {
        // Prevenir que o browser submeta o formulário por nós...
        e.preventDefault();

        // O this é o formulário submetido (<form id="adicionar-agente"></form>)
        let form = this;

        // Criar o objeto do Agente,
        // com os campos do Nome e da Esquadra,
        // através dos valores dos campos no formulário.
        let folheto = {
            Titulo: form.querySelector('[name=titulo]').value,
            Descricao: form.querySelector('[name=descricao]').value,
            DataInic: form.querySelector('[name=datainic]').value,
            DataFim: form.querySelector('[name=datafim]').value,
            NomeEmpresa: form.querySelector('[name=nomeempresa]').value
        };

        // Converter em JSON.
        let jsonData = JSON.stringify(folheto);

        // Usar o fetch para enviar o JSON, como POST (quero CRIAR, logo POST)
        fetch('/api/folhetos', { // Ver  Api/AgentesController, método PostAgentes
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
            .then(novoFolheto => adicionarFolheto(novoFolheto))
            // Ocorreu um erro.
            .catch(erro => {
                // Ver o que se passou...
                // TPC: Mostrar o erro ao utilizador (ver objeto 'erro', estão lá os erros)
                console.error(erro);
            });
    });
});