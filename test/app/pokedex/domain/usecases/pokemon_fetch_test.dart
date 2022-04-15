import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/usecases/pokemon_fetch.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

import '../../../../constants.dart';
import '../../../../mocks.dart';

void main() {
  late IPokemonRepository repository;
  late IPokemonFetch usecase;

  setUpAll(() {
    repository = PokemonRepositoryMock();
    usecase = PokemonFetch(repository);
  });

  test('should list successfully', () async {
    when(() => repository.list(PageParams.initial()))
        .thenAnswer((_) async => kCharizardResponse);

    final result = await usecase.call(PageParams.initial());
    expect(result, isA<PokemonResponse>());
  });
}
