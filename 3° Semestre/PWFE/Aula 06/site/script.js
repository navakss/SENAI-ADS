const inputbusca = document.getElementById('busca');
const container = document.getElementById('grid-musicas');
const player = document.getElementById('audio-player')
const trackInfo = document.getElementById('track-info');

inputbusca.addEventListener('keypress', (e) => {
    if(e.key === 'Enter') {
        const termo = inputbusca.value;
        if(termo) buscarMusica(termo);
    }
});

// function buscarmusica(termo) {
//     // const antigo = document.getElementById('itunes-script');
//     // if(antigo) antigo.remove();

//     // const scrpit = document.createElement('script');
//     // scrpit.id = 'itunes-script';

//     // script.src = `https://itunes.apple.com/search?term=${termo}&media=musicc&limit=15&callback=porcessarResposta`;
// }

async function buscarMusica(termo) {
    try {
        const response = await fetch(`https://itunes.apple.com/search?term=${termo}&media=musicc&limit=15`);
        const data = await response.json();
        exibirResultados(data.results);
    } catch(error) {
        console.error("Error ao buscar música", error);
    }
}