import 'dart:math';

import 'package:pokedx/app/pokedex/data/adapters/pokemon_graph_adapter.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Handles json conversions.
class PokemonResponseGraphAdapter {
  static PokemonResponse fromMap(Map<String, dynamic> map, PageParams? params) {
    final results = map['data']['pokemon_v2_pokemon'] as List;
    final PageParams? next = _buildNext(results.length, params);
    final PageParams? previous = _buildPrevious(results.length, params);

    return PokemonResponse(
      next: next,
      previous: previous,
      results: PokemonGraphAdapter.fromList(results),
    );
  }

  static PageParams? _buildNext(int length, PageParams? params) {
    if (params == null || length < params.limit) {
      return null;
    }
    return PageParams(
      limit: params.limit,
      offset: params.offset + length,
    );
  }

  static PageParams? _buildPrevious(int length, PageParams? params) {
    if (params == null || params.offset == 0) {
      return null;
    }
    return PageParams(
      limit: params.limit,
      offset: max(params.offset - length, 0),
    );
  }
}
