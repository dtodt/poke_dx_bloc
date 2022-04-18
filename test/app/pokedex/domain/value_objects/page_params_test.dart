import 'package:flutter_test/flutter_test.dart';
import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

void main() {
  test('should format the page params correctly', () async {
    expect(
      PageParams.initial().toString(),
      equals('limit=20&offset=0'),
    );
    expect(
      const PageParams(limit: 10, offset: 5).toString(),
      equals('limit=10&offset=5'),
    );
  });
}
