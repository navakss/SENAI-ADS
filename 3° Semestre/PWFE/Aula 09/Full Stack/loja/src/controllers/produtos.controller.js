const prisma = require('../data/prisma');

const cadastrar = async (req, res) => {
    try {
        const { nome, preco, imageUrl } = req.body;

        const novoProduto = await prisma.product.create({
            data: {
                nome: nome,
                preco: preco,
                imageUrl: imageUrl,
            },
        });

        return res.status(201).json(novoProduto);
    } catch (error) {
        return res.status(500).json({ error: "Erro ao cadastrar produto", detalhes: error.message });
    }
};

0
const listar = async (req, res) => {
    try {
        const produtos = await prisma.product.findMany();
        return res.status(200).json(produtos);
    } catch (error) {
        return res.status(500).json({ error: "Erro ao buscar produtos" });
    }
};

const buscarPorId = async (req, res) => {
    try {
        const { id } = req.params.id;
        const produto = await prisma.product.findUnique({
            where: { id: Number(id) },
        });

        if (!produto) {
            return res.status(404).json({ error: "Produto não encontrado" });
        }

        return res.status(200).json(produto);
    } catch (error) {
        return res.status(500).json({ error: "Erro ao buscar produto" });
    }
};

const atualizar = async (req, res) => {
    try {
        const { id } = req.params.id;
        const { nome, preco, imageUrl } = req.body;

        const produtoAtualizado = await prisma.product.update({
            where: { id: Number(id) },
            data: {
                name: nome,
                price: preco,
                imageUrl: imageUrl,
            },
        });

        return res.status(200).json(produtoAtualizado);
    } catch (error) {
        return res.status(500).json({ error: "Erro ao atualizar produto" });
    }
};

const excluir = async (req, res) => {
    try {
        const { id } = req.params.id;

        await prisma.product.delete({
            where: { id: Number(id) },
        });

        return res.status(204).send();
    } catch (error) {
        return res.status(500).json({ error: "Erro ao excluir produto" });
    }
};

module.exports = {
    cadastrar,
    listar,
    buscarPorId,
    atualizar,
    excluir
};