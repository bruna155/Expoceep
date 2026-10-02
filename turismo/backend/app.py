from flask import Flask, jsonify, request
from flask_cors import CORS
from database import get_db_connection

app = Flask(__name__)
CORS(app)


# GET - LISTAR PONTOS TURÍSTICOS
@app.route('/pontos-turisticos', methods=['GET'])
def listar_pontos():
    conn = get_db_connection()

    pontos = conn.execute(
        'SELECT * FROM pontos_turisticos'
    ).fetchall()

    conn.close()

    lista = []

    for ponto in pontos:
        lista.append({
            'id': ponto['id'],
            'destino_id': ponto['destino_id'],
            'nome': ponto['nome'],
            'descricao': ponto['descricao'],
            'endereco': ponto['endereco'],
            'preco': ponto['preco'],
            'horario_abertura': ponto['horario_abertura'],
            'horario_fechamento': ponto['horario_fechamento'],
            'imagem': ponto['imagem']
        })

    return jsonify(lista)


# POST - CADASTRAR PONTO TURÍSTICO
@app.route('/pontos-turisticos', methods=['POST'])
def cadastrar_ponto():
    dados = request.get_json()

    destino_id = dados.get('destino_id')
    nome = dados.get('nome')
    descricao = dados.get('descricao')
    endereco = dados.get('endereco')
    preco = dados.get('preco')
    horario_abertura = dados.get('horario_abertura')
    horario_fechamento = dados.get('horario_fechamento')
    imagem = dados.get('imagem')

    if not destino_id or not nome:
        return jsonify({
            'erro': 'O destino e o nome do ponto turístico são obrigatórios!'
        }), 400

    conn = get_db_connection()

    cursor = conn.execute(
        '''
        INSERT INTO pontos_turisticos
        (
            destino_id,
            nome,
            descricao,
            endereco,
            preco,
            horario_abertura,
            horario_fechamento,
            imagem
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''',
        (
            destino_id,
            nome,
            descricao,
            endereco,
            preco,
            horario_abertura,
            horario_fechamento,
            imagem
        )
    )

    conn.commit()

    novo_id = cursor.lastrowid

    conn.close()

    return jsonify({
        'mensagem': 'Ponto turístico cadastrado com sucesso!',
        'id': novo_id
    }), 201


# PUT - ATUALIZAR PONTO TURÍSTICO
@app.route('/pontos-turisticos/<int:id>', methods=['PUT'])
def atualizar_ponto(id):
    dados = request.get_json()

    nome = dados.get('nome')
    descricao = dados.get('descricao')
    endereco = dados.get('endereco')
    preco = dados.get('preco')
    horario_abertura = dados.get('horario_abertura')
    horario_fechamento = dados.get('horario_fechamento')
    imagem = dados.get('imagem')

    conn = get_db_connection()

    conn.execute(
        '''
        UPDATE pontos_turisticos
        SET
            nome = ?,
            descricao = ?,
            endereco = ?,
            preco = ?,
            horario_abertura = ?,
            horario_fechamento = ?,
            imagem = ?
        WHERE id = ?
        ''',
        (
            nome,
            descricao,
            endereco,
            preco,
            horario_abertura,
            horario_fechamento,
            imagem,
            id
        )
    )

    conn.commit()
    conn.close()

    return jsonify({
        'mensagem': 'Ponto turístico atualizado com sucesso!'
    })


# DELETE - EXCLUIR PONTO TURÍSTICO
@app.route('/pontos-turisticos/<int:id>', methods=['DELETE'])
def deletar_ponto(id):
    conn = get_db_connection()

    conn.execute(
        'DELETE FROM pontos_turisticos WHERE id = ?',
        (id,)
    )

    conn.commit()
    conn.close()

    return jsonify({
        'mensagem': 'Ponto turístico excluído com sucesso!'
    })


if __name__ == '__main__':
    app.run(debug=True)

