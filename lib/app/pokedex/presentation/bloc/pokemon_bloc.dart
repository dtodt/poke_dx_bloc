import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/usecases/pokemon_fetch.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/presentation/helpers/page_param_helper.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final IPokemonFetch fetchUsecase;

  PokemonBloc(this.fetchUsecase) : super(PokemonInitial()) {
    on<FetchPokemonEvent>(_fetchPokemons, transformer: droppable());
  }

  Future<void> _fetchPokemons(
      FetchPokemonEvent event, Emitter<PokemonState> emit) async {
    final alreadyLoaded = _retrieveAlreadyLoadedPokemons();
    final response = await fetchUsecase(event.params);
    final nextPage = _extractPageParams(response.next);

    emit(PokemonLoaded(
      [...alreadyLoaded, ...response.results],
      nextPage: nextPage,
    ));
  }

  List<Pokemon> _retrieveAlreadyLoadedPokemons() {
    if (state is PokemonLoaded) {
      return (state as PokemonLoaded).pokemons;
    }
    return [];
  }

  PageParams? _extractPageParams(String next) {
    return PageParamsHelper.extractPageParam(next);
  }
}
