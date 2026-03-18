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

};

    module.exports = {
        limiteParticipantes
    }