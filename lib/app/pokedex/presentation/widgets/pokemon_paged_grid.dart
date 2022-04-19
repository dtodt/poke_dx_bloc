import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:pokedx/app/configs/colors.dart';
import 'package:pokedx/app/pokedex/domain/entities/pokemon.dart';
import 'package:pokedx/app/pokedex/presentation/widgets/pokemon_card.dart';

/// A gridview of pokemon.
class PokemonPagedGrid extends StatelessWidget {
  const PokemonPagedGrid({
    Key? key,
    this.columnCount = 2,
    required this.data,
  }) : super(key: key);

  final int columnCount;
  final List<Pokemon> data;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => PokemonCard(
          key: ValueKey('${data[index].number}-${data[index].name}'),
          color: AppColors.getTypeColor(data[index].types.first),
          name: data[index].name,
          number: data[index].number,
          types: data[index].types,
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: columnCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
