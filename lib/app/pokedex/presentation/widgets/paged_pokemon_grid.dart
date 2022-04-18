import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/presentation/widgets/pokemon_card.dart';

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
        (context, index) => PokemonCard(
          key: ValueKey('${data[index].number}-${data[index].name}'),
          color: Theme.of(context).colorScheme.background,
          name: data[index].name,
          number: data[index].number,
          portrait: CachedNetworkImage(
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.contain,
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
            imageUrl: data[index].portrait,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            useOldImageOnUrlChange: true,
          ),
          onTap: () {},
        ),
        childCount: data.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
