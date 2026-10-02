🌿 Turismo de Cascavel

Projeto web desenvolvido para apresentar e cadastrar pontos turísticos da cidade de Cascavel - Paraná.

A aplicação permite visualizar lugares turísticos de Cascavel e cadastrar novos pontos turísticos. Os dados cadastrados são armazenados em um banco de dados SQLite, utilizando uma API desenvolvida em Flask.

📌 Sobre o projeto

O projeto foi desenvolvido como uma aplicação de Gestão de Turismo, com o objetivo de criar uma página simples, intuitiva e responsiva para apresentar lugares de interesse turístico em Cascavel.

A aplicação possui um frontend desenvolvido com HTML, CSS e JavaScript e um backend desenvolvido em Python com Flask.

✨ Funcionalidades

Visualização de pontos turísticos de Cascavel.

Apresentação de lugares para conhecer.

Cadastro de novos pontos turísticos.

Armazenamento dos dados em banco SQLite.

API REST utilizando Flask.

Comunicação entre frontend e backend.

Formulário para cadastro de pontos turísticos.

Layout responsivo para computadores e celulares.

🏙️ Pontos turísticos

O projeto apresenta alguns lugares de Cascavel, como:

🌳 Parque Ecológico Paulo Gorski

🌊 Lago Municipal de Cascavel

⛪ Catedral Nossa Senhora Aparecida

🏛️ Museu Histórico de Cascavel

🛠️ Tecnologias utilizadas
Frontend

HTML5

CSS3

JavaScript

Backend

Python

Flask

Flask-CORS

Banco de dados

SQLite

📁 Estrutura do projeto
turismo-cascavel/
│
├── backend/
│   ├── app.py
│   ├── criar_banco.py
│   └── database.py
│
├── bd/
│   └── banco.db
│
├── css/
│   └── style.css
│
├── js/
│   └── main.js
│
├── imagens/
│   └── cascavel.jpg
│
├── index.html
│
└── README.md

🗄️ Banco de dados

O projeto utiliza SQLite para armazenar os pontos turísticos cadastrados.

A tabela utilizada é pontos_turisticos.

Estrutura da tabela
CREATE TABLE IF NOT EXISTS pontos_turisticos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    destino_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    descricao TEXT,
    endereco TEXT,
    preco REAL,
    horario_abertura TEXT,
    horario_fechamento TEXT,
    imagem TEXT
);

Campos
Campo	Tipo	Descrição
id	INTEGER	Identificador do ponto turístico
destino_id	INTEGER	Identificador do destino
nome	TEXT	Nome do ponto turístico
descricao	TEXT	Descrição do local
endereco	TEXT	Endereço do local
preco	REAL	Preço para visitação
horario_abertura	TEXT	Horário de abertura
horario_fechamento	TEXT	Horário de fechamento
imagem	TEXT	Nome ou caminho da imagem
🔌 API

O backend utiliza Flask para disponibilizar uma API REST.

Listar pontos turísticos
GET /pontos-turisticos


Retorna todos os pontos turísticos cadastrados no banco de dados.

Cadastrar ponto turístico
POST /pontos-turisticos


Exemplo de dados enviados:

{
    "destino_id": 1,
    "nome": "Lago Municipal",
    "descricao": "Local para lazer e caminhadas.",
    "endereco": "Cascavel - PR",
    "preco": 0,
    "horario_abertura": "09:00",
    "horario_fechamento": "18:00",
    "imagem": "lago.jpg"
}

Atualizar ponto turístico
PUT /pontos-turisticos/<id>


Atualiza as informações de um ponto turístico existente.

Excluir ponto turístico
DELETE /pontos-turisticos/<id>


Remove um ponto turístico do banco de dados.

🚀 Como executar
1. Instalar o Python

É necessário ter o Python instalado.

Verifique a versão:

python --version

2. Instalar as dependências

Entre na pasta do backend:

cd backend


Instale o Flask e o Flask-CORS:

pip install flask flask-cors

3. Criar o banco de dados

Execute:

python criar_banco.py


Esse comando irá criar o banco SQLite:

bd/banco.db

4. Executar o servidor

Execute:

python app.py

O servidor será iniciado em:

http://localhost:5000

5. Abrir o projeto

Abra o arquivo index.html no navegador.

O frontend utilizará o JavaScript para se comunicar com a API Flask.

🔄 Funcionamento

O funcionamento do projeto ocorre da seguinte maneira:

Usuário
   ↓
HTML / CSS
   ↓
JavaScript
   ↓
API Flask
   ↓
Banco SQLite
   ↓
API Flask
   ↓
JavaScript
   ↓
Página atualizada


Quando um usuário cadastra um ponto turístico, o JavaScript envia os dados para a API Flask.

A API recebe as informações e salva os dados no banco SQLite.

📱 Responsividade

O projeto possui CSS responsivo para adaptar a interface a diferentes tamanhos de tela, incluindo computadores, tablets e celulares.

🎯 Objetivo

O objetivo do projeto é apresentar informações sobre pontos turísticos de Cascavel e permitir o cadastro de novos locais, utilizando uma aplicação web integrada a um banco de dados.

👨‍💻 Autor

Seu Nome

Projeto de Gestão de Turismo — Turismo de Cascavel.

📄 Licença

Este projeto foi desenvolvido para fins educacionais.