///? Content service contract, intended for abstracting the http client implementations.
abstract class IContentService {
  /// Retrieves content from the specified URL.
  ///
  /// @param url The URL to retrieve content from.
  ///
  /// @param headers Optional headers to send with the request.
  ///
  /// @return The content as a map.
  ///
  /// @throws Exception if the content could not be retrieved.
  Future<Map<String, dynamic>> read(String url, {Map<String, String>? headers});
}
