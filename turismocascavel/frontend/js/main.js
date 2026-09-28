async function cadastrarPontoTuristico(event) {
    event.preventDefault(); // Impede o recarregamento da página

    const nome = document.getElementById('nome').value; 
    const localizacao = document.getElementById('localizacao').value; 
    const descricao = document.getElementById('descricao').value;

    const resposta = await fetch('http://localhost:5000/pontos-turisticos', {
       method: 'POST', 
       headers: { 
        'Content-Type': 'application/json' 
    }, 
    body: JSON.stringify({ 
        nome: nome, 
        localizacao: localizacao, 
        descricao: descricao 
    }) 
});
    if (resposta.ok) {
        alert("Ponto turístico cadastrado com sucesso no banco SQLite!");
        carregarPontosTuristicos(); // Atualiza a lista na tela
    } else {
        alert("Erro ao cadastrar ponto turístico.");
    }
}

async function carregarPontosTuristicos() {
    const resposta = await fetch('http://localhost:5000/pontos-turisticos'); 
    const pontosTuristicos = await resposta.json(); 
    const lista = document.getElementById('lista-pontos-turisticos'); 
    lista.innerHTML = ''; 
    pontosTuristicos.forEach(ponto => { 
        const item = document.createElement('li'); 
        item.textContent = 
        `${ponto.nome} - Localização: ${ponto.localizacao} - ${ponto.descricao}`; 
    lista.appendChild(item); 
}); 
}
window.onload = carregarPontosTuristicos;