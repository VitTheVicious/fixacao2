create database if not exists fixacao2;
use fixacao2;


-- 1.  Contar Produtos em Estoque
-- Escreva uma consulta que conte o total de produtos disponíveis em estoque.
select count(quantidade_estoque)
from produtos
where quantidade_estoque > 0;

-- 2. Média de Preços
-- Escreva uma consulta que calcule a média dos preços dos produtos.
select avg(preco)
from produtos;

-- 3. Listar Produtos com "Modelo 20" no Nome
-- Escreva uma consulta para encontrar todos os produtos que têm "Modelo 20" em seu nome, selecionando todas as informações desses produtos.
select nome
from produtos
where nome like "%Modelo 20";

-- 4. Produtos com Preço entre 50 e 150
-- Escreva uma consulta para selecionar o nome, preco e descricao dos produtos com preço entre 50 e 150.
select nome, preco, descricao
from produtos
where preco >= 50 and preco <=150;

-- 5. Listar os 5 Produtos Mais Baratos
-- Escreva uma consulta para listar o nome e preco dos 5 produtos mais baratos.
select nome,preco 
from produtos
order by preco asc
limit 0, 5;

-- 6. Produtos que Não Estão em Estoque
-- Escreva uma consulta para selecionar o nome dos produtos que não têm nenhum item em estoque.
select nome
from produtos
where quantidade_estoque = 0;

-- 7. Listar Produtos com Descrição
-- Escreva uma consulta para selecionar o nome e descricao dos produtos que possuem uma descrição (não é nula ou vazia).
select nome, descricao
from produtos
where descricao is not null;

-- 8. Produtos com Preço Acima da Média - fazer depois
-- Escreva uma consulta para selecionar o nome e preco dos produtos cujo preço está acima da média dos preços de todos os produtos.
select nome, preco
from produtos
where preco > (select avg(preco) from produtos);

-- 9. Selecionar Produtos com "SSD" no Nome
-- Escreva uma consulta para selecionar todas as informações dos produtos que têm "SSD" no nome.
select *
from produtos
where nome like "%SSD%";

-- 10. Produtos Ordenados por Preço em Ordem Decrescente
-- Escreva uma consulta para listar o nome e preco de todos os produtos, ordenados pelo preço em ordem decrescente.
select nome, preco
from produtos
order by preco desc;

-- 11. Listar Produtos com Quantidade de Estoque Par - fazer depois
-- Escreva uma consulta para selecionar o nome e quantidade_estoque dos produtos cuja quantidade em estoque é um número par.
select nome, quantidade_estoque
from produtos
where quantidade_estoque % 2 = 0;

-- 12. Selecionar Nome e Descrição de Produtos com Preço Inferior a 100 e em Estoque
-- Escreva uma consulta para selecionar o nome e descricao dos produtos que têm preço inferior a 100 e uma quantidade em estoque superior a 0.
select nome, descricao
from produtos
where preco < 100 and quantidade_estoque > 0;

CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(255) NOT NULL,
   endereco VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL UNIQUE,
   celular VARCHAR(20),
   data_nascimento DATE
);

CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(255) NOT NULL,
   preco DECIMAL(10, 2) NOT NULL,
   descricao TEXT,
   quantidade_estoque INT DEFAULT 0
);

