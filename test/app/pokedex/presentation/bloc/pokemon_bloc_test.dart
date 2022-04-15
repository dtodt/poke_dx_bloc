import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedx/app/pokedex/domain/usecases/pokemon_fetch.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/presentation/bloc/pokemon_bloc.dart';

import '../../../../constants.dart';
import '../../../../mocks.dart';

void main() {
  late IPokemonFetch fetchUsecase;

  setUp(() {
    fetchUsecase = PokemonFetchMock();
  });

  blocTest<PokemonBloc, PokemonState>(
    'should emit pokemon loading, loaded',
    build: () {
      when(() => fetchUsecase.call(PageParams.initial()))
          .thenAnswer((_) async => kCharizardResponse);
      return PokemonBloc(fetchUsecase);
    },
    act: (bloc) => bloc.add(FetchPokemonEvent(PageParams.initial())),
    expect: () => [
      isA<PokemonLoading>(),
      isA<PokemonLoaded>(),
    ],
  );
}
