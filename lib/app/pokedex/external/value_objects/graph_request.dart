/// A graphql request.
class GraphRequest {
  const GraphRequest({
    required this.query,
    required this.variables,
  });

  final String query;
  final Map<String, dynamic> variables;
}
