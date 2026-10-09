create table leitores (
id serial primary key,
nome varchar(150) not null,
email varchar(150) unique not null,
cpf varchar(11) unique not null,
telefone varchar(20) not null,
data_cadastro timestamp default current_timestamp
);

insert into leitores (nome, email, cpf, telefone) values
('duda', 'duda@gmail.com', '12345678910', '48996943164'),
('maria', 'maria@gmail.com', '10987654321', '48998986565'),
('pedro', 'pedro@gmail.com', '12963852741', '55748965213'),
('gaia', 'gaia@gmail.com', '45678913256', '01509421131');

create table categorias (
id serial primary key,
nome varchar (50) unique not null 
);

insert into categorias (nome) values
('fantacia'),
('historia'),
('ficção'),
('romance');

CREATE TABLE livros (
    id           SERIAL PRIMARY KEY,
    categoria_id INT           NOT NULL,
    titulo       VARCHAR(150)  NOT NULL,
    isbn         VARCHAR(20)   NOT NULL UNIQUE,
    taxa_diaria  NUMERIC(10,2) NOT NULL CHECK (taxa_diaria > 0),
    disponivel   BOOLEAN       NOT NULL DEFAULT TRUE,
    FOREIGN KEY (categoria_id) REFERENCES categorias (id)
);

insert into livros (categoria_id,titulo,isbn,taxa_diaria,disponivel) values
(1, 'Duna',         '9788576573135', 6.50, TRUE),
(2, 'Sapiens',      '9788525432186', 4.00, TRUE),
(3, 'Código Limpo', '9788576082675', 8.00, FALSE),
(4, 'o novo amanhecer', '978465321321', 7.00, true);


CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    leitor_id INT NOT NULL,
    data_emprestimo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo' CHECK (status IN ('Ativo', 'Devolvido', 'Atrasado')),
    FOREIGN KEY (leitor_id) REFERENCES leitores (id)
);
