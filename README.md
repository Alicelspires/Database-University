# Database-University
Simulação de banco de dados para o esquema do banco UNIVERSIDADE

O banco de dados UNIVERSIDADE gerencia informações acadêmicas, incluindo:

- Alunos: Nome, número de matrícula, tipo (graduação/pós) e curso.
- Disciplinas: Nome, créditos e departamento.
- Turmas: Semestre, ano e professor responsável.
- Histórico escolar: Notas dos alunos em cada disciplina.
- Pré-requisitos: Relacionamento entre disciplinas.
  
## Objetivo das Consultas
As consultas sobre ALUNOS permitem analisar:

- Desempenho acadêmico: Médias de notas por disciplina.
- Matrículas e pré-requisitos: Alunos que cumpriram requisitos para cursar uma disciplina.
- Atuação docente: Professores que lecionam múltiplas disciplinas.
- Progressão de alunos sênior: Histórico completo de disciplinas concluídas.

## Modelagem

<div align="center">
        
![image](https://github.com/user-attachments/assets/8f15c5c8-e07a-4b85-acdb-d8501a8e381a)

</div>

## Tabelas e suas informações inseridas
### Aluno

![aluno](https://github.com/user-attachments/assets/526fa835-f4cf-4990-802a-d9ddc34c0cfd)

### Disciplina

![disciplina](https://github.com/user-attachments/assets/38926f49-9526-49e4-8d96-be298e8c6f0f)

### Historico escolar

![historico-escolar](https://github.com/user-attachments/assets/1f8cb066-d8fa-41df-8b0f-29c1838adbe3)

### Pré-requisto

![pre-requisito](https://github.com/user-attachments/assets/607db7c1-ff6b-4937-8f36-99c97a117746)

### Turma

![turma](https://github.com/user-attachments/assets/2e85aac3-4d3e-44ff-b42e-c90192784013)

## Queries

### 1. Recupere os nomes de todos os alunos sênior (Tipo_aluno = 2) se formando em ‘CC’ (Ciência da computação).
```sql
SELECT Nome 
FROM Aluno
WHERE Tipo_aluno = 2 AND Curso = 'CC';
```

### 2. Recupere os nomes de todas as disciplinas lecionadas pelo Professor Kleber em 2007 e 2008.
```sql
SELECT Nome_disciplina 
FROM Disciplina d
JOIN Turma t ON d.Numero_disciplina = t.Numero_disciplina
WHERE t.Professor = 'Kleber';
```

### 3. Para cada matéria lecionada pelo Professor Kleber, recupere o número da disciplina, semestre, ano e número de alunos que realizaram a matéria
```sql
SELECT d.Numero_disciplina, t.Semestre, t.Ano, h.Numero_aluno
FROM Disciplina d
JOIN Turma t ON d.Numero_disciplina = t.Numero_disciplina
JOIN Historico_escolar h ON t.identificacao_turma = h.Identificacao_turma
WHERE t.Professor = 'Kleber';
```

### 4. Recupere o nome e o histórico de cada aluno sênior (Tipo_aluno = 2) formando em CC. Um histórico inclui nome da disciplina, número da disciplina, crédito, semestre, ano e nota para cada disciplina concluída pelo aluno
```sql
SELECT a.Nome, d.Nome_disciplina, d.Numero_disciplina, d.creditos, t.Semestre, t.Ano, h.Nota 
FROM Aluno a
JOIN Historico_escolar h ON h.Numero_aluno = a.Numero_aluno
JOIN Turma t ON t.Identificacao_turma = h.Identificacao_turma
JOIN Disciplina d ON d.Numero_disciplina = t.Numero_disciplina
WHERE Tipo_aluno = 2 AND Curso = 'CC';
```
