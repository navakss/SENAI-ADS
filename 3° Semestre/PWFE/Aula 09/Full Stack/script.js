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

    // Aqui a mágica acontece: o container aparece só quando tem item
    container.style.display = "block";

    // Criamos o card do ZERO
    const novoCard = document.createElement("div");
    novoCard.classList.add("card");

    // Montamos o conteúdo dele com os dados do modal
    novoCard.innerHTML = `
        <h4 class="nome">${nome}</h4>
        <img src="${imagem}" alt="${nome}">
        <h3 class="valor">R$ ${parseFloat(valor).toFixed(2)}</h3>
    `;

    // Colocamos o card novo dentro da lista
    listaCards.appendChild(novoCard);

    FecharModal();
}

function limparCampos() {
    document.getElementById("nome-produto").value = "";
    document.getElementById("imagem-produto").value = "";
    document.getElementById("valor-produto").value = "";
}