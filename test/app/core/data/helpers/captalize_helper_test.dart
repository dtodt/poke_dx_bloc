import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/core/data/helpers/captalize_helper.dart';

void main() {
  test('should captalize a word', () async {
    expect(CaptalizeHelper.captalize('word'), equals('Word'));
  });

  test('should captalize the 1st word', () async {
    expect(CaptalizeHelper.captalize('word another word'),
        equals('Word another word'));
  });

  test('should captalize all words', () async {
    expect(CaptalizeHelper.captalizeAll('word another word'),
        equals('Word Another Word'));
  });
}
