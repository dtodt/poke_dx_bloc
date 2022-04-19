import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/configs/types.dart';

void main() {
  test('should return true if the index is valid', () async {
    expect(PokemonTypes.isIndexValid('1'), isTrue);
  });

  test('should return false if the index is invalid', () async {
    expect(PokemonTypes.isIndexValid('0'), isFalse);
  });

  test('should return the type list if the index is valid', () async {
    expect(PokemonTypes.getIndexTypes('1'), isNotEmpty);
  });

  test('should return an empty list if the index is invalid', () async {
    expect(PokemonTypes.getIndexTypes('0'), isEmpty);
  });
}
