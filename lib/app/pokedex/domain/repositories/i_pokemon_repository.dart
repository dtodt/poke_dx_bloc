import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

///? Pokemon repository contract.
abstract class IPokemonRepository {
  /// Fetch a page of pokemon.
  Future<List<Pokemon>> list(PageParams params);
}
