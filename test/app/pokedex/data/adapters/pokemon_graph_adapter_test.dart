import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/data/adapters/pokemon_graph_adapter.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

import '../../../../constants.dart';

void main() {
  test('should convert a map into pokemon', () async {
    final result = PokemonGraphAdapter.fromMap(kCharizardGraphMap);
    expect(result, isA<Pokemon>());
    expect(result.types, isNotEmpty);
    expect(result.types.first, equals('Fire'));
  });

  test('should convert a list of map into a list of pokemon', () async {
    final result = PokemonGraphAdapter.fromList([kCharizardGraphMap]);
    expect(result, isA<List<Pokemon>>());
    expect(result, isNotEmpty);
  });
}
