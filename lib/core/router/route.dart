class Route {
  final String _route;

  const Route(this._route);

  String get lastPath => _route.split('/').last;

  String get path => _route;

  String build({
    Map<String, dynamic>? path,
    Map<String, dynamic>? queries,
  }) {
    // Parse the base route
    Uri uri = Uri.parse(_route);

    // Replace path parameters
    if (path != null) {
      path.forEach((key, value) {
        uri =
            uri.replace(path: uri.path.replaceFirst(':$key', value.toString()));
      });
    }

    // Add query parameters
    if (queries != null && queries.isNotEmpty) {
      uri = uri.replace(queryParameters: Map.from(queries));
    }

    return uri.toString();
  }
}
