enum HTTPMethod {
  get,
  head,
  post,
  put,
  patch,
  delete,
}

extension HTPPMethodExtension on HTTPMethod {
  String get name {
    switch (this) {
      case HTTPMethod.get:
        return 'GET';
      case HTTPMethod.head:
        return 'HEAD';
      case HTTPMethod.post:
        return 'POST';
      case HTTPMethod.put:
        return 'PUT';
      case HTTPMethod.patch:
        return 'PATCH';
      case HTTPMethod.delete:
        return 'DELETE';
    }
  }
}
