CREATE TABLE PRE_REQUISITO (
    Numero_disciplina VARCHAR(50),
    Numero_pre_requisito VARCHAR(50),
    PRIMARY KEY (Numero_disciplina, Numero_pre_requisito),
    FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA(Numero_disciplina),
    FOREIGN KEY (Numero_pre_requisito) REFERENCES DISCIPLINA(Numero_disciplina)
);