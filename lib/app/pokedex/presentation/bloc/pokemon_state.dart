part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial implements PokemonState {}

class PokemonLoaded implements PokemonState {
  const PokemonLoaded(this.pokemons, {this.nextPage});

  final List<Pokemon> pokemons;
  final PageParams? nextPage;
}
