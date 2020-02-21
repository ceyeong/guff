import 'package:guff/guff.dart';
import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/exe.dart';
import 'element.dart' as e;
import 'package:http/http.dart' as http;
Future t() {
  return http.get("https://pub.dev/");
}

  Future<e.Element> findElement(By by) {
    Command cmd = Command(Commands.FIND_ELEMENT)
      ..setParameter("using", by.using)
      ..setParameter("value", by.value);
    //String elementId = res["value"].values.first;
    return e.Element(executor(cmd));
  }

  
  Future<Map> executor(Command cmd) {
    cmd.setParameter("sessionId", "");
    return Exe.execute(cmd);
  }