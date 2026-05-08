const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    const data = req.body;

    try {
        const item = await prisma.turma.create({
            data
        });

        return res.status(201).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao cadastrar turma",
            detalhe: error.message
        });
    }
};

const listar = async (req, res) => {
    const { professorId } = req.query;

    try {
        const lista = await prisma.turma.findMany({
            where: professorId ? { professorId: Number(professorId) } : undefined
        });

        return res.status(200).json(lista);

    } catch (error) {
        return res.status(500).json({ erro: "Erro ao listar turmas" });
    }
};

const buscar = async (req, res) => {
    const { id } = req.params;

    try {
        const item = await prisma.turma.findUnique({
            where: { id: Number(id) },
            include: { atividades: true }
        });

        if (!item) {
            return res.status(404).json({ erro: "Turma não encontrada" });
        }

        return res.status(200).json(item);

    } catch (error) {
        return res.status(500).json({ erro: "Erro ao buscar turma" });
    }
};

const atualizar = async (req, res) => {
    const { id } = req.params;
    const dados = req.body;

    try {
        const item = await prisma.turma.update({
            where: { id: Number(id) },
            data: dados
        });

        return res.status(200).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao atualizar turma",
            detalhe: error.message
        });
    }
};

const excluir = async (req, res) => {
    const { id } = req.params;

    try {
        const turmaComAtividades = await prisma.turma.findUnique({
            where: { id: Number(id) },
            include: { atividades: true }
        });

        if (!turmaComAtividades) {
            return res.status(404).json({ erro: "Turma não encontrada" });
        }

        if (turmaComAtividades.atividades.length > 0) {
            return res.status(400).json({
                erro: "Você não pode excluir uma turma com atividades cadastradas"
            });
        }

        const item = await prisma.turma.delete({
            where: { id: Number(id) }
        });

        return res.status(200).json(item);

    } catch (error) {
        return res.status(400).json({
            erro: "Erro ao excluir turma",
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