CREATE TABLE pedidos (
   pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   data_compra DATE NOT NULL,
   valor_total DECIMAL(10, 2) NOT NULL,
   data_estimada_entrega DATE NOT NULL,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_pedido (
   item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   pedido_id INT NOT NULL,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   valor_unitario DECIMAL(10, 2) NOT NULL,
   valor_total DECIMAL(10, 2) NOT NULL,
   FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
 

INSERT INTO produtos (nome, preco, descricao, quantidade_estoque) VALUES
('Smartphone XYZ 5G', 1200.00, 'Última geração com 5G', 50),
('Laptop ABC Pro', 2500.00, '15 polegadas, 16GB RAM', 30),
('Headphones Bluetooth', 150.00, 'Redução de ruído ativa', 100),
('E-reader ReadLight', 200.00, 'Tela de 6 polegadas com luz embutida', 75),
('Cafeteira Expresso Max', 300.00, 'Prepara diferentes tipos de café', 40),
('Mixer de Mão PowerMix', 80.00, '5 velocidades, acessórios inclusos', 60),
('Teclado Mecânico Gamer', 130.00, 'Iluminação RGB, teclas anti-ghosting', 90),
('Smartwatch HealthTrack', 199.99, 'Monitoramento de saúde e atividades', 110),
('Tablet Galaxy Tab 10', 600.00, 'Tela de 10 polegadas, 64GB', 33),
('Drone Explorer Air', 750.00, 'Câmera 4K, 30 min de voo', 25),
('Fritadeira sem Óleo Digital', 200.00, '5L de capacidade, controle digital', 45),
('Câmera Digital SnapShot', 500.00, '20MP, zoom óptico 8x', 50),
('Console PlayBox Next', 400.00, 'Última geração, HDR10', 70),
('Mochila para Notebook', 60.00, 'Resistente à água, compartimentos múltiplos', 120),
('Kit de Ferramentas X-100', 90.00, '100 peças, inclui maleta', 80),
('Livro "O Segredo da Mente"', 20.00, 'Desvende os mistérios da mente humana', 150),
('Perfume Elegance 50ml', 75.00, 'Fragrância feminina, notas de jasmim', 65),
('Smart TV 4K 50 polegadas', 800.00, 'Ultra HD, conexões inteligentes', 40),
('Aspirador de Pó Robô', 299.99, 'Programável, silencioso e eficiente', 50),
('Bicicleta Speed 21 marchas', 450.00, 'Design leve e aerodinâmico', 35),
('Mouse Sem Fio Modelo 21', 25.00, 'Conexão estável até 10m', 50),
('Monitor LED 24\'\' Modelo 22', 185.00, 'Full HD, tempo de resposta 5ms', 80),
('Cadeira Gamer Modelo 23', 130.00, 'Ergonômica, suporta até 150kg', 110),
('SSD 1TB Modelo 24', 115.00, 'Leitura 550MB/s, gravação 520MB/s', 110),
('Placa de Vídeo GT 10XX Modelo 25', 220.00, '4GB GDDR5, 128 bits', 100),
('Memória RAM 8GB Modelo 26', 45.00, 'DDR4, 2666MHz', 105),
('Teclado Iluminado Modelo 27', 40.00, 'Conforto e precisão, backlight RGB', 60),
('Webcam Full HD Modelo 28', 55.00, '1080p, microfone integrado', 70),
('Impressora 3D Modelo 29', 305.00, 'Volume de construção 25x25x25cm', 35),
('Roteador Wi-Fi Modelo 30', 65.00, 'Dual Band, 1200Mbps', 45),
('Kit de Iluminação LED Modelo 31', 25.00, '16 cores, controle remoto', 75),
('Caixas de Som Bluetooth Modelo 32', 75.00, 'Estéreo, à prova d\'água', 90),
('Câmera de Segurança IP Modelo 33', 95.00, 'Visão noturna, notificações móveis', 50),
('Relógio Inteligente Fitness Modelo 34', 35.00, 'Monitora atividades, sono', 100),
('Microfone Condensador Modelo 35', 85.00, 'Ideal para streaming e podcasting', 55),
('Óculos de Realidade Virtual Modelo 36', 155.00, 'Compatível com PC e consoles', 30),
('Estação de Carregamento Modelo 37', 30.00, 'Carrega até 4 dispositivos simultaneamente', 80),
('Ventilador USB Portátil Modelo 38', 15.00, 'Silencioso, duas velocidades', 105),
('Lâmpada Inteligente Modelo 39', 25.00, '16 milhões de cores, Wi-Fi', 90),
('Máquina de Café Expresso Modelo 40', 95.00, 'Prepara bebidas com cápsulas', 60),
('Mouse Sem Fio Modelo 41', 30.00, 'Conexão estável até 10m', 55),
('Monitor LED 24\'\' Modelo 42', 190.00, 'Full HD, tempo de resposta 5ms', 85),
('Cadeira Gamer Modelo 43', 135.00, 'Ergonômica, suporta até 150kg', 115),
('SSD 1TB Modelo 44', 120.00, 'Leitura 550MB/s, gravação 520MB/s', 115),
('Placa de Vídeo GT 10XX Modelo 45', 225.00, '4GB GDDR5, 128 bits', 105),
('Memória RAM 8GB Modelo 46', 50.00, 'DDR4, 2666MHz', 110),
('Teclado Iluminado Modelo 47', 45.00, 'Conforto e precisão, backlight RGB', 65),
('Webcam Full HD Modelo 48', 60.00, '1080p, microfone integrado', 75),
('Impressora 3D Modelo 49', 310.00, 'Volume de construção 25x25x25cm', 40),
('Roteador Wi-Fi Modelo 50', 70.00, 'Dual Band, 1200Mbps', 50),
('Kit de Iluminação LED Modelo 51', 30.00, '16 cores, controle remoto', 80),
('Caixas de Som Bluetooth Modelo 52', 80.00, 'Estéreo, à prova d\'água', 95),
('Câmera de Segurança IP Modelo 53', 100.00, 'Visão noturna, notificações móveis', 55),
('Relógio Inteligente Fitness Modelo 54', 40.00, 'Monitora atividades, sono', 105),
('Microfone Condensador Modelo 55', 90.00, 'Ideal para streaming e podcasting', 60),
('Óculos de Realidade Virtual Modelo 56', 160.00, 'Compatível com PC e consoles', 35),
('Estação de Carregamento Modelo 57', 35.00, 'Carrega até 4 dispositivos simultaneamente', 85),
('Ventilador USB Portátil Modelo 58', 20.00, 'Silencioso, duas velocidades', 110),
('Lâmpada Inteligente Modelo 59', 30.00, '16 milhões de cores, Wi-Fi', 95),
('Máquina de Café Expresso Modelo 60', 100.00, 'Prepara bebidas com cápsulas', 65),
('Mouse Sem Fio Modelo 61', 35.00, 'Conexão estável até 10m', 60),
('Monitor LED 24\'\' Modelo 62', 195.00, 'Full HD, tempo de resposta 5ms', 90),
('Cadeira Gamer Modelo 63', 140.00, 'Ergonômica, suporta até 150kg', 120),
('SSD 1TB Modelo 64', 125.00, 'Leitura 550MB/s, gravação 520MB/s', 120),
('Placa de Vídeo GT 10XX Modelo 65', 230.00, '4GB GDDR5, 128 bits', 110),
('Memória RAM 8GB Modelo 66', 55.00, 'DDR4, 2666MHz', 115),
('Teclado Iluminado Modelo 67', 50.00, 'Conforto e precisão, backlight RGB', 70),
('Webcam Full HD Modelo 68', 65.00, '1080p, microfone integrado', 80),
('Impressora 3D Modelo 69', 315.00, 'Volume de construção 25x25x25cm', 45),
('Roteador Wi-Fi Modelo 70', 75.00, 'Dual Band, 1200Mbps', 55),
('Kit de Iluminação LED Modelo 71', 35.00, '16 cores, controle remoto', 85),
('Caixas de Som Bluetooth Modelo 72', 85.00, 'Estéreo, à prova d\'água', 100),
('Câmera de Segurança IP Modelo 73', 105.00, 'Visão noturna, notificações móveis', 60),
('Relógio Inteligente Fitness Modelo 74', 45.00, 'Monitora atividades, sono', 110),
('Microfone Condensador Modelo 75', 95.00, 'Ideal para streaming e podcasting', 65),
('Óculos de Realidade Virtual Modelo 76', 165.00, 'Compatível com PC e consoles', 40),
('Estação de Carregamento Modelo 77', 40.00, 'Carrega até 4 dispositivos simultaneamente', 90),
('Ventilador USB Portátil Modelo 78', 25.00, 'Silencioso, duas velocidades', 115),
('Lâmpada Inteligente Modelo 79', 35.00, '16 milhões de cores, Wi-Fi', 100),
('Máquina de Café Expresso Modelo 80', 105.00, 'Prepara bebidas com cápsulas', 70),
('Mouse Sem Fio Modelo 81', 40.00, 'Conexão estável até 10m', 65),
('Monitor LED 24\'\' Modelo 82', 200.00, 'Full HD, tempo de resposta 5ms', 95),
('Cadeira Gamer Modelo 83', 145.00, 'Ergonômica, suporta até 150kg', 125),
('SSD 1TB Modelo 84', 130.00, 'Leitura 550MB/s, gravação 520MB/s', 125),
('Placa de Vídeo GT 10XX Modelo 85', 235.00, '4GB GDDR5, 128 bits', 115),
('Memória RAM 8GB Modelo 86', 60.00, 'DDR4, 2666MHz', 120),
('Teclado Iluminado Modelo 87', 55.00, 'Conforto e precisão, backlight RGB', 75),
('Webcam Full HD Modelo 88', 70.00, '1080p, microfone integrado', 85),
('Impressora 3D Modelo 89', 320.00, 'Volume de construção 25x25x25cm', 50),
('Roteador Wi-Fi Modelo 90', 80.00, 'Dual Band, 1200Mbps', 60),
('Kit de Iluminação LED Modelo 91', 40.00, '16 cores, controle remoto', 90),
('Caixas de Som Bluetooth Modelo 92', 90.00, 'Estéreo, à prova d\'água', 105),
('Câmera de Segurança IP Modelo 93', 110.00, 'Visão noturna, notificações móveis', 65),
('Relógio Inteligente Fitness Modelo 94', 50.00, 'Monitora atividades, sono', 115),
('Microfone Condensador Modelo 95', 100.00, 'Ideal para streaming e podcasting', 70),
('Óculos de Realidade Virtual Modelo 96', 170.00, 'Compatível com PC e consoles', 45),
('Estação de Carregamento Modelo 97', 45.00, 'Carrega até 4 dispositivos simultaneamente', 95),
('Ventilador USB Portátil Modelo 98', 30.00, 'Silencioso, duas velocidades', 120),
('Lâmpada Inteligente Modelo 99', 40.00, '16 milhões de cores, Wi-Fi', 105),
('Máquina de Café Expresso Modelo 100', 110.00, 'Prepara bebidas com cápsulas', 75);