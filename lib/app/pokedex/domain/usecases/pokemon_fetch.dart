import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

///? Pokemon list fetch usecase contract.
abstract class IPokemonFetch {
  /// Fetch a page of pokemon.
  Future<List<Pokemon>> call(PageParams params);
}

///? Pokemon list fetch usecase implementation.
class PokemonFetch implements IPokemonFetch {
  const PokemonFetch(this._repository);

  final IPokemonRepository _repository;

  @override
  Future<List<Pokemon>> call(PageParams params) async {
    return await _repository.list(params);
  }
}
