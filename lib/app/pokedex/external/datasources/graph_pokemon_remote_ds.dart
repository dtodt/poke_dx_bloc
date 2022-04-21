import 'package:pokedx/app/core/data/services/i_content_service.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/external/adapters/graph_request_adapter.dart';
import 'package:pokedx/app/pokedex/external/helpers/graph_request_helper.dart';

///? Pokemon datasource graphql implementation.
class GraphPokemonRemoteDs implements IPokemonRemoteDs {
  const GraphPokemonRemoteDs(this._contentService, this._contentUrl);

  final IContentService _contentService;
  final String _contentUrl;

  @override
  Future<Map<String, dynamic>> list(PageParams params) async {
    final request = GraphRequestHelper.buildListQuery(params);
    final response = await _contentService.post(_contentUrl,
        body: GraphRequestAdapter.toJsonString(request));
    return response as Map<String, dynamic>;
  }
}
