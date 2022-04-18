import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedx/app/core/presentation/mixins/state_ready_aware.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedx/app/pokedex/presentation/widgets/paged_pokemon_grid.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage>
    with StateReadyAware {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return Scaffold(
          body: NotificationListener<ScrollNotification>(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(title: Text('Pokedex'), pinned: true),
                if (state is! PokemonLoaded)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                if (state is PokemonLoaded)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: PagedPokemonGrid(
                      data: state.pokemons,
                    ),
                  ),
              ],
            ),
            onNotification: (notification) => _handleScrollEnd(
              notification,
              nextPage: state is PokemonLoaded ? state.nextPage : null,
            ),
          ),
        );
      },
    );
  }

  @override
  void ready() {
    context.read<PokemonBloc>().add(FetchPokemonEvent(PageParams.initial()));
  }

  bool _handleScrollEnd(ScrollNotification notification,
      {PageParams? nextPage}) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent &&
        nextPage != null) {
      context.read<PokemonBloc>().add(FetchPokemonEvent(nextPage));
    }
    return false;
  }
}
