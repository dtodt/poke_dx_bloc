import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/configs/colors.dart';

void main() {
  test('should return the right color if the type exists', () async {
    expect(AppColors.getTypeColor('Fire'), equals(kFire));
  });

  test('should return the transparent color if the type not exists', () async {
    expect(AppColors.getTypeColor('fire'), equals(Colors.transparent));
  });
}
