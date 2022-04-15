import 'dart:convert';

import 'package:http/http.dart' as http;

import 'i_content_service.dart';

///? Content service implementation
class HttpContentService implements IContentService {
  @override
  Future<Map<String, dynamic>> read(String url,
      {Map<String, String>? headers}) async {
    final response =
        await http.read(Uri.parse(url)).onError((error, stackTrace) =>
            // TODO create a specialised exception here
            throw Error.throwWithStackTrace(error ?? {}, stackTrace));
    return json.decode(response) as Map<String, dynamic>;
  }
}
