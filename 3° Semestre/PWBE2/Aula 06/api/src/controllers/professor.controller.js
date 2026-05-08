const prisma = require("../data/prisma");

const login = async (req, res) => {
    const { email, senha } = req.body;

    if (!email || !email.includes("@")) {
        return res.status(400).json({ erro: "Email inválido" });
    }

    try {
        const professor = await prisma.professor.findUnique({
            where: { email }
        });

        if (!professor || professor.senha !== senha) {
            return res.status(401).json({
                erro: "Email ou senha inválidos"
            });
        }

        return res.status(200).json(professor);

    } catch (error) {
        return res.status(500).json({ erro: "Erro no login" });
    }
};

const cadastrar = async (req, res) => {
    const data = req.body;

    if (!data.email || !data.email.includes("@")) {
        return res.status(400).json({ erro: "Email inválido" });
    }

    try {
        const item = await prisma.professor.create({
            data
        });

        return res.status(201).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao cadastrar professor",
            detalhe: error.message
        });
    }
};

const listar = async (req, res) => {
    try {
        const lista = await prisma.professor.findMany();
        return res.status(200).json(lista);
    } catch (error) {
        return res.status(500).json({ erro: "Erro ao listar professores" });
    }
};

const buscar = async (req, res) => {
    const { id } = req.params;

    try {
        const item = await prisma.professor.findUnique({
            where: { id: Number(id) }
        });

        if (!item) {
            return res.status(404).json({ erro: "Professor não encontrado" });
        }

        return res.status(200).json(item);

    } catch (error) {
        return res.status(500).json({ erro: "Erro ao buscar professor" });
    }
};

const atualizar = async (req, res) => {
    const { id } = req.params;
    const dados = req.body;

    if (dados.email && !dados.email.includes("@")) {
        return res.status(400).json({ erro: "Email inválido" });
    }

    try {
        const item = await prisma.professor.update({
            where: { id: Number(id) },
            data: dados
        });

        return res.status(200).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao atualizar professor",
            detalhe: error.message
        });
    }
};

const excluir = async (req, res) => {
    const { id } = req.params;

    try {
        const item = await prisma.professor.delete({
            where: { id: Number(id) }
        });

        return res.status(200).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao excluir professor",
            detalhe: error.message
        });
    }
};

module.exports = {
    login,
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};