import 'package:guff/src/webdriver/capabilities.dart';

class Session {
  String id;
  Capabilities capabilities;

  Session(this.id, this.capabilities);
}