import 'package:dio/dio.dart';
import 'package:parcial/entity/character_entity.dart';
import 'package:parcial/models/character.dart';

class GetCharacter {
  static const url = "https://dragonball-api.com/api";
  final _dio = Dio();

  Future<CharacterEntity> getCharacterOnly(id) async {
    final response = await _dio.get("$url/characters/$id");
    final data = response.data;
    final characterModel = Character.fromJsonMap(data);
    return CharacterEntity(
      id: characterModel.id,
      descripcion: characterModel.description,
      img: characterModel.image,
      raza: characterModel.race,
      nombre: characterModel.name,
      transformacion:characterModel.transformation

     );
  } 

  Future<List<CharacterEntity>> getPJ(int page, [int limit = 5]) async {
    final response = await _dio.get("$url/characters?page=$page&limit=$limit");
    final temp = response.data["items"];
    List<CharacterEntity> PJ = [];
    Character chModel;
    for (var i = 0; i < temp.length; i++) {
      chModel = Character.fromJsonMap(temp[i]);
      PJ.add(CharacterEntity(
        id: chModel.id,
        nombre: chModel.name,
        raza: chModel.race,
        descripcion: chModel.description,
        img: chModel.image,
      ));
    }
    return PJ;
  }
}