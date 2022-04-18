import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedx/app/core/presentation/mixins/state_ready_aware.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedx/app/pokedex/presentation/widgets/pokedex_app_bar.dart';
import 'package:pokedx/app/pokedex/presentation/widgets/pokemon_paged_grid.dart';
import 'package:pokedx/app/shared/presentation/widgets/listenable_scroll_view.dart';
import 'package:pokedx/app/shared/presentation/widgets/pokeball_background.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage>
    with StateReadyAware {
  bool appBarTransparent = true;
  bool backButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: SafeArea(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return ListenableScrollView(
              slivers: <Widget>[
                PokedexAppBar(
                  backgroundColor:
                      appBarTransparent ? Colors.transparent : null,
                ),
                if (state is! PokemonLoaded)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                if (state is PokemonLoaded)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    sliver: PokemonPagedGrid(
                      data: state.pokemons,
                    ),
                  ),
              ],
              onScroll: (direction, scroll) => _handleScroll(
                direction,
                scroll,
                nextPage: state is PokemonLoaded ? state.nextPage : null,
              ),
            );
          },
        ),
      ),
      floatingActionButton: backButtonVisible
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.arrow_upward),
              label: const Text('Top'),
              onPressed: _handleFabTap,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Colors.white,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void ready() {
    context.read<PokemonBloc>().add(FetchPokemonEvent(PageParams.initial()));
  }

  void _checkAppBarOpacity(ScrollMetrics metrics) {
    var transparent = true;
    if (metrics.pixels > 150.0) {
      transparent = false;
    }
    if (transparent != appBarTransparent) {
      setState(() {
        appBarTransparent = transparent;
      });
    }
  }

  double _calcInRangePercentageUp(ScrollMetrics metrics) {
    return ((metrics.pixels - metrics.maxScrollExtent) * 100) /
        (metrics.viewportDimension - metrics.maxScrollExtent);
  }

  bool _canFetchMoreData(ScrollMetrics metrics, bool hasNextPage) {
    return metrics.pixels >= (metrics.maxScrollExtent - 100.0) && hasNextPage;
  }

  void _checkFabVisible(AxisDirection direction, ScrollMetrics metrics) {
    var visible = false;

    if (direction == AxisDirection.up &&
        metrics.pixels > metrics.viewportDimension &&
        _calcInRangePercentageUp(metrics) > 15.0) {
      visible = true;
    }

    if (visible != backButtonVisible) {
      setState(() {
        backButtonVisible = visible;
      });
    }
  }

  void _handleFabTap() {
    context.read<PokemonBloc>().add(BackToTheTopEvent());
    setState(() {
      backButtonVisible = false;
    });
  }

  bool _handleScroll(AxisDirection direction, ScrollNotification scroll,
      {PageParams? nextPage}) {
    if (scroll is ScrollUpdateNotification) {
      _checkAppBarOpacity(scroll.metrics);
      _checkFabVisible(direction, scroll.metrics);

      if (_canFetchMoreData(scroll.metrics, nextPage != null)) {
        context.read<PokemonBloc>().add(FetchPokemonEvent(nextPage!));
      }
    }
    return true;
  }
}
