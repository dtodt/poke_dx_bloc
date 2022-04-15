import 'package:pokedx/app/pokedex/data/adapters/pokemon_adapter.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

///? Pokemon repository implementation.
class PokemonRepository implements IPokemonRepository {
  const PokemonRepository(this._pokemonRemoteDs);

  final IPokemonRemoteDs _pokemonRemoteDs;

  @override
  Future<List<Pokemon>> list(PageParams params) async {
    final result = await _pokemonRemoteDs.list(params);

    return _convert(result);
  }

  List<Pokemon> _convert(List<Map> list) {
    return PokemonAdapter.fromList(list);
  }
}
