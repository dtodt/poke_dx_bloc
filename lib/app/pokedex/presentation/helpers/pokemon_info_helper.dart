import 'package:pokedx/app/pokedex/configs/types.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

///? Fill inexistent fields with appropriate values.
class PokemonInfoHelper {
  static List<Pokemon> fillAbstentInfo(List<Pokemon> list) {
    return list

        ///? There are some indexes returned by the API that are not valid.
        .where((pokemon) => PokemonTypes.isIndexValid(pokemon.number))
        .map(
          (pokemon) => Pokemon(
            name: pokemon.name,
            number: pokemon.number,
            portrait: pokemon.portrait,

            ///? Search for the pokemon types.
            types: PokemonTypes.getIndexTypes(pokemon.number),
          ),
        )
        .toList();
  }
}
