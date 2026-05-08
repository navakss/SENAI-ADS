function AbrirModal() {
    document.getElementById("modal-container").style.display = "block";
}

function FecharModal() {
    document.getElementById("modal-container").style.display = "none";
    limparCampos();
}

function AdicionarProduto() {
    const nome = document.getElementById("nome-produto").value;
    const imagem = document.getElementById("imagem-produto").value;
    const valor = document.getElementById("valor-produto").value;

    if (nome === "" || valor === "" || imagem === "") {
        alert("Preencha todos os campos!");
        return;
    }

    const container = document.querySelector(".container");
    const listaCards = document.querySelector(".cards");

    container.style.display = "block";

    const novoCard = document.createElement("div");
    novoCard.classList.add("card");

    novoCard.innerHTML = `
        <h4 class="nome">${nome}</h4>
        <img src="${imagem}" alt="${nome}">
        <h3 class="valor">R$ ${parseFloat(valor).toFixed(2)}</h3>
    `;

    listaCards.appendChild(novoCard);

    FecharModal();
}

function limparCampos() {
    document.getElementById("nome-produto").value = "";
    document.getElementById("imagem-produto").value = "";
    document.getElementById("valor-produto").value = "";
}