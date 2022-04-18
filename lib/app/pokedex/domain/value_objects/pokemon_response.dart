import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

/// Pokemon reponse
class PokemonResponse {
  const PokemonResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final String previous;
  final List<Pokemon> results;
}
