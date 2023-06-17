<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
</head>
<body>
  <h1>Sistema Escolar em MYSQL</h1>
  <p>Este é um sistema escolar desenvolvido em MYSQL que permite gerenciar informações sobre turmas, disciplinas, alunos, matrículas e avaliações.</p>
  <h2>Funcionalidades</h2>
  <ul>
    <li>Cadastro de turmas com número e série.</li>
    <li>Cadastro de disciplinas com nome.</li>
    <li>Associação entre disciplinas e turmas.</li>
    <li>Cadastro de alunos com nome, data de nascimento e gênero.</li>
    <li>Matrícula de alunos em turmas.</li>
    <li>Registro de avaliações com notas de teste, prova e média, além do bimestre.</li>
    <li>Relacionamento entre avaliações, disciplinas e matrículas.</li>
  </ul>
  <h2>Requisitos</h2>
  <ul>
    <li>MYSQL 5.7 ou superior.</li>
  </ul>
  <h2>Configuração</h2>
  <ol>
    <li>Crie um banco de dados chamado "bancoTeste".</li>
    <li>Execute o script fornecido no arquivo "sistemaescolar.sql" para criar as tabelas e inserir dados de exemplo.</li>
  </ol>
  <h2>Uso</h2>
  <p>Você pode usar esse sistema para gerenciar informações escolares como turmas, disciplinas, alunos, matrículas e avaliações. Utilize as consultas SQL para obter, inserir, atualizar ou excluir registros nas tabelas correspondentes.</p>
  <p>Exemplo de consulta para obter todas as disciplinas cadastradas:</p>
  <pre>
    <code>SELECT * FROM disciplinas;</code>
  </pre>
  <p>Exemplo de consulta para obter todas as avaliações de um determinado aluno:</p>
  <pre>
    <code>SELECT * FROM avaliacao WHERE idMatricula = {idMatricula};</code>
  </pre>
  <h2>Contribuição</h2>
  <p>Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas (issues) e enviar pull requests com melhorias, correções de bugs ou novas funcionalidades.</p>
  <h2>Licença</h2>
  <p>Este projeto é licenciado sob a <a href="LICENSE">Licença MIT</a>.</p>
</body>
</html>
