import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedx/app/core/presentation/mixins/state_ready_aware.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/presentation/bloc/pokemon_bloc.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage>
    with StateReadyAware {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PokemonBloc>();
    final state = bloc.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: state is! PokemonLoaded
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                return ListTile(
                  leading: Text(pokemon.number),
                  title: Text(pokemon.name),
                );
              },
            ),
    );
  }

  @override
  void ready() {
    context.read<PokemonBloc>().add(FetchPokemonEvent(PageParams.initial()));
  }
}
