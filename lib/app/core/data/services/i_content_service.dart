///? Content service contract, intended for abstracting the http client implementations.
abstract class IContentService {
  /// Retrieves content from the specified URL.
  ///
  /// @param url The URL to retrieve content from.
  ///
  /// @param headers Optional headers to send with the request.
  ///
  /// @return The dynamic content.
  ///
  /// @throws Exception if the content could not be retrieved.
  Future<dynamic> read(String url, {Map<String, String>? headers});

  /// Post content to the specified URL.
  /// @param url The URL to retrieve content from.
  ///
  /// @param headers Optional headers to send with the request.
  ///
  /// @param body Optional body to send with the request.
  ///
  /// @return The dynamic content.
  ///
  /// @throws Exception if the content could not be retrieved.
  Future<dynamic> post(String url,
      {Map<String, String>? headers, Object? body});
}
