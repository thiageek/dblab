-- Alunos que cursam determinado curso
select pessoas.nome from pessoas
left join alunos on alunos.pessoa_id = pessoas.id
left join turmas on turmas.id = alunos.turma_id
left join materias_turmas on materias_turmas.turma_id = turmas.id
left join materias on materias.id = materias_turmas.materia_id
where materias.nome = 'Nome do Curso';

-- Totais de funcionarios admitidos por ano
select year(data_de_admissao) as ano, count(*) as admitidos from funcionarios
group by year(data_de_admissao);

-- Melhores alunos por periodo
select periodos.nome, pessoas.nome, avg(notas.nota) as media from avaliacoes
left join periodos on avaliacoes.periodo_id = periodos.id
left join notas on notas.avaliacao_id = avaliacoes.id
left join alunos on notas.aluno_id = alunos.id
left join pessoas on pessoas.id = alunos.pessoa_id
group by periodos.id, alunos.id
order by media desc
limit 1;

-- Quantidade de alunos atendidos por professor
select pessoas.nome, count(alunos.id) from materias_turmas
left join funcionarios on funcionarios.id = materias_turmas.professor_id
left join pessoas on pessoas.id = funcionarios.pessoa_id
left join turmas on turmas.id = materias_turmas.turma_id
left join alunos on alunos.turma_id = turmas.id
group by professor_id;