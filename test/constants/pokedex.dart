import 'package:pokedx/app/configs/constants.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Pokemon Entity
const kCharizardMap = {'name': 'charizard', 'url': '$kRestPokemonUrl/6/'};
const kMewMap = {'name': 'mew', 'url': '$kRestPokemonUrl/151/'};

const kCharizard = Pokemon(
  number: '6',
  name: 'Charizard',
  portrait: '$kPortraitUrl/6.png',
  types: {},
);
const kCharizardTyped = Pokemon(
  number: '6',
  name: 'Charizard',
  portrait: '$kPortraitUrl/6.png',
  types: {'Fire', 'Flying'},
);
const kMew = Pokemon(
  number: '151',
  name: 'Mew',
  portrait: '$kPortraitUrl/151.png',
  types: {},
);
const kMissigno = Pokemon(
  number: '999',
  name: '',
  portrait: '',
  types: {},
);

///? Pokemon Api response
const kCharizardResponseMap = {
  'count': 1,
  'next': '$kRestPokemonUrl?offset=6&limit=1',
  'previous': '$kRestPokemonUrl?offset=4&limit=1',
  'results': [kCharizardMap]
};
const kMewResponseMap = {
  'count': 1,
  'next': null,
  'previous': null,
  'results': [kMewMap]
};

const kCharizardResponse = PokemonResponse(
  count: 1,
  next: PageParams(limit: 1, offset: 6),
  previous: PageParams(limit: 1, offset: 4),
  results: [kCharizard],
);
const kMeyResponse = PokemonResponse(
  count: 1,
  next: null,
  previous: null,
  results: [kMew],
);

///? Page params
const kParamUrl = '$kRestPokemonUrl?offset=10&limit=1';
