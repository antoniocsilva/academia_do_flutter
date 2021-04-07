void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos
  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.

  int pacienteComMaisDeVinteAnos = 0;

  List familiaRahman = [];
  List familiaSilva = [];
  List familiaVerne = [];

  for (var usuarios in pacientes) {
    var usuario = usuarios.split('|');
    if (int.parse(usuario[1]) > 20) {
      pacienteComMaisDeVinteAnos++;
    }
  }

  print('-> Existe $pacienteComMaisDeVinteAnos pacientes com mais de 20 anos');

  for (var usuarios in pacientes) {
    List usuario = usuarios.split('|');
    String nome = usuario[0].split(' ')[0];
    String sobrenome = usuario[0].split(' ')[1];

    if (sobrenome == 'Verne') {
      familiaVerne.add(nome);
    } else if (sobrenome == 'Rahman') {
      familiaRahman.add(nome);
    } else {
      familiaSilva.add(nome);
    }
  }

  print('---------------');
  print('Familia Rahman');
  print('---------------');
  for (var Rahman in familiaRahman) {
    print('-> $Rahman');
  }
  print('---------------');
  print('Familia Silva');
  print('---------------');
  for (var Silva in familiaSilva) {
    print('-> $Silva');
  }
  print('---------------');
  print('Familia Verne');
  print('---------------');
  for (var Verne in familiaVerne) {
    print('-> $Verne');
  }
}
