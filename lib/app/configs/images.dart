import 'package:flutter/material.dart';

const String _imagePath = 'images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const pokeball = _Image('pokeball.png');
  static const bug = _Image('types/Bug.png');
  static const dark = _Image('types/Dark.png');
  static const dragon = _Image('types/Dragon.png');
  static const electric = _Image('types/Electric.png');
  static const fairy = _Image('types/Fairy.png');
  static const fighting = _Image('types/Fighting.png');
  static const fire = _Image('types/Fire.png');
  static const flying = _Image('types/Flying.png');
  static const ghost = _Image('types/Ghost.png');
  static const grass = _Image('types/Grass.png');
  static const ground = _Image('types/Ground.png');
  static const ice = _Image('types/Ice.png');
  static const normal = _Image('types/Normal.png');
  static const poison = _Image('types/Poison.png');
  static const psychic = _Image('types/Psychic.png');
  static const rock = _Image('types/Rock.png');
  static const steel = _Image('types/Steel.png');
  static const water = _Image('types/Water.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(pokeball, context);
    await precacheImage(bug, context);
    await precacheImage(dark, context);
    await precacheImage(dragon, context);
    await precacheImage(electric, context);
    await precacheImage(fairy, context);
    await precacheImage(fighting, context);
    await precacheImage(fire, context);
    await precacheImage(flying, context);
    await precacheImage(ghost, context);
    await precacheImage(grass, context);
    await precacheImage(ground, context);
    await precacheImage(ice, context);
    await precacheImage(normal, context);
    await precacheImage(poison, context);
    await precacheImage(psychic, context);
    await precacheImage(rock, context);
    await precacheImage(steel, context);
    await precacheImage(water, context);
  }
}
