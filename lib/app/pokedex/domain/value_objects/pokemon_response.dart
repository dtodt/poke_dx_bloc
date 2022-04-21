import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

/// Pokemon reponse
class PokemonResponse {
  const PokemonResponse({
    required this.next,
    required this.previous,
    required this.results,
  });

  final PageParams? next;
  final PageParams? previous;
  final List<Pokemon> results;
}
