import 'package:pokedx/app/configs/constants.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/pokemon_response.dart';
import 'package:pokedx/app/pokedex/external/value_objects/graph_request.dart';

///? Pokemon Entity
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
const kCharizardRestMap = {'name': 'charizard', 'url': '$kRestPokemonUrl/6/'};
const kMewRestMap = {'name': 'mew', 'url': '$kRestPokemonUrl/151/'};

const kCharizardRestResponseMap = {
  'count': 1,
  'next': '$kRestPokemonUrl?offset=6&limit=1',
  'previous': '$kRestPokemonUrl?offset=4&limit=1',
  'results': [kCharizardRestMap]
};
const kMewRestResponseMap = {
  'count': 1,
  'next': null,
  'previous': null,
  'results': [kMewRestMap]
};

///? Pokemon Api graph response
const kCharizardGraphMap = {
  'id': 6,
  'name': 'charizard',
  'pokemon_v2_pokemontypes': [
    {
      'pokemon_v2_type': {'name': 'fire'}
    },
    {
      'pokemon_v2_type': {'name': 'flying'}
    }
  ]
};
const kCharizardGraphResponseMap = {
  'data': {
    'pokemon_v2_pokemon': [kCharizardGraphMap]
  }
};

///? Pokemon response
const kCharizardResponse = PokemonResponse(
  next: PageParams(limit: 1, offset: 6),
  previous: PageParams(limit: 1, offset: 4),
  results: [kCharizard],
);
const kMeyResponse = PokemonResponse(
  next: null,
  previous: null,
  results: [kMew],
);

///? Page params
const kParamUrl = '$kRestPokemonUrl?offset=10&limit=1';

///? Graph request
const kGraphQuery = '''
query pokemon_list {
  pokemon_v2_pokemon(order_by: {id: asc}, where: {is_default: {_eq: true}}, limit: 15, offset: 5) {
    id
    name
    pokemon_v2_pokemontypes(order_by: {slot: asc}) {
      pokemon_v2_type {
        name
      }
    }
  }
}
''';

const kVariableMap = {
  'test': 'test',
};

const kGraphRequestJsonString =
    '{"query":"query pokemon_list {\\n  pokemon_v2_pokemon(order_by: {id: asc}, where: {is_default: {_eq: true}}, limit: 15, offset: 5) {\\n    id\\n    name\\n    pokemon_v2_pokemontypes(order_by: {slot: asc}) {\\n      pokemon_v2_type {\\n        name\\n      }\\n    }\\n  }\\n}\\n","variables":{"test":"test"}}';

const kGraphRequestMap = {
  'query': kGraphQuery,
  'variables': kVariableMap,
};

const kGraphRequest = GraphRequest(
  query: kGraphQuery,
  variables: kVariableMap,
);
