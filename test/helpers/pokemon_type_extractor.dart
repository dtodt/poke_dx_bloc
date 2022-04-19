import 'package:pokedx/app/configs/constants.dart';
import 'package:pokedx/app/core/data/services/i_content_service.dart';
import 'package:pokedx/app/core/external/services/http_content_service.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

const onePage = PageParams(limit: 1, offset: 0);

/// The original rest api pokeapi.co/api/v2/pokemon/ does not return the type on the main list.
/// So we need to extrat it and add it to the list.
Future<void> main() async {
  final IContentService servIce = HttpContentService();

  final int total = await getTotal(servIce);
  final typeMap = await getTypeMap(servIce, total);

  print('***');
  print(typeMap);
  print('***');
}

Future<int> getTotal(IContentService servIce) async {
  final result = await servIce.read('$kRestPokemonUrl?$onePage');
  return result['count'] as int;
}

Future<Map<dynamic, dynamic>> getTypeMap(
    IContentService servIce, int total) async {
  final typeMap = {};
  for (int i = 0; i < total; i++) {
    final index = i + 1;
    print('$index/$total');
    try {
      final types = await getTypes(servIce, index);
      typeMap[index] = types;
    } catch (e) {
      print(e);
      break;
    }
  }
  return typeMap;
}

Future<List<String>> getTypes(IContentService servIce, int index) async {
  final result = await servIce.read('$kRestPokemonUrl/$index');
  final types = result['types'] as List;
  return types.map((type) => type['type']['name'] as String).toList();
}
