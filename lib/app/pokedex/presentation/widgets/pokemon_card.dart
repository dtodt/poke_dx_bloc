import 'package:flutter/material.dart';
import 'package:pokedx/app/configs/images.dart';

const double _cardRadius = 15.0;
const double _fontSize = 18.0;
const double _pokeballFraction = 0.75;
const double _pokemonFraction = 0.76;

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.color,
    required this.name,
    required this.number,
    required this.types,
    required this.portrait,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final String name;
  final String number;
  final Set<String> types;
  final Widget portrait;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _height = constraints.maxHeight;
        final _pokeballSize = _height * _pokeballFraction;
        final _pokemonSize = _height * _pokemonFraction;

        return CardBody(
          color: color,
          child: CardActionFeedback(
            children: <Widget>[
              CardWatermark(cardHeight: _height, size: _pokeballSize),
              CardPortrait(child: portrait, size: _pokemonSize),
              CardIndex(number: number),
              CardContent(name: name, number: number, types: types),
            ],
            color: color,
            onTap: onTap,
          ),
        );
      },
    );
  }
}

/// Button like effect on tap.
class CardActionFeedback extends StatelessWidget {
  const CardActionFeedback({
    Key? key,
    required this.children,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final List<Widget> children;
  final Color color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_cardRadius),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white10,
          highlightColor: Colors.white10,
          child: Stack(
            children: children,
          ),
        ),
      ),
    );
  }
}

/// A rounded colored card.
class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(_cardRadius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: _cardRadius,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// The pokemon dex number.
class CardIndex extends StatelessWidget {
  const CardIndex({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.0,
      right: 16.0,
      child: Text(
        '# ${number.padLeft(3, '0')}',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.14),
        ),
      ),
    );
  }
}

/// The pokemon image position.
class CardPortrait extends StatelessWidget {
  const CardPortrait({
    Key? key,
    required this.child,
    required this.size,
  }) : super(key: key);

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 2.0,
      child: SizedBox(
        width: size,
        height: size,
        child: child,
      ),
    );
  }
}

class CardType extends StatelessWidget {
  const CardType({
    Key? key,
    this.color = Colors.white,
    required this.name,
  }) : super(key: key);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: color.withOpacity(0.2),
      ),
      child: Text(
        name,
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 12.0,
          height: 0.8,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// The pokemon name.
class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
    required this.name,
    required this.number,
    required this.types,
  }) : super(key: key);

  final String name;
  final String number;
  final Set<String> types;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                fontSize: _fontSize,
                height: 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              direction: Axis.vertical,
              spacing: 6.0,
              children: [
                ...types.map((type) {
                  return CardType(name: type);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A pokeball watermark.
class CardWatermark extends StatelessWidget {
  const CardWatermark({
    Key? key,
    required this.cardHeight,
    required this.size,
  }) : super(key: key);

  final double cardHeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -cardHeight * 0.13,
      right: -cardHeight * 0.03,
      child: Image(
        image: AppImages.pokeball,
        width: size,
        height: size,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
