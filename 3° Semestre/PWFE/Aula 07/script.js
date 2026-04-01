const url = "https://receitasapi-b-2025.vercel.app/";
let receitas = [];

// Elementos
const containerCards = document.getElementById("container-cards");
const modal = document.getElementById("modalRec");
const formReceita = document.getElementById("formReceita");

// Iniciar buscando receitas da API
getReceitas();

function getReceitas() {
    fetch(`${url}receitas`)
        .then(response => response.json())
        .then(data => {
            receitas = data;
            renderReceitas();
        })
        .catch(err => console.error("Erro ao carregar receitas:", err));
}

function renderReceitas() {
    containerCards.innerHTML = ""; // Limpa antes de renderizar
    receitas.forEach(r => {
        const card = document.createElement("div");
        card.classList.add("card");
        card.innerHTML = `
            <img src="${r.img || 'https://via.placeholder.com/150'}" alt="${r.nome}">
            <h2>${r.nome}</h2>
            <p><strong>Tipo:</strong> ${r.tipo || 'Geral'}</p>
        `;
        
        // Ao clicar no card, abre os detalhes
        card.onclick = () => abrirPaginaReceita(r);
        
        containerCards.appendChild(card);
    });
}

function abrirModal() {
    modal.style.display = "flex";
}

function fecharModal() {
    modal.style.display = "none";
    formReceita.reset();
}

// Lógica para salvar nova receita
formReceita.onsubmit = (e) => {
    e.preventDefault();

    const novaRec = {
        nome: document.getElementById("nome").value,
        tipo: document.getElementById("tipo").value,
        ingredientes: document.getElementById("ingredientes").value,
        modoFazer: document.getElementById("modofazer").value,
        img: document.getElementById("img").value
    };

    // Adiciona localmente para teste (ou você pode fazer um POST para a API aqui)
    receitas.push(novaRec);
    renderReceitas();
    fecharModal();
};

function abrirPaginaReceita(receita) {
    const janela = window.open('', '_blank');
    janela.document.write(`
        <html>
        <head>
            <title>${receita.nome} - Dona Benta</title>
            <style>
                body { font-family: sans-serif; padding: 40px; background: #f5f5f5; line-height: 1.6; }
                .container { max-width: 800px; margin: auto; background: white; padding: 40px; border-radius: 20px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
                h1 { color: #ff008c; border-bottom: 3px solid #ff008c; padding-bottom: 10px; }
                img { width: 100%; max-height: 400px; object-fit: cover; border-radius: 15px; margin-bottom: 20px; }
                h3 { color: #222; margin-top: 20px; }
                p { white-space: pre-wrap; color: #444; }
            </style>
        </head>
        <body>
            <div class="container">
                <img src="${receita.img}" alt="${receita.nome}">
                <h1>${receita.nome}</h1>
                <h3>Ingredientes</h3>
                <p>${receita.ingredientes}</p>
                <h3>Modo de Preparo</h3>
                <p>${receita.modoFazer}</p>
            </div>
        </body>
        </html>
    `);
}