import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

/// Pokemon reponse
class PokemonResponse {
  const PokemonResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final PageParams? next;
  final PageParams? previous;
  final List<Pokemon> results;
}
