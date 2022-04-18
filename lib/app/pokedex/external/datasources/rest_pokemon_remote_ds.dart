import 'package:pokedx/app/core/data/services/i_content_service.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

///? Pokemon datasource rest implementation.
class RestPokemonRemoteDs implements IPokemonRemoteDs {
  const RestPokemonRemoteDs(this._contentService, this._contentUrl);

  final IContentService _contentService;
  final String _contentUrl;

  @override
  Future<Map<String, dynamic>> list(PageParams params) async {
    final url = '$_contentUrl?${params.toString()}';
    final response = await _contentService.read(url);
    return response as Map<String, dynamic>;
  }
}
