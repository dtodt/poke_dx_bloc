import 'package:flutter/material.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';

/// A gridview of pokemon.
class PagedPokemonGrid extends StatelessWidget {
  const PagedPokemonGrid({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Pokemon> data;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          child: Center(
            child: Text(
              data[index].name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        childCount: data.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
    );
  }
}
