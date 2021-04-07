main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  List<String> pessoaSemRegistroDuplicado = [];
  int sexoM = 0;
  int sexoF = 0;
  int deMaior = 0;
  int maisVelho = 0;
  String nome = '';
  List<String> filtro = [];

  //!removendo duplicados
  for (var pessoa in pessoas) {
    if (!pessoaSemRegistroDuplicado.any((element) => element == pessoa)) {
      pessoaSemRegistroDuplicado.add(pessoa);
    }
  }
  print('1 - Remover os duplicados');
  print('------------------------');
  //!Impressão dos registro sem duplicitade
  pessoaSemRegistroDuplicado.forEach((pessoa) => print(pessoa));

  print('\n2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino');
  pessoaSemRegistroDuplicado.forEach((pessoa) {
    if (pessoa.contains("Masculino")) {
      sexoM++;
    }
    if (pessoa.contains("Feminino")) {
      sexoF++;
    }

    var pessoaTemp = pessoa.split("|");
    if (int.tryParse(pessoaTemp[1]) > 18) {
      filtro.add(pessoa);
      deMaior++;
    }

    if (int.tryParse(pessoaTemp[1]) > maisVelho) {
      maisVelho = int.parse(pessoaTemp[1]);
      nome = pessoaTemp[0];
    }
  });
  print('------------------------');
  print(
      'A quantidades de pessoas do sexo masculino é: $sexoM e do sexo feminino é $sexoF');
  print(
      '\n3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e mostre a quantidade de pessoas com mais de 18 anos');
  print('------------------------');
  filtro.forEach((pessoa) => print(pessoa));
  print('A quantidade de pessoas com mais de 18 anos são: $deMaior pessoas.');

  print('\n4 - Encontre a pessoa mais velha.');
  print('------------------------');
  print('A pessoa mais velha é $nome, com $maisVelho anos.');
}
