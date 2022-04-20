import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/data/adapters/pokemon_response_rest_adapter.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

import '../../../../constants.dart';

void main() {
  test('should convert a map into pokemon response', () async {
    final result = PokemonResponseRestAdapter.fromMap(kCharizardResponseMap);
    expect(result, isA<PokemonResponse>());
    expect(result.results, isNotEmpty);
  });

  test('should convert a map with null into pokemon response', () async {
    final result = PokemonResponseRestAdapter.fromMap(kMewResponseMap);
    expect(result, isA<PokemonResponse>());
    expect(result.results, isNotEmpty);
  });
}
