-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/09/2026 às 23:04
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tursimodecascavel`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `ponto_turistico_id` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `data_avaliacao` text DEFAULT current_timestamp()
) ;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `usuario_id`, `ponto_turistico_id`, `nota`, `comentario`, `data_avaliacao`) VALUES
(1, 1, 1, 5, 'Lugar incrível, recomendo muito!', '2026-09-14 17:19:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`, `descricao`) VALUES
(1, 'Parque', 'Áreas verdes e espaços de lazer'),
(2, 'Museu', 'Locais relacionados à cultura e história'),
(3, 'Religioso', 'Locais de importância religiosa'),
(4, 'Lazer', 'Locais destinados ao entretenimento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `estado` text NOT NULL,
  `descricao` text DEFAULT NULL,
  `imagem` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `estado`, `descricao`, `imagem`) VALUES
(1, 'Foz do Iguaçu', 'Paraná', 'Cidade famosa pelas Cataratas do Iguaçu.', 'foz.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_evento` date NOT NULL,
  `horario` time DEFAULT NULL,
  `local_evento` varchar(200) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `evento`
--

INSERT INTO `evento` (`id_evento`, `nome`, `descricao`, `data_evento`, `horario`, `local_evento`, `capacidade`) VALUES
(1, 'Festival de Turismo de Cascavel', 'Evento voltado ao turismo e cultura local', '2026-10-10', '14:00:00', 'Centro de Eventos de Cascavel', 500),
(2, 'Feira Cultural de Cascavel', 'Feira com atrações culturais e gastronômicas', '2026-11-15', '10:00:00', 'Centro da cidade', 300);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pontos_turisticos`
--

CREATE TABLE `pontos_turisticos` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `descricao` text DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `horario_abertura` text DEFAULT NULL,
  `horario_fechamento` text DEFAULT NULL,
  `imagem` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pontos_turisticos`
--

INSERT INTO `pontos_turisticos` (`id`, `destino_id`, `nome`, `descricao`, `endereco`, `preco`, `horario_abertura`, `horario_fechamento`, `imagem`) VALUES
(1, 1, 'Cataratas do Iguaçu', 'Uma das maiores atrações naturais do Brasil.', 'Parque Nacional do Iguaçu', 100, '09:00', '17:00', 'cataratas.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `quantidade_pessoas` int(11) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `id_turista` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `data_reserva`, `quantidade_pessoas`, `status`, `id_turista`, `id_evento`) VALUES
(1, '2026-09-14', 2, 'Confirmada', 1, 1),
(2, '2026-09-14', 3, 'Pendente', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turista`
--

CREATE TABLE `turista` (
  `id_turista` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cidade_origem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turista`
--

INSERT INTO `turista` (`id_turista`, `nome`, `email`, `telefone`, `cidade_origem`) VALUES
(1, 'João da Silva', 'joao@email.com', '45999999999', 'São Paulo'),
(2, 'Maria Souza', 'maria@email.com', '45988888888', 'Curitiba'),
(3, 'Pedro Santos', 'pedro@email.com', '45977777777', 'Londrina');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `email` text NOT NULL,
  `senha` text NOT NULL,
  `tipo` text DEFAULT 'turista'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'João Silva', 'joao@email.com', 'senha123', 'turista');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `ponto_turistico_id` (`ponto_turistico_id`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`);

--
-- Índices de tabela `pontos_turisticos`
--
ALTER TABLE `pontos_turisticos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_turista` (`id_turista`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Índices de tabela `turista`
--
ALTER TABLE `turista`
  ADD PRIMARY KEY (`id_turista`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pontos_turisticos`
--
ALTER TABLE `pontos_turisticos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `turista`
--
ALTER TABLE `turista`
  MODIFY `id_turista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`ponto_turistico_id`) REFERENCES `pontos_turisticos` (`id`);

--
-- Restrições para tabelas `pontos_turisticos`
--
ALTER TABLE `pontos_turisticos`
  ADD CONSTRAINT `pontos_turisticos_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_turista`) REFERENCES `turista` (`id_turista`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
