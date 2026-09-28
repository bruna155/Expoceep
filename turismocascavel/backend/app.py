from flask import Flask, jsonify, request
from flask_cors import CORS
from database import get_db_connection

app = Flask(__name__)
CORS(app)

@app.route('/', methods=['GET http://localhost:5000/PontoTuristicos'])
def status_api():
    return jsonify({
        "projeto": "Turismo de Cascavel",
        "status": "API em Python/Flask funcionando perfeitamente!",
        "etapa": 1
    }), 200


if __name__ == '__main__':
    app.run(
        debug=True,
        host='0.0.0.0',
        port=5000
    )

@app.route('/turismo-cascavel', methods=['GET'])
def listar_turismos():
    conn = get_db_connection()
    # Busca todos os turismos cadastrados
    turismos_cursor = conn.execute('SELECT * FROM turismos').fetchall()
    conn.close()
    
    # Converte cada linha do banco em um dicionário Python
    lista_turismo = [dict(turismo) for turismo in turismos_cursor]

    return jsonify(lista_turismo), 200


def cadastrar_turismo():
    dados = request.get_json() # Captura o JSON enviado pelo cliente/front-end
    
    nome = dados.get('nome')
    descricao = dados.get('descricao')

    # Validação simples no Back-End
    if not nome or not turno:
        return jsonify({"erro": "Os campos 'nome' e 'turno' são obrigatórios!"}), 400

conn = get_db_connection()
cursor = conn.cursor()
cursor.execute('INSERT INTO turismos (nome, descricao) VALUES (?, ?)', (nome, descricao))
conn.commit() # Salva a alteração no banco
novo_id = cursor.lastrowid
conn.close()
return jsonify({"mensagem": "Turismo criado com sucesso!", "id": novo_id}), 201
