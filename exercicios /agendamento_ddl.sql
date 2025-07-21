CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL UNIQUE,
    dt_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15) NOT NULL 
);

CREATE TABLE Paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    senha VARCHAR(20) NOT NULL,
    plano_saude BOOLEAN NOT NULL DEFAULT("false"),
    FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Medico (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    crm VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Especialidade (
    id_especialidade INT PRIMARY KEY,
    descricao VARCHAR(300) NOT NULL,
);

CREATE TABLE MedicoEspecialidade (
    cpf_medico CHAR(11) PRIMARY KEY, 
    id_especialidade INT PRIMARY KEY,
    FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_pessoa),
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade)
)

CREATE TABLE Agendamento (
    cpf_paciente CHAR(11) PRIMARY KEY,
    cpf_medico CHAR(11) PRIMARY KEY,
    dh_consulta TIMESTAMP PRIMARY KEY,
    dh_agendamento TIMESTAMP NOT NULL,
    valor_consulta DECIMAL(10, 2) DEFAULT(0.0)
    FOREIGN KEY (cpf_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (cpf_medico) REFERENCES Medico(id_medico)
)