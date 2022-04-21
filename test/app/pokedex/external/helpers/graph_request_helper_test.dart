import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';
import 'package:pokedx/app/pokedex/external/helpers/graph_request_helper.dart';

import '../../../../constants.dart';

void main() {
  test('should create a list query using the provided parameters', () async {
    var result = GraphRequestHelper.buildListQuery(PageParams.initial());
    expect(result.query, equals(kGraphQuery));
  });
}
