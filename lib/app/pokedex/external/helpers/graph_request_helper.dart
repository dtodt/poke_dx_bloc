import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/external/value_objects/graph_request.dart';

/// Helpers for graphql requests.
class GraphRequestHelper {
  static GraphRequest buildListQuery(PageParams params) {
    final query = '''query pokemon_list {
  pokemon_v2_pokemon(order_by: {id: asc}, where: {is_default: {_eq: true}}, limit: ${params.limit}, offset: ${params.offset}) {
    id
    name
    pokemon_v2_pokemontypes(order_by: {slot: asc}) {
      pokemon_v2_type {
        name
      }
    }
  }
}''';
    return GraphRequest(query: query, variables: {});
  }
}
