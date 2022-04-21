import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

import '../../../../constants.dart';
import '../../../../mocks.dart';

void main() {
  late IPokemonRemoteDs datasource;
  late IPokemonRepository repository;

  setUpAll(() {
    datasource = PokemonRemoteDsMock();
    repository = PokemonRepository(datasource);
  });

  test('should return a list of pokemons', () async {
    when(() => datasource.list(PageParams.initial()))
        .thenAnswer((_) => Future.value(kMewRestResponseMap));

    final result = await repository.list(PageParams.initial());
    expect(result, isA<PokemonResponse>());
  });
}
