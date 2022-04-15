import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedx/app/core/data/services/i_content_service.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/external/datasources/rest_pokemon_remote_ds.dart';

import '../../../../constants.dart';
import '../../../../mocks.dart';

void main() {
  late IContentService service;
  late IPokemonRemoteDs datasource;

  setUpAll(() {
    service = ContentServiceMock();
    datasource = RestPokemonRemoteDs(service, '/pokemon');
  });

  test('should list successfully', () async {
    when(() => service.read('/pokemon?limit=20&offset=0'))
        .thenAnswer((_) async => kMewResponseMap);

    final result = await datasource.list(PageParams.initial());
    expect(result, isA<Map<String, dynamic>>());
  });
}
