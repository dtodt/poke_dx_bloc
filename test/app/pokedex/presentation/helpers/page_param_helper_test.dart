import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/configs/constants.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/presentation/helpers/page_param_helper.dart';

import '../../../../constants.dart';

void main() {
  test('should return the page param when the url is correct', () async {
    expect(PageParamsHelper.extractPageParam(kParamUrl), isA<PageParams>());
  });

  test('should return null when theres no param on the url', () async {
    expect(PageParamsHelper.extractPageParam(kRestPokemonUrl), isNull);
  });

  test('should return null when the url is empty', () async {
    expect(PageParamsHelper.extractPageParam(''), isNull);
  });
}
