drop database if exists projetoescola;
create database if not exists projetoescola;
USE projetoescola;

CREATE TABLE IF NOT EXISTS Curso (
  idCurso INT NOT NULL,
  CursoNome VARCHAR(45) NULL,
  PRIMARY KEY (idCurso)
  );
  
  CREATE TABLE IF NOT EXISTS Disciplina (
  idDisciplina INT NOT NULL,
  DisciplinaNome VARCHAR(45) NULL,
  PRIMARY KEY (idDisciplina)
    );

CREATE TABLE IF NOT EXISTS Professor (
  SSN INT NOT NULL,
  ProfessorNome VARCHAR(45) NULL,
  Disciplina_idDisciplina int not null,
  PRIMARY KEY (SSN),
  CONSTRAINT fk_Professor_Disciplina1
    FOREIGN KEY (Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );
  
CREATE TABLE IF NOT EXISTS Aluno (
  Matricula INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Curso_idCurso int not null,
  PRIMARY KEY (Matricula),
  CONSTRAINT fk1 foreign key (Curso_idCurso) REFERENCES Curso(idCurso) ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS Aluno_has_Disciplina (

  Aluno_Matricula INT NOT NULL,
  Disciplina_idDisciplina INT NOT NULL,
  PRIMARY KEY (Aluno_Matricula, Disciplina_idDisciplina),
  CONSTRAINT fk_Aluno_has_Disciplina_Aluno1
    FOREIGN KEY (Aluno_Matricula)
    REFERENCES Aluno (Matricula)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Aluno_has_Disciplina_Disciplina1
    FOREIGN KEY (Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS Aluno_has_Professor (
  Aluno_Matricula INT NOT NULL,
  Professor_SSN INT NOT NULL,
  PRIMARY KEY (Aluno_Matricula, Professor_SSN),
  CONSTRAINT fk_Aluno_has_Professor_Aluno1
    FOREIGN KEY (Aluno_Matricula)
    REFERENCES Aluno (Matricula)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Aluno_has_Professor_Professor1
    FOREIGN KEY (Professor_SSN)
    REFERENCES Professor (SSN)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

INSERT INTO Curso(idCurso,CursoNome) values (1,'Engenharia de Software'),(2,'Engenharia Biomedica');
INSERT INTO Disciplina(idDisciplina,DisciplinaNome) values (1,'Matematica'),(2,'Banco de Dados'),(3,'Algoritmos'),(4,'Introducao a Engenharia');
INSERT INTO Professor(SSN,ProfessorNome,Disciplina_idDisciplina) values (113,'Paulo Otavio',2),(167,'José Almeida',3),(617,'Carlos Alberto',1),(900,'Lucas Goncalves',4);
INSERT INTO Aluno(Matricula,Nome,Curso_idCurso) values (1,'Marcos Vinicius',1),(2,'João Lucas',2);

INSERT INTO Aluno_has_Professor(Aluno_Matricula,Professor_SSN) values (1,113),(1,167),(1,617),(2,617),(2,900);
INSERT INTO Aluno_has_Disciplina(Aluno_Matricula,Disciplina_idDisciplina) values (1,1),(1,2),(1,3),(2,4),(2,1);

select * from Curso;
select * from Professor;
select * from Disciplina;
select * from Aluno_has_Professor;
select * from Aluno_has_Disciplina;
select * from Aluno;

UPDATE Curso set CursoNome = 'Engenharia de Computacao' where idCurso = 2;
UPDATE Disciplina set DisciplinaNome = 'Algoritmos e Estruturas de Dados 1' where idDisciplina = 3;
UPDATE Professor set SSN = 114 where SSN = 113;

select * from Curso;

select * from Disciplina;
select * from Aluno_has_Disciplina;

select * from Professor;
select * from Aluno_has_Professor;

DELETE FROM Professor where SSN = 900;

select * from Professor;
select * from Aluno_has_Professor;

select a.Nome,a.Matricula,c.CursoNome from Aluno as a,Curso as c where a.Curso_idCurso = c.idCurso order by a.Matricula asc;

