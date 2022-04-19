import 'package:flutter/material.dart';

const kBug = Color(0xFFA6B91A);
const kDark = Color(0xFF705746);
const kDragon = Color(0xFF6F35FC);
const kElectric = Color(0xFFF7D02C);
const kFairy = Color(0xFFD685AD);
const kFighting = Color(0xFFC22E28);
const kFire = Color(0xFFEE8130);
const kFlying = Color(0xFFA98FF3);
const kGhost = Color(0xFF735797);
const kGrass = Color(0xFF7AC74C);
const kGround = Color(0xFFE2BF65);
const kIce = Color(0xFF96D9D6);
const kNormal = Color(0xFFA8A77A);
const kPoison = Color(0xFFA33EA1);
const kPsychic = Color(0xFFF95587);
const kRock = Color(0xFFB6A136);
const kSteel = Color(0xFFB7B7CE);
const kWater = Color(0xFF6390F0);

const typeColorMap = {
  'Bug': kBug,
  'Dark': kDark,
  'Dragon': kDragon,
  'Electric': kElectric,
  'Fairy': kFairy,
  'Fighting': kFighting,
  'Fire': kFire,
  'Flying': kFlying,
  'Ghost': kGhost,
  'Grass': kGrass,
  'Ground': kGround,
  'Ice': kIce,
  'Normal': kNormal,
  'Poison': kPoison,
  'Psychic': kPsychic,
  'Rock': kRock,
  'Steel': kSteel,
  'Water': kWater,
};

/// Returns the color associated with the given type.
/// Or transparent if the type is not found, which never should happen.
class AppColors {
  static Color getTypeColor(String type) {
    return typeColorMap[type] ?? Colors.transparent;
  }
}
