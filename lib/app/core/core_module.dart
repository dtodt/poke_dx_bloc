import 'package:pokedx/app/core/data/services/i_content_service.dart';
import 'package:pokedx/app/core/external/services/http_content_service.dart';
import 'package:provider/provider.dart';

/// Core dependency injection
final coreModule = [
  Provider<IContentService>.value(value: HttpContentService()),
];
