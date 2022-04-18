import 'package:flutter/material.dart';
import 'package:pokedx/app/configs/images.dart';

const double _pokeballWidthFraction = 0.664;

///
class PokeballBackground extends StatelessWidget {
  const PokeballBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  final Widget child;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    final pokeballSize =
        MediaQuery.of(context).size.width * _pokeballWidthFraction;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -pokeballSize * 0.50,
            right: -pokeballSize * 0.40,
            child: Image(
              image: AppImages.pokeball,
              width: pokeballSize,
              height: pokeballSize,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          child,
        ],
      ),
      extendBody: true,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
