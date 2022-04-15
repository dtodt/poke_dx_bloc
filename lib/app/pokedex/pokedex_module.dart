import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedx/app/app_constants.dart';
import 'package:pokedx/app/pokedex/data/datasources/i_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedx/app/pokedex/domain/usecases/pokemon_fetch.dart';
import 'package:pokedx/app/pokedex/external/datasources/rest_pokemon_remote_ds.dart';
import 'package:pokedx/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:provider/provider.dart';

/// Pokedex dependency injection
final pokedexModule = [
  /// Services
  Provider<IPokemonRemoteDs>(
      create: (context) =>
          RestPokemonRemoteDs(context.read(), kRestPokemonUrl)),
  Provider<IPokemonRepository>(
      create: (context) => PokemonRepository(context.read())),

  /// Usecases
  Provider<IPokemonFetch>(create: (context) => PokemonFetch(context.read())),

  /// Blocs
  BlocProvider<PokemonBloc>(
    create: (context) => PokemonBloc(context.read()),
  ),
];
