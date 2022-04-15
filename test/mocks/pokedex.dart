import 'package:mocktail/mocktail.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';

class PokemonRemoteDsMock extends Mock implements IPokemonRemoteDs {}

class PokemonRepositoryMock extends Mock implements IPokemonRepository {}
