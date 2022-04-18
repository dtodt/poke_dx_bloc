import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Pokemon list fetch usecase contract.
abstract class IPokemonFetch {
  /// Fetch a page of pokemon.
  Future<PokemonResponse> call(PageParams params);
}

///? Pokemon list fetch usecase implementation.
class PokemonFetch implements IPokemonFetch {
  const PokemonFetch(this._repository);

  final IPokemonRepository _repository;

  @override
  Future<PokemonResponse> call(PageParams params) async {
    return await _repository.list(params);
  }
}
