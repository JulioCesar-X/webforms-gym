CREATE DATABASE gym_asp;

use gym_asp;
-- Criação da tabela Pessoa
CREATE TABLE Pessoa (
    PessoaId INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Sexo CHAR(1),
    Email NVARCHAR(100),
    Telefone NVARCHAR(20),
    Peso FLOAT,
    Altura FLOAT,
    IMC FLOAT,
    DoencaOuPatologia NVARCHAR(255),
    Toalha BIT
);

-- Criação da tabela User
CREATE TABLE Usuario (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    PessoaId INT FOREIGN KEY REFERENCES Pessoa(PessoaId),
    Login NVARCHAR(50) NOT NULL,
    PasswordHash VARBINARY(64)
);

-- Criação da tabela Modalidade
CREATE TABLE Modalidade (
    ModalidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Descricao NVARCHAR(255)
);

-- Criação da tabela Frequencia
CREATE TABLE Frequencia (
    FrequenciaId INT IDENTITY(1,1) PRIMARY KEY,
    Descricao NVARCHAR(100) NOT NULL
);

-- Criação da tabela Aula
CREATE TABLE Aula (
    AulaId INT IDENTITY(1,1) PRIMARY KEY,
    ModalidadeId INT FOREIGN KEY REFERENCES Modalidade(ModalidadeId),
    Horario DATETIME,
    Duracao TIME,
    FrequenciaId INT FOREIGN KEY REFERENCES Frequencia(FrequenciaId),
    ProfissionalId INT FOREIGN KEY REFERENCES Pessoa(PessoaId)
);

-- Criação da tabela SemanaDia
CREATE TABLE SemanaDia (
    SemanaDiaId INT IDENTITY(1,1) PRIMARY KEY,
    Dia NVARCHAR(50) NOT NULL
);

-- Criação da tabela ModalidadePessoa
CREATE TABLE ModalidadePessoa (
    ModalidadePessoaId INT IDENTITY(1,1) PRIMARY KEY,
    PessoaId INT FOREIGN KEY REFERENCES Pessoa(PessoaId),
    ModalidadeId INT FOREIGN KEY REFERENCES Modalidade(ModalidadeId)
);

-- Criação da tabela HorarioPreferido
CREATE TABLE HorarioPreferido (
    HorarioId INT IDENTITY(1,1) PRIMARY KEY,
    PessoaId INT FOREIGN KEY REFERENCES Pessoa(PessoaId),
    SemanaDiaId INT FOREIGN KEY REFERENCES SemanaDia(SemanaDiaId),
    HorarioInicio TIME,
    HorarioFim TIME,
    TipoHorario NVARCHAR(50) CONSTRAINT CHK_Horario_TipoHorario CHECK (TipoHorario IN ('diurno', 'pós-laboral'))
);

-- Criação da tabela Inscrição
CREATE TABLE Inscricao (
    InscricaoId INT IDENTITY(1,1) PRIMARY KEY,
    PessoaId INT FOREIGN KEY REFERENCES Pessoa(PessoaId),
    AulaId INT FOREIGN KEY REFERENCES Aula(AulaId),
    PreferenciaPorPT BIT,
    Toalha BIT,
    DoencaPatologia BIT,
    Observacoes NVARCHAR(255),
    ValorMensalidade DECIMAL(10,2)
);

-- Criação da tabela Presença
CREATE TABLE Presenca (
    PresencaId INT IDENTITY(1,1) PRIMARY KEY,
    InscricaoId INT FOREIGN KEY REFERENCES Inscricao(InscricaoId),
    Data DATETIME,
    Presente BIT
);
