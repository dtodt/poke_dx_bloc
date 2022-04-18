import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedx/app/core/data/services/i_content_service.dart';

///? Content service implementation
class HttpContentService implements IContentService {
  @override
  Future<dynamic> read(String url, {Map<String, String>? headers}) async {
    final response =
        await http.read(Uri.parse(url)).onError((error, stackTrace) =>
            // TODO create a specialised exception here
            throw Error.throwWithStackTrace(error ?? {}, stackTrace));
    return json.decode(response);
  }
}
