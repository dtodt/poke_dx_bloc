import 'dart:convert';

import 'package:pokedx/app/pokedex/external/value_objects/graph_request.dart';

///
class GraphRequestAdapter {
  ///
  static Map<String, dynamic> toMap(GraphRequest request) {
    return {
      'query': request.query,
      'variables': request.variables,
    };
  }

  ///
  static String toJsonString(GraphRequest request) {
    return json.encode(toMap(request));
  }
}
