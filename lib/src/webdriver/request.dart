class Request {
  String method;
  String path;
  var data;
  final header = [
    {"Accept": "application/json; charset=utf-8"}
  ];
  Request(this.method, this.path, this.data);
}
