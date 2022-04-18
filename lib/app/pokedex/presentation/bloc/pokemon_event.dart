part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class FetchPokemonEvent implements PokemonEvent {
  const FetchPokemonEvent(this.params);

  final PageParams params;
}

class BackToTheTopEvent implements PokemonEvent {}
