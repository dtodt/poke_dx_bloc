import 'package:pokedx/app/configs/constants.dart';
import 'package:pokedx/app/core/data/helpers/captalize_helper.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

///? Handles json conversions.
class PokemonGraphAdapter {
  static Pokemon fromMap(Map<String, dynamic> map) {
    final name = CaptalizeHelper.captalizeAll(map['name']);
    final number = map['id'];
    final portrait = '$kPortraitUrl/$number.png';
    final types = _extractTypes(map['pokemon_v2_pokemontypes'] as List);

    return Pokemon(
      number: '$number',
      name: name,
      portrait: portrait,
      types: types,
    );
  }

  static List<Pokemon> fromList(List<dynamic> list) {
    return list.map((json) => fromMap(json)).toList();
  }

  static Set<String> _extractTypes(List<dynamic> types) {
    return types
        .map((type) =>
            CaptalizeHelper.captalizeAll(type['pokemon_v2_type']['name']))
        .toSet();
  }
}
