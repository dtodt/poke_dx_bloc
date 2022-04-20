import 'package:pokedx/app/pokedex/data/adapters/pokemon_rest_adapter.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Handles json conversions.
class PokemonResponseRestAdapter {
  static PokemonResponse fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      count: map['count'] ?? 0,
      next: _extractPageParam(map['next']),
      previous: _extractPageParam(map['previous']),
      results: PokemonRestAdapter.fromList(map['results'] as List),
    );
  }

  static PageParams? _extractPageParam(String? url) {
    if (url == null || url.isEmpty) {
      return null;
    }

    final params = Uri.parse(url).queryParameters;
    if (params.isEmpty) {
      return null;
    }

    return PageParams(
      offset: int.parse(params['offset']!),
      limit: int.parse(params['limit']!),
    );
  }
}
