import 'package:desafio_modulo_avancado/models/cidade_model.dart';
import 'package:desafio_modulo_avancado/models/estado_model.dart';
import 'package:dio/dio.dart';

class IbgeRepository {
  Future<List<EstadoModel>> buscarEstado() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var dio = Dio();
    var response = await dio.get<List>(url);
    if (response.statusCode == 200) {
      var respData = response.data;
      var estados =
          respData.map<EstadoModel>((e) => EstadoModel.fromMap(e)).toList();
      return estados;
    } else {
      return null;
    }
  }

  Future<List<CidadeModel>> buscarCidade(int estadoId) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${estadoId}/distritos';
    var dio = Dio();
    var response = await dio.get<List>(url);
    if (response.statusCode == 200) {
      var respData = response.data;
      var cidade = respData.map((c) => CidadeModel.fromMap(c)).toList();
      return cidade;
    } else {
      return null;
    }
  }
}
