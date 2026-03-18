let filmes = JSON.parse(localStorage.getItem("filmes")) || [];

document.addEventListener("DOMContentLoaded", () => {
    renderizarTabela();
});

function abrirModal(){
    document.getElementById("modal").style.display = "block";
}

function fecharModal(){
    document.getElementById("modal").style.display = "none";
    limparCampos();
}

function salvarCliente(){

    const capa = document.getElementById("capa").value.trim();
    const nome = document.getElementById("nome").value.trim();
    const genero = document.getElementById("genero").value.trim();
    const autor = document.getElementById("autor").value.trim();
    const lancamento = document.getElementById("lancamento").value;

    if(nome === "" || genero === ""){
        alert("Nome e Gênero são obrigatórios!");
        return;
    }

    const filmeExistente = filmes.find(filme => filme.nome === nome);

    if(filmeExistente){
        alert("Esse filme já está cadastrado!");
        return;
    }

    const novoFilme = {
        id: Date.now(),
        capa: capa,
        nome: nome,
        genero: genero,
        autor: autor,
        lancamento: lancamento
    };

    filmes.push(novoFilme);

    atualizarLocalStorage();
    renderizarTabela();
    fecharModal();
}

function renderizarTabela(){

    const tabela = document.getElementById("dados");
    tabela.innerHTML = "";

    filmes.forEach(filme => {

        const linha = `
        <tr>
            <td>
                <img src="${filme.capa}" width="60">
            </td>
            <td>${filme.nome}</td>
            <td>${filme.genero}</td>
            <td>${filme.autor}</td>
            <td>${filme.lancamento}</td>
            <td>

           
                <button onclick="excluirCliente(${filme.id})">Excluir</button>
            </td>
        </tr>
        `;

        tabela.innerHTML += linha;

    });

}

function excluirCliente(id){

    if(!confirm("Deseja excluir este filme?")){
        return;
    }

    filmes = filmes.filter(filme => filme.id !== id);

    atualizarLocalStorage();
    renderizarTabela();

}

function atualizarLocalStorage(){
    localStorage.setItem("filmes", JSON.stringify(filmes));
}

function limparCampos(){

    document.getElementById("capa").value = "";
    document.getElementById("nome").value = "";
    document.getElementById("genero").value = "";
    document.getElementById("autor").value = "";
    document.getElementById("lancamento").value = "";

}