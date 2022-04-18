import 'package:flutter/material.dart';

class PokedexAppBar extends StatelessWidget {
  const PokedexAppBar({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      expandedHeight: 200,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text('Pokedex'),
      ),
      pinned: true,
    );
  }
}
