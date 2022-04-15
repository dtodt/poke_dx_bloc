@TestOn('vm')

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/core/data/services/http_content_service.dart';
import 'package:pokedx/app/core/data/services/i_content_service.dart';

import '../../../../helpers.dart';

void main() {
  final IContentService service = HttpContentService();

  setUp(startServer);

  tearDown(stopServer);

  test('should return a map when the read method is called', () async {
    final result = await service.read(serverUrl.toString(), headers: {
      'test': 'test',
    });
    expect(result, isA<Map>());
  });

  test('read throws an error for a 4** status code', () {
    expect(
      service.read(serverUrl.resolve('/error').toString()),
      throwsClientException,
    );
  });
}
