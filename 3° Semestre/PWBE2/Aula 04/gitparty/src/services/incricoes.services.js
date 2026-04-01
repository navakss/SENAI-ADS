const prisma = require("../data/prisma");

const limiteParticipantes = async (usuarioId, eventoId) => {
    const evento = await prisma.eventos.findUnique({
        where: { id:eventoId },
        include: {
            inscrcioes: true
        }
    });

    const numeroPartcipantes = evento.inscrcioes.filter(inscricao => inscricao.status == "CONFIRMADA").length;

    console.log(numeroPartcipantes);

    if(numeroPartcipantes == evento.capacidade_maxima) {
        return "LISTA_ESPERA";
    } else {
        return "CONFIRMADA";
    }
};

const verificarDuplicidade = async(usuarioId, eventoId) => {
    const cadastro = await prisma.inscricoes.findMany({
        where: {
            eventosId: eventoId,
            usuariosId: usuarioId
        }
    });

    if(cadastro.length > 0) throw new Error("Usuário já cadastrado.");
}

    module.exports = {
        limiteParticipantes,
        verificarDuplicidade
    }