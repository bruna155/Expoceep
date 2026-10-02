import sqlite3
import os

os.makedirs('../bd', exist_ok=True)
conn = sqlite3.connect('../bd/banco.db')

conn.execute('''
CREATE TABLE IF NOT EXISTS pontos_turisticos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    destino_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    descricao  TEXT,
    endereco TEXT,
    preco REAL,
    horario_abertura TEXT,
    horario_fechamento TEXT,
    imagem TEXT
)
''')

conn.commit()
conn.close()

print('Banco de dados criado com sucesso!')