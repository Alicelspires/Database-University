CREATE TABLE HISTORICO_ESCOLAR (
    Numero_aluno INT,
    Identificacao_turma INT,
    Nota VARCHAR(2),
    PRIMARY KEY (Numero_aluno, Identificacao_turma),
    FOREIGN KEY (Numero_aluno) REFERENCES ALUNO(Numero_aluno),
    FOREIGN KEY (Identificacao_turma) REFERENCES TURMA(Identificacao_turma)
);