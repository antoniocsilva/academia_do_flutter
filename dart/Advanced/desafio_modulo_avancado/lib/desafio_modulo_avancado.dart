import 'package:desafio_modulo_avancado/repository/ibge_repository.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'root',
      db: 'desafio_dart');
  return await MySqlConnection.connect(settings);
}

Future<void> inserirRegistros(estados) async {
  var conn = await getConnection();
  for (var uf in estados) {
    await conn.query('insert tb_estado(id, nome, sigla) values (?, ?, ?)',
        [uf.id, uf.nome, uf.sigla]);
    print('Registros - ID: ${uf.id} - ESTADO: ${(uf.nome)}');
    var cidades = await IbgeRepository().buscarCidade(uf.id);
    for (var cidade in cidades) {
      var resultCidade = await conn.query(
          'insert tb_cidade(id, nome, estado_id) values (?, ?, ?)',
          [cidade.id, cidade.nome, uf.id]);
      print('$resultCidade Registros');
    }
  }
  await conn.close();
}

void run() async {
  print('=====> Buscando os Estado no IBGE');
  var estados = await IbgeRepository().buscarEstado();
  print('=====> Busca Finalizada');

  print('=====> Cadastrando os Estado no Banco de Dados');
  await inserirRegistros(estados);
  print('=====> Cadastro Finalizado');
}
