--use [C:\USERS\JULIO\SOURCE\REPOS\JULIOCESAR-X\WEBGYM\APP_DATA\GYM.MDF];

----insert into pessoa(nome,sexo,email,telefone,data_nascimento) values ('julio','M','Julio@cesar','99999999','1997-02-18');

----declare @pessoaID INT = (select Id from pessoa where email= 'Julio@cesar');

----insert into usuario(UsuarioID,login,password,PT,toalha,DP,pessoa_id,peso,altura) values (1,'julio','123',1,1,1,@pessoaID,50,1.70);

--select u.peso/(u.altura*u.altura) from pessoa p join usuario u on p.Id = u.pessoa_id; --IMC

--insert into SemanaDia values (1,'monday');
--insert into SemanaDia values (2,'tuesday');
--insert into SemanaDia values (3,'wednesday');
--insert into SemanaDia values (4,'thursday');
--insert into SemanaDia values (5,'friday');
--insert into SemanaDia values (6,'saturday');
--insert into SemanaDia values (7,'sunday');

--select * from SemanaDia;

--insert into modalidade values (1,'cardio e musculação');
--insert into modalidade values (2,'cycle');
--insert into modalidade values (3,'jump');
--insert into modalidade values (4,'natação');
--insert into modalidade values (5,'zumba');
--insert into modalidade values (6,'yoga');

--select * from modalidade;

--insert into aula(UsuarioId,horario) values ((select UsuarioID from usuario,pessoa p where login='julio' and p.email = 'Julio@cesar'),'pós-laboral') --sem usar o relacionamento baixa coesão
--delete from aula where AulaID=1;

--insert into aula values ((select u.UsuarioID from usuario u join pessoa p on u.pessoa_id = p.Id where u.login = 'julio' and p.email = 'Julio@cesar'),'pós-laboral');-- usando o relacionamento para melhor perfomace
--select a.AulaID, (select p.nome from usuario u join pessoa p on u.pessoa_id = p.Id) as nome_user,a.horario from aula a join usuario u on a.UsuarioId = u.UsuarioID; -- usando uma subquery

--insert into aula values ((select u.UsuarioID from usuario u join pessoa p on u.pessoa_id = p.Id where u.login = 'julio' and p.email = 'Julio@cesar'),'diurno')

--insert into frequencia(ModalidadeId,SemanaDiaId,AulaId) values ((select modalidadeId from modalidade where nome ='jump'),(select SemanaDiaId from SemanaDia where nome = 'monday'),(select aulaID from aula where horario = 'pós-laboral'));
--insert into frequencia(ModalidadeId,SemanaDiaId,AulaId) values ((select modalidadeId from modalidade where nome ='cycle'),(select SemanaDiaId from SemanaDia where nome = 'tuesday'),(select aulaID from aula where horario = 'pós-laboral'));
--insert into frequencia(ModalidadeId,SemanaDiaId,AulaId) values ((select modalidadeId from modalidade where nome ='zumba'),(select SemanaDiaId from SemanaDia where nome = 'friday'),(select aulaID from aula where horario = 'pós-laboral'));
--insert into frequencia(ModalidadeId,SemanaDiaId,AulaId) values ((select modalidadeId from modalidade where nome ='yoga'),(select SemanaDiaId from SemanaDia where nome = 'wednesday'),(select aulaID from aula where horario = 'pós-laboral'));
--insert into frequencia(ModalidadeId,SemanaDiaId,AulaId) values ((select modalidadeId from modalidade where nome ='natação'),(select SemanaDiaId from SemanaDia where nome = 'thursday'),(select aulaID from aula where horario = 'diurno'));

--alter table usuario drop column mensalidade;

--tabela geral
DECLARE @BaseMensalidade FLOAT = 10.0;

-- Calcular IMC e Gordura Corporal para todos os usuários
SELECT 
    p.nome,
    p.sexo,
    p.email,
    p.telefone,
    a.horario,
    u.peso / (u.altura * u.altura) AS IMC,
    (1.2 * (u.peso / (u.altura * u.altura)) + 0.23 * DATEDIFF(year, p.data_nascimento, GETDATE()) - 10.8 * CASE WHEN p.sexo = 'M' THEN 1 ELSE 0 END - 5.4) AS GorduraCorporal,
    STRING_AGG(m.nome, ', ') AS Modalidades,
    SUM(CASE 
        WHEN s.SemanaDiaId > 4 THEN 5
        ELSE 0
    END) AS AcrescimoDias,
    CASE 
        WHEN u.toalha = 1 THEN 5
        ELSE 0
    END AS AcrescimoToalha,
    CASE 
        WHEN u.PT = 1 THEN 10
        ELSE 0
    END AS AcrescimoPT,
    CASE 
        WHEN COUNT(DISTINCT m.ModalidadeId) = (SELECT COUNT(*) FROM modalidade) THEN 10
        WHEN COUNT(DISTINCT m.ModalidadeId) = 2 AND NOT EXISTS (SELECT 1 FROM modalidade WHERE nome = 'cardio e musculação' AND ModalidadeId = m.ModalidadeId) THEN 5
        ELSE 0
    END AS AcrescimoModalidade
FROM 
    pessoa p 
JOIN 
    usuario u ON p.Id = u.pessoa_id 
JOIN 
    aula a ON u.UsuarioID = a.UsuarioId
JOIN 
    frequencia f ON a.AulaId = f.AulaId
JOIN 
    SemanaDia s ON s.SemanaDiaId = f.SemanaDiaId
JOIN 
    modalidade m ON m.ModalidadeId = f.ModalidadeId
GROUP BY 
    p.nome, p.sexo, p.email, p.telefone, a.horario, u.peso, u.altura, p.data_nascimento, u.toalha, u.PT, m.ModalidadeId;
