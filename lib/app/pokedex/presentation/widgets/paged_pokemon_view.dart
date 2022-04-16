import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedx/app/core/presentation/mixins/state_ready_aware.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

class PagedPokemonView extends StatefulWidget {
  const PagedPokemonView({Key? key}) : super(key: key);

  @override
  State<PagedPokemonView> createState() => _PagedPokemonViewState();
}

class _PagedPokemonViewState extends State<PagedPokemonView>
    with StateReadyAware {
  final _pagingController = PagingController<int, Pokemon>(
    firstPageKey: 0,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    // TODO: Implement the function's body.
  }

  @override
  void ready() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }
}
