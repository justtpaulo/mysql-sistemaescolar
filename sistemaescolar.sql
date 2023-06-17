CREATE DATABASE bancoTeste;
USE bancoTeste;

CREATE TABLE turma (
    idTurma INT NOT NULL AUTO_INCREMENT,
    numero INT NOT NULL,
    serie INT NOT NULL,
    PRIMARY KEY (idTurma)
);

CREATE TABLE disciplinas (
    idDisciplinas INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    PRIMARY KEY (idDisciplinas)
);

CREATE TABLE disciplina (
    idDisciplina INT NOT NULL,
    idTurma INT NOT NULL,
    FOREIGN KEY (idDisciplina) REFERENCES disciplinas(idDisciplinas),
    FOREIGN KEY (idTurma) REFERENCES turma(idTurma)
);

CREATE TABLE aluno (
    idAluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    dataNascimento DATE,
    genero VARCHAR(20),
    PRIMARY KEY (idAluno)
);

CREATE TABLE matricula (
    idMatricula INT NOT NULL AUTO_INCREMENT,
    idAluno INT NOT NULL,
    idTurma INT NOT NULL,
    turno VARCHAR(10),
    FOREIGN KEY (idAluno) REFERENCES aluno(idAluno),
    FOREIGN KEY (idTurma) REFERENCES turma(idTurma),
    PRIMARY KEY (idMatricula)
);

CREATE TABLE avaliacao (
    idAvaliacao INT NOT NULL AUTO_INCREMENT,
    notaTeste DECIMAL(3,1) CHECK (notaTeste >= 0.0 AND notaTeste <= 10.0),
    notaProva DECIMAL(3,1) CHECK (notaProva >= 0.0 AND notaProva <= 10.0),
    media DECIMAL(3,1) CHECK (media >= 0.0 AND media <= 10.0),
    bimestre INT,
    idDisciplinas INT NOT NULL,
    idMatricula INT NOT NULL,
    PRIMARY KEY (idAvaliacao),
    FOREIGN KEY (idDisciplinas) REFERENCES disciplinas(idDisciplinas),
    FOREIGN KEY (idMatricula) REFERENCES matricula(idMatricula)
);

-- Inserindo valores na tabela "turma"
INSERT INTO turma (numero, serie) VALUES (1, 9);
INSERT INTO turma (numero, serie) VALUES (2, 10);
INSERT INTO turma (numero, serie) VALUES (3, 11);

-- Inserindo valores na tabela "disciplinas"
INSERT INTO disciplinas (nome) VALUES ('Matemática');
INSERT INTO disciplinas (nome) VALUES ('História');
INSERT INTO disciplinas (nome) VALUES ('Ciências');

-- Inserindo valores na tabela "disciplina"
INSERT INTO disciplina (idDisciplina, idTurma) VALUES (1, 1);
INSERT INTO disciplina (idDisciplina, idTurma) VALUES (2, 1);
INSERT INTO disciplina (idDisciplina, idTurma) VALUES (3, 2);
INSERT INTO disciplina (idDisciplina, idTurma) VALUES (1, 3);
INSERT INTO disciplina (idDisciplina, idTurma) VALUES (3, 3);

-- Inserindo valores na tabela "aluno"
INSERT INTO aluno (nome, dataNascimento, genero) VALUES ('João', '2005-02-10', 'Masculino');
INSERT INTO aluno (nome, dataNascimento, genero) VALUES ('Maria', '2006-05-15', 'Feminino');
INSERT INTO aluno (nome, dataNascimento, genero) VALUES ('Pedro', '2005-12-03', 'Masculino');

-- Criação do trigger
DELIMITER //
CREATE TRIGGER adiciona_turno BEFORE INSERT ON matricula
FOR EACH ROW
BEGIN
    DECLARE turno VARCHAR(10);
    
    SELECT CASE
        WHEN NEW.idTurma = 1 THEN 'Manhã'
        WHEN NEW.idTurma = 2 THEN 'Tarde'
        WHEN NEW.idTurma = 3 THEN 'Noite'
        ELSE 'Indefinido'
    END INTO turno;
    
    SET NEW.turno = turno;
END //
DELIMITER ;


-- Inserindo valores na tabela "matricula"
INSERT INTO matricula (idAluno, idTurma) VALUES (1, 1);
INSERT INTO matricula (idAluno, idTurma) VALUES (2, 1);
INSERT INTO matricula (idAluno, idTurma) VALUES (3, 2);

-- Inserindo valores na tabela "avaliacao"
INSERT INTO avaliacao (notaTeste, notaProva, media, bimestre, idDisciplinas, idMatricula) VALUES (8.5, 7.2, 7.8, 1, 1, 1);
INSERT INTO avaliacao (notaTeste, notaProva, media, bimestre, idDisciplinas, idMatricula) VALUES (6.3, 8.9, 7.6, 1, 2, 2);
INSERT INTO avaliacao (notaTeste, notaProva, media, bimestre, idDisciplinas, idMatricula) VALUES (7.8, 9.1, 8.4, 2, 3, 3);

SELECT * FROM disciplina;
SELECT * FROM disciplinas;
SELECT * FROM aluno;
SELECT * FROM matricula;
SELECT * FROM avaliacao;
