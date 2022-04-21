import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/data/adapters/pokemon_response_graph_adapter.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

import '../../../../constants.dart';

void main() {
  test('should convert a map into pokemon response', () async {
    final result = PokemonResponseGraphAdapter.fromMap(
        kCharizardGraphResponseMap, const PageParams(limit: 1, offset: 5));
    expect(result, isA<PokemonResponse>());
    expect(result.results, isNotEmpty);
    expect(result.next, isNotNull);
    expect(result.next!.offset, equals(6));
    expect(result.previous, isNotNull);
    expect(result.previous!.offset, equals(4));
  });

  test('should convert a map into pokemon response, not generating page params',
      () async {
    final result = PokemonResponseGraphAdapter.fromMap(
        kCharizardGraphResponseMap, const PageParams(limit: 10, offset: 0));
    expect(result, isA<PokemonResponse>());
    expect(result.results, isNotEmpty);
    expect(result.next, isNull);
    expect(result.previous, isNull);
  });
}
