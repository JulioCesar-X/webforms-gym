
use gym_asp;

-- Dados constantes primeiro
INSERT INTO Modalidade (Nome, Descricao)
VALUES 
    ('Cardio', 'Exercícios cardiovasculares para melhorar a resistência'),
    ('Musculação', 'Treino de força para todos os grupos musculares'),
    ('Cycle', 'Aulas de ciclismo indoor para alta intensidade'),
    ('Jump', 'Aulas de trampolim para fitness divertido e eficaz'),
    ('Natação', 'Aulas de natação para todos os níveis'),
    ('Zumba', 'Aulas de dança fitness com ritmos latinos'),
    ('Yoga', 'Prática de yoga para flexibilidade e relaxamento');

INSERT INTO Frequencia (Descricao)
VALUES 
    ('Diária'),
    ('Semanal'),
    ('Mensal');

INSERT INTO SemanaDia (Dia)
VALUES 
    ('Segunda-feira'),
    ('Terça-feira'),
    ('Quarta-feira'),
    ('Quinta-feira'),
    ('Sexta-feira'),
    ('Sábado'),
    ('Domingo');

INSERT INTO Pessoa (Nome, Sexo, Email, Telefone, Peso, Altura, IMC, DoencaOuPatologia, Toalha)
VALUES ('julio', 'M', 'joao.silva@example.com', '1234-5678', 70.5, 1.75, 23.0, NULL, 1);

INSERT INTO ModalidadePessoa (PessoaId, ModalidadeId)
VALUES (1, 1), (1, 7);

INSERT INTO HorarioPreferido (PessoaId, SemanaDiaId, HorarioInicio, HorarioFim, TipoHorario)
VALUES 
    (1, 1, '18:00:00', '19:00:00', 'pós-laboral'),
    (1, 2, '18:00:00', '19:00:00', 'pós-laboral'),
    (1, 3, '18:00:00', '19:00:00', 'pós-laboral'),
    (1, 4, '18:00:00', '19:00:00', 'pós-laboral'),
    (1, 5, '18:00:00', '19:00:00', 'pós-laboral');



INSERT INTO Usuario (PessoaId, Login, PasswordHash)
VALUES 
    (1, 'julio', CONVERT(VARBINARY, HASHBYTES('SHA2_256', 'senha123'), 2));


INSERT INTO Aula (ModalidadeId, Horario, Duracao, FrequenciaId, ProfissionalId)
VALUES 
    (1, '2023-10-01T08:00:00', '01:00:00', 1, 3);


INSERT INTO Inscricao (PessoaId, AulaId, PreferenciaPorPT, Toalha, DoencaPatologia, Observacoes, ValorMensalidade)
VALUES 
    (1, 1, 1, 1, 0, 'Nenhuma observação', 20.00);