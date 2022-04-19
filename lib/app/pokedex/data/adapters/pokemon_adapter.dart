import 'package:pokedx/app/configs/constants.dart';
import 'package:pokedx/app/core/data/helpers/captalize_helper.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

///? Handles json conversions.
class PokemonAdapter {
  static Pokemon fromMap(Map<String, dynamic> map) {
    final name = CaptalizeHelper.captalizeAll(map['name']);
    final number = _extractNumber(map['url']);
    final portrait = '$kPortraitUrl/$number.png';

    return Pokemon(
      number: number,
      name: name,
      portrait: portrait,
      types: {},
    );
  }

  static List<Pokemon> fromList(List<dynamic> list) {
    return list.map((json) => fromMap(json)).toList();
  }

  static String _extractNumber(String url) {
    final urlParts = url.split('/');
    return urlParts.length > 1 ? urlParts[urlParts.length - 2] : '';
  }
}
