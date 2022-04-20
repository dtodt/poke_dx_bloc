import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/data/adapters/pokemon_rest_adapter.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

import '../../../../constants.dart';

void main() {
  test('should convert a map into pokemon', () async {
    final result = PokemonRestAdapter.fromMap(kMewMap);
    expect(result, isA<Pokemon>());
    expect(result.number, equals(kMew.number));
  });

  test('should convert a list of map into a list of pokemon', () async {
    final result = PokemonRestAdapter.fromList([kMewMap]);
    expect(result, isA<List<Pokemon>>());
    expect(result, isNotEmpty);
  });
}
