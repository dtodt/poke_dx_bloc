import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/external/adapters/graph_request_adapter.dart';

import '../../../../constants.dart';

void main() {
  test('should convert a request into map', () async {
    expect(GraphRequestAdapter.toMap(kGraphRequest), kGraphRequestMap);
  });

  test('should convert a request into json string', () async {
    expect(GraphRequestAdapter.toJsonString(kGraphRequest),
        kGraphRequestJsonString);
  });
}
