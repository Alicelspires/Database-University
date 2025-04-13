CREATE TABLE TURMA (
    Identificacao_turma INT PRIMARY KEY,
    Numero_disciplina VARCHAR(50),
    Semestre VARCHAR(50),
    Ano INT,
    Professor VARCHAR(50),
    FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA(Numero_disciplina)
);