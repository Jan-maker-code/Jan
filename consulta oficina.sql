SELECT nome, telefone FROM Cliente;
SELECT * FROM Veiculo WHERE ano > 2015
;SELECT id_ordem, DATEDIFF(data_fechamento, data_abertura) AS dias_servico FROM OrdemServico;
SELECT nome, salario FROM Funcionario ORDER BY salario DESC;
SELECT nome, salario FROM Funcionario ORDER BY salario DESC;
SELECT id_funcionario, COUNT(*) AS total_ordens
FROM OrdemServico
GROUP BY id_funcionario
HAVING COUNT(*) > 2;