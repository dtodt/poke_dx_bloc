import 'package:pokedx/app/pokedex/data/adapters/pokemon_adapter.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Handles json conversions.
class PokemonResponseAdapter {
  static PokemonResponse fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      count: map['count'] ?? 0,
      next: map['next'] ?? '',
      previous: map['previous'] ?? '',
      results: PokemonAdapter.fromList(map['results'] as List),
    );
  }
}
