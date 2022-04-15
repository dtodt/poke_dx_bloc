import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Pokemon repository contract.
abstract class IPokemonRepository {
  /// Fetch a list of pokemon.
  Future<PokemonResponse> list(PageParams params);
}
