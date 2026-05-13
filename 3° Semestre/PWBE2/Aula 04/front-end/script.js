const API = "http://localhost:3000";

const request = async (url, options = {}) => {
    const res = await fetch(API + url, {
        headers: { "Content-Type": "application/json" },
        ...options
    });

    return res.json();
};

const get = (id) => document.getElementById(id);

window.addEventListener("DOMContentLoaded", () => {

    const modalEvento = get("modal-evento");
    const modalUsuario = get("modal-usuario");

    get("btn-evento").onclick = () => modalEvento.style.display = "flex";
    get("btn-usuario").onclick = () => modalUsuario.style.display = "flex";

    window.onclick = (e) => {
        if (e.target === modalEvento) modalEvento.style.display = "none";
        if (e.target === modalUsuario) modalUsuario.style.display = "none";
    };

    carregarEventos();
    carregarUsuarios();

    get("form-evento-modal").onsubmit = criarEvento;
    get("form-usuario-modal").onsubmit = criarUsuario;
});

async function carregarEventos() {

    const container = get("lista-eventos");
    const eventos = await request("/eventos/listar");

    container.innerHTML = (eventos || []).map(e => {

        const img = e.imagens?.length
            ? `http://localhost:3000/${e.imagens[0].path}`
            : "https://picsum.photos/600/400";

        return `
            <div class="evento-card">

                <img class="evento-img" src="${img}">

                <div class="evento-content">

                    <h3>${e.titulo}</h3>
                    <p>${e.descricao}</p>

                    <span>${e.local}</span>

                    <button class="delete-btn" onclick="deletarEvento(${e.id})">
                        Excluir
                    </button>

                </div>

            </div>
        `;
    }).join("");
}

async function criarEvento(e) {
    e.preventDefault();

    const payload = {
        titulo: get("titulo-evento").value,
        descricao: get("descricao-evento").value,
        data_evento: get("data-evento").value,
        local: get("local-evento").value,
        capacidade_maxima: Number(get("capacidade-evento").value)
    };

    await request("/eventos/cadastrar", {
        method: "POST",
        body: JSON.stringify(payload)
    });

    get("modal-evento").style.display = "none";
    carregarEventos();
}

async function deletarEvento(id) {
    await request(`/eventos/excluir/${id}`, {
        method: "DELETE"
    });

    carregarEventos();
}

async function carregarUsuarios() {

    const container = get("lista-usuarios");
    const usuarios = await request("/usuarios/listar");

    container.innerHTML = (usuarios || []).map(u => `
        <div class="evento-card">
            <h3>${u.nome}</h3>
            <p>${u.email}</p>
        </div>
    `).join("");
}

async function criarUsuario(e) {
    e.preventDefault();

    const payload = {
        nome: get("nome-usuario").value,
        email: get("email-usuario").value,
        senha: get("senha-usuario").value
    };

    await request("/usuarios/cadastrar", {
        method: "POST",
        body: JSON.stringify(payload)
    });

    get("modal-usuario").style.display = "none";
    carregarUsuarios();
}