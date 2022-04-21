import 'package:pokedx/app/pokedex/data/adapters/pokemon_response_graph_adapter.dart';
import 'package:pokedx/app/pokedex/data/adapters/pokemon_response_rest_adapter.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Pokemon repository implementation.
class PokemonRepository implements IPokemonRepository {
  const PokemonRepository(this._pokemonRemoteDs);

  final IPokemonRemoteDs _pokemonRemoteDs;

  @override
  Future<PokemonResponse> list(PageParams params) async {
    final result = await _pokemonRemoteDs.list(params);
    if (isGraph(result)) {
      return PokemonResponseGraphAdapter.fromMap(result, params);
    } else {
      return PokemonResponseRestAdapter.fromMap(result);
    }
  }

  bool isGraph(Map<String, dynamic> result) {
    return result.containsKey('data');
  }
}
