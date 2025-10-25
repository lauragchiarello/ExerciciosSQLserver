create database bdescola;

CREATE TABLE tb_aluno(
codigo_aluno int primary key not null,
nome_aluno varchar(60) not null,
ano_nascimento int,
email varchar(50),
sexo char(1) not null
);

CREATE TABLE tb_curso(
codigo_curso int primary key not null,
nome_curso varchar(20) not null
);

CREATE TABLE tb_matricula(
	codigo_aluno int not null,
	codigo_curso int not null,
	FOREIGN KEY (codigo_aluno) REFERENCES tb_aluno (codigo_aluno),
	FOREIGN KEY (codigo_curso) REFERENCES tb_curso (codigo_curso)
);

INSERT INTO tb_aluno(codigo_aluno, nome_aluno, ano_nascimento, email, sexo)
VALUES (1 , 'Josiel Jardim', 1974,'josiel@exercicioSQL.com.br', 'M'),
(2,'Ana Maria', 1980 , 'ana@exercicioSQL.com.br','F'),
(3, 'João Pedro',1989, 'pedro@exercicioSQL.com.br', 'M')

INSERT INTO tb_curso (codigo_curso,nome_curso)
VALUES (1 , 'Medicina'),
(2,'Arquitetura'),
(3,'Filosofia'),
(4,'Informática'),
(5,'Jornalismo')

INSERT INTO tb_matricula(codigo_curso, codigo_aluno)
VALUES(1,1),
(1,2),
(2,3),
(5,3);

SELECT * 
FROM tb_aluno a

SELECT *
FROM tb_curso c

SELECT *
FROM tb_matricula


-- EXERCÍCIO 1
INSERT INTO tb_aluno (codigo_aluno, nome_aluno, ano_nascimento, email, sexo)
VALUES (4,'Pedro César', 1980,'pedro@exercicioSQL.com.br', 'M')

INSERT INTO tb_matricula(codigo_curso, codigo_aluno)
VALUES (4,4)

-- EXERCICIO 2
select
	a.nome_aluno,
	c.nome_curso
from tb_matricula as m
inner join tb_aluno as a on a.codigo_aluno = m.codigo_aluno
inner join tb_curso as c on c.codigo_curso = m.codigo_curso
ORDER BY nome_curso;

-- EXERCICIO 3
SELECT
	a.nome_aluno,
	a.email
from tb_aluno as a
where ano_nascimento < year(getdate()) - 18;

-- EXERCICIO 4
SELECT COUNT(*)
FROM TB_ALUNO;

-- EXERCICIO 5
SELECT 
	c.nome_curso,
	COUNT(c.codigo_curso) as quatidade_alunos
FROM tb_matricula as m
inner join tb_curso as c on c.codigo_curso = m.codigo_curso
group by c.nome_curso;

-- EXERCICIO 6
SELECT nome_aluno
FROM tb_aluno
WHERE ano_nascimento < year(getdate()) - 18;

-- EXERCICIO 7
SELECT nome_aluno
FROM tb_aluno 
WHERE sexo = 'F';

-- EXERCICIO 8
SELECT a.nome_aluno
FROM tb_matricula as m
inner join tb_aluno as a on a.codigo_aluno = m.codigo_aluno
inner join tb_curso as c on c.codigo_curso= m.codigo_curso
WHERE sexo = 'F' AND nome_curso = 'Medicina';

-- EXERCICIO 9
SELECT nome_curso
FROM tb_curso
ORDER BY nome_curso ASC;

--EXERCICIO 10

-- Crie uma consulta SQL que mostre o nome dos alunos e o nome dos cursos em que eles estão matriculados.
SELECT 
    a.nome_aluno,
    c.nome_curso
FROM tb_matricula AS m
INNER JOIN tb_aluno AS a ON a.codigo_aluno = m.codigo_aluno
INNER JOIN tb_curso AS c ON c.codigo_curso = m.codigo_curso;