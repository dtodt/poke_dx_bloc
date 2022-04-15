import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

///? Pokemon datasource contract.
abstract class IPokemonRemoteDs {
  /// Fetch a list of pokemon.
  Future<List<Map<String, dynamic>>> list(PageParams params);
}
