class Response {
  final int status;
  final List<Map<String, String>> header;
  final String body;
  Response(this.status,this.header, this.body);
}