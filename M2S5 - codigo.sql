DROP TABLE IF EXISTS Consulta;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Nutricionista;

CREATE TABLE Nutricionista (
    ID_Nutricionista SERIAL PRIMARY KEY,
    CRN VARCHAR(20) NOT NULL,
    Especialidade VARCHAR(100),
    Tempo_Experiencia INTEGER
);

CREATE TABLE Paciente (
    ID_Paciente SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    CPF VARCHAR(14) UNIQUE,
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Consulta (
    ID_Consulta SERIAL PRIMARY KEY,
    ID_Nutricionista INTEGER REFERENCES Nutricionista(ID_Nutricionista) ON DELETE CASCADE,
    ID_Paciente INTEGER REFERENCES Paciente(ID_Paciente) ON DELETE CASCADE,
    Data_Consulta DATE,
    Observacoes TEXT
);

INSERT INTO Nutricionista (CRN, Especialidade, Tempo_Experiencia)
VALUES
    ('12345', 'Nutrição Esportiva', 5),
    ('54321', 'Nutrição Clínica', 8),
    ('98765', 'Nutrição Infantil', 3);

INSERT INTO Paciente (Nome, Data_Nascimento, CPF, Telefone, Email)
VALUES
    ('Maria Silva', '1990-05-15', '123.456.789-00', '(11) 98765-4321', 'maria.silva@email.com'),
    ('João Souza', '1985-08-20', '987.654.321-00', '(21) 99876-5432', 'joao.souza@email.com'),
    ('Ana Santos', '2000-02-10', '456.789.123-00', '(31) 98888-7777', 'ana.santos@email.com');

INSERT INTO Consulta (ID_Nutricionista, ID_Paciente, Data_Consulta, Observacoes)
VALUES
    (1, 1, '2024-06-15', 'Paciente com boa evolução no tratamento.'),
    (2, 2, '2024-06-16', 'Paciente necessita ajuste na dieta devido a intolerância alimentar.'),
    (3, 3, '2024-06-17', 'Primeira consulta, paciente iniciando plano alimentar.');

UPDATE Nutricionista
SET Especialidade = 'Nutrição Esportiva Avançada',
    Tempo_Experiencia = 6
WHERE ID_Nutricionista = 1;

UPDATE Paciente
SET Telefone = '(21) 98765-4321'
WHERE ID_Paciente = 2;

UPDATE Consulta
SET Observacoes = 'Paciente apresentou melhora significativa.'
WHERE ID_Consulta = 1;

DELETE FROM Nutricionista
WHERE ID_Nutricionista = 3;

DELETE FROM Paciente
WHERE ID_Paciente = 3;

DELETE FROM Consulta
WHERE ID_Consulta = 2;

-- SELECT * FROM Nutricionista;
-- SELECT * FROM Paciente;
SELECT * FROM Consulta;