async function cadastrarPonto(event) {
    event.preventDefault();

    const destino_id = document.getElementById('destino_id').value;
    const nome = document.getElementById('nome').value;
    const descricao = document.getElementById('descricao').value;
    const endereco = document.getElementById('endereco').value;
    const preco = document.getElementById('preco').value;
    const horario_abertura = document.getElementById('horario_abertura').value;
    const horario_fechamento = document.getElementById('horario_fechamento').value;
    const imagem = document.getElementById('imagem').value;

    const mensagem = document.getElementById('mensagem-cadastro');

    try {

        const resposta = await fetch(
            'http://localhost:5000/pontos-turisticos',
            {
                method: 'POST',

                headers: {
                    'Content-Type': 'application/json'
                },

                body: JSON.stringify({
                    destino_id: Number(destino_id),
                    nome: nome,
                    descricao: descricao,
                    endereco: endereco,
                    preco: Number(preco),
                    horario_abertura: horario_abertura,
                    horario_fechamento: horario_fechamento,
                    imagem: imagem
                })
            }
        );

        if (resposta.ok) {

            mensagem.textContent = '✅ Cadastro realizado com sucesso!';
            mensagem.className = 'sucesso';

            document.getElementById('formulario').reset();

            carregarPontos();

        } else {

            mensagem.textContent = '❌ Não foi possível realizar o cadastro.';
            mensagem.className = 'erro';

        }

    } catch (erro) {

        console.error(erro);

        mensagem.textContent = '❌ Não foi possível realizar o cadastro.';
        mensagem.className = 'erro';
    }
}