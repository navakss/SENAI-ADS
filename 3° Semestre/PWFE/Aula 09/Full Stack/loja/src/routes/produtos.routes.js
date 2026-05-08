const express = require('express');
const router = express.Router();

const produtoController = require('../controllers/produtos.controller');

router.post('/produtos', produtoController.cadastrar);
router.get('/produtos', produtoController.listar);
router.get('/produtos/:id', produtoController.buscarPorId);
router.put('/produtos/:id', produtoController.atualizar);
router.delete('/produtos/:id', produtoController.excluir);

module.exports = router;