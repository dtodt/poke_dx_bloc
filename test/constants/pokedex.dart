import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';

///? Pokemon Entity
const kCharizardMap = {
  'name': 'charizard',
  'url': 'https://pokeapi.co/api/v2/pokemon/6/'
};
const kMewMap = {
  'name': 'mew',
  'url': 'https://pokeapi.co/api/v2/pokemon/151/'
};

const kCharizard = Pokemon(
  number: '6',
  name: 'Charizard',
  url: 'https://pokeapi.co/api/v2/pokemon/6/',
);
const kMew = Pokemon(
  number: '151',
  name: 'Mew',
  url: 'https://pokeapi.co/api/v2/pokemon/151/',
);

///? Pokemon Api response
const kCharizardResponseMap = {
  'count': 1,
  'next': 'https://pokeapi.co/api/v2/pokemon?offset=6&limit=1',
  'previous': 'https://pokeapi.co/api/v2/pokemon?offset=4&limit=1',
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
  next: 'https://pokeapi.co/api/v2/pokemon?offset=6&limit=1',
  previous: 'https://pokeapi.co/api/v2/pokemon?offset=4&limit=1',
  results: [kCharizard],
);
const kMeyResponse = PokemonResponse(
  count: 1,
  next: '',
  previous: '',
  results: [kMew],
);

///? Page params
const kParamUrl = 'https://pokeapi.co/api/v2/pokemon?offset=10&limit=1';
const kNoParamUrl = 'https://pokeapi.co/api/v2/pokemon';
