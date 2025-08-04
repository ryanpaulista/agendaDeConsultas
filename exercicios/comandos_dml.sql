INSERT INTO Pessoa (cpf, email, nome, dt_nasc, endereco, telefone) VALUES ("002", "pp@email.com", "Pedro I", "1479-01-10", "R. Vasco", "-");
INSERT INTO Paciente (cpf_pessoa, senha, plano_saude) VALUES ("002", "senha1", 0);

INSERT INTO Pessoa (cpf, email, nome, dt_nasc, endereco, telefone) VALUES ("003", "ps@email.com", "Pedro II", "1516-02-10", "R. Flamengo", "5501");
INSERT INTO Paciente (cpf_pessoa, senha, plano_saude) VALUES ("003", "senha2", 1);

INSERT INTO Pessoa (cpf, email, nome, dt_nasc, endereco, telefone) VALUES ("001", "dj@email.com", "D João II", "1415-12-01", "R. Portugal", "-");
INSERT INTO Medico (cpf_pessoa, crm) VALUES ("001", "111");

INSERT INTO Pessoa (cpf, email, nome, dt_nasc, endereco, telefone) VALUES ("004", "jj@email.com", "JJ Xavier", "1746-11-12", "R. Minas", "5502");
INSERT INTO Medico (cpf_pessoa, crm) VALUES ("004", "112");

INSERT INTO Especialidade (id_especialidade, descricao) VALUES (11, "Pediatra")
INSERT INTO Especialidade (id_especialidade, descricao) VALUES (12, "Cardiologista")
INSERT INTO Especialidade (id_especialidade, descricao) VALUES (13, "Ortopedista")

INSERT INTO MedicoEspecialidade (cpf_medico, id_especialidade) VALUES ("001", 11)
INSERT INTO MedicoEspecialidade (cpf_medico, id_especialidade) VALUES ("004", 11)
INSERT INTO MedicoEspecialidade (cpf_medico, id_especialidade) VALUES ("004", 12)

INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta) VALUES ("002", "001", "1782-04-14 16:00:00", "1782-03-14 10:04:45", 80.00);
INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta) VALUES ("002", "004", "1782-04-15 10:00:00", "1782-03-14 10:04:45", 100.00);
INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta) VALUES ("002", "004", "1783-05-17 08:00:00", "1783-05-10 16:32:00", 100.00);
INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta) VALUES ("003", "001", "1783-05-17 08:30:00", "1783-05-09 09:05:56", 0.00);

UPDATE Pessoa SET dt_nasc = "1416-12-01" WHERE cpf = "001";
UPDATE Pessoa SET telefone = "5503", email = "pf@email.com" WHERE cpf="002";
UPDATE Pessoa SET telefone = CONCAT('9' , telefone);
UPDATE Agendamento SET dh_consulta = TIMESTAMP('1783-05-19', TIME(dh_consulta)), valor_consulta = 150.00 WHERE DATE(dh_consulta) = "1783-05-17";
UPDATE MedicoEspecialidade SET id_especialidade = 13 WHERE cpf = "004" AND id_especialidade = "12";

DELETE FROM Agendamento WHERE cpf_paciente = "002" AND DATE(dh_consulta) = "1783-05-17";
DELETE FROM Agendamento WHERE cpf_medico = "004" AND valor_consulta = 0.00;
DELETE Paciente
FROM 
    Paciente
INNER JOIN 
    Pessoa ON Paciente.pessoa_id = Pessoa.id
WHERE
    Paciente.plano_saude = false
    OR Pessoa.telefone IS NULL
    OR Pessoa.telefone = '';

DELETE FROM Pessoa WHERE cpf = "004";