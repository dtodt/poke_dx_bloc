import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/presentation/helpers/pokemon_info_helper.dart';

import '../../../../constants.dart';

void main() {
  test('should fill the types field', () async {
    final result = PokemonInfoHelper.fillAbstentInfo([kCharizard]);
    expect(result, isNotEmpty);
    expect(result[0].types, isNotEmpty);
    expect(setEquals(result[0].types, kCharizardTyped.types), isTrue);
  });

  test('should return empty when the list contains invalid', () async {
    final result = PokemonInfoHelper.fillAbstentInfo([kMissigno]);
    expect(result, isEmpty);
  });

  test('should ignore changes when has the types', () async {
    final result = PokemonInfoHelper.fillAbstentInfo([kCharizardTyped]);
    expect(result, isNotEmpty);
    expect(result[0].types, isNotEmpty);
    expect(setEquals(result[0].types, kCharizardTyped.types), isTrue);
  });
}
