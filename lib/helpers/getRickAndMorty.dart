import 'package:dio/dio.dart';
import 'package:parcial/entity/rickandmorty_entity.dart';
import 'package:parcial/models/rickAndMorty.dart';

class GetRickAndMorty {
  static const url = "https://rickandmortyapi.com/api";
  final _dio = Dio();

  Future<List<RickAndMortyEntity>> getPL() async {
    final response = await _dio.get("$url/character");
    final temp = response.data["results"];
    List<RickAndMortyEntity> PL = [];
    RickAndMorty chModel;
    for (var i = 0; i < temp.length; i++) {
      chModel = RickAndMorty.fromJsonMap(temp[i]);
      PL.add(RickAndMortyEntity(
        id: chModel.id,
        nombre: chModel.name,
        estado: chModel.status,
        especie: chModel.species,
        genero: chModel.gender,
        img: chModel.image,
      ));
    }
    return PL;
  }
}
