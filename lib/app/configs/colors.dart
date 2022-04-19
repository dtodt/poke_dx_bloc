import 'package:flutter/material.dart';

const kBug = Color(0xFFa8b821);
const kDark = Color(0xFF776554);
const kDragon = Color(0xFF623bd5);
const kElectric = Color(0xFFf8b00f);
const kFairy = Color(0xFFf8b8e8);
const kFighting = Color(0xFFe83001);
const kFire = Color(0xFFf08030);
const kFlying = Color(0xFF9f94be);
const kGhost = Color(0xFF5d4674);
const kGrass = Color(0xFF78c851);
const kGround = Color(0xFFd8e02f);
const kIce = Color(0xFF98d9d8);
const kNormal = Color(0xFFa8a8a8);
const kPoison = Color(0xFFa040a0);
const kPsychic = Color(0xFFf85888);
const kRock = Color(0xFFb8a038);
const kSteel = Color(0xFFb1adbb);
const kWater = Color(0xFF6890f0);

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
