import 'package:pokedx/app/pokedex/domain/value_objects/page_params.dart';

///? Extracts the page param from the url.
class PageParamsHelper {
  static PageParams? extractPageParam(String url) {
    if (url.isEmpty) {
      return null;
    }

    final params = Uri.parse(url).queryParameters;
    if (params.isEmpty) {
      return null;
    }

    return PageParams(
      offset: int.parse(params['offset']!),
      limit: int.parse(params['limit']!),
    );
  }
}
