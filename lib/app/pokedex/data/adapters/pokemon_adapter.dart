import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

///? Handles json conversions.
class PokemonAdapter {
  static Pokemon fromMap(Map<String, dynamic> map) {
    final name = map['name'];
    final url = map['url'];

    return Pokemon(
      number: _extractNumber(url),
      name: _capitalizeName(name),
      url: url,
    );
  }

  static List<Pokemon> fromList(List<dynamic> list) {
    return list.map((json) => fromMap(json)).toList();
  }

  static String _extractNumber(String url) {
    final urlParts = url.split('/');
    return urlParts.length > 1 ? urlParts[urlParts.length - 2] : '';
  }

  static String _capitalizeName(String name) {
    return name
        .split(' ')
        .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
        .join(' ');
  }
}
