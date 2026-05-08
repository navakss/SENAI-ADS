const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    const data = req.body;

    try {
        const turma = await prisma.turma.findUnique({
            where: { id: Number(data.turmaId) }
        });

        if (!turma) {
            return res.status(404).json({ erro: "Turma não encontrada" });
        }

        const item = await prisma.atividade.create({
            data
        });

        return res.status(201).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao cadastrar atividade",
            detalhe: error.message
        });
    }
};

const listar = async (req, res) => {
    const { turmaId } = req.query;

    try {
        const lista = await prisma.atividade.findMany({
            where: turmaId ? { turmaId: Number(turmaId) } : undefined
        });

        return res.status(200).json(lista);

    } catch (error) {
        return res.status(500).json({ erro: "Erro ao listar atividades" });
    }
};

const buscar = async (req, res) => {
    const { id } = req.params;

    try {
        const item = await prisma.atividade.findUnique({
            where: { id: Number(id) }
        });

        if (!item) {
            return res.status(404).json({ erro: "Atividade não encontrada" });
        }

        return res.status(200).json(item);

    } catch (error) {
        return res.status(500).json({ erro: "Erro ao buscar atividade" });
    }
};

const atualizar = async (req, res) => {
    const { id } = req.params;
    const dados = req.body;

    try {
        const item = await prisma.atividade.update({
            where: { id: Number(id) },
            data: dados
        });

        return res.status(200).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao atualizar atividade",
            detalhe: error.message
        });
    }
};

const excluir = async (req, res) => {
    const { id } = req.params;

    try {
        const item = await prisma.atividade.delete({
            where: { id: Number(id) }
        });

        return res.status(200).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao excluir atividade",
            detalhe: error.message
        });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
};