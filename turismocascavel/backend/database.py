import sqlite3
import os

# Caminho absoluto para o banco dentro de /bd/banco.db
DB_PATH = os.path.join(os.path.dirname(__file__), '..', 'bd', 'banco.db')

def get_db_connection():
    """Abre e retorna uma conexão com o banco de dados SQLite."""
    conn = sqlite3.connect(DB_PATH)
    # Permite acessar colunas pelos nomes (ex: linha['nome']) em vez de índices (linha[0])
    conn.row_factory = sqlite3.Row
    return conn