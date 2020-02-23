import 'package:guff/src/service/webdriver_service.dart';
import 'package:guff/src/webdriver/by.dart';
import 'package:guff/src/webdriver/capabilities.dart';
import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/element.dart';
import 'package:guff/src/webdriver/exe.dart';
import 'package:guff/src/webdriver/navigation.dart';
import 'package:guff/src/webdriver/session.dart';
import 'package:guff/src/webdriver/webdriver_interface.dart';

import 'element.dart';

class WebDriver implements WebDriverInterface {
  WebDriver(this._session);

  @override
  Future<WebDriver> close() async {
    await executor(Command(Commands.CLOSE));
    return this;
  }

  @override
  Future<String> getCurrentUrl() async {
    var res = await executor(Command(Commands.GET_CURRENT_URL));
    return res;
  }

  @override
  Future<String> getPageSource() async {
    var res = await executor(Command(Commands.GET_PAGE_SOURCE));
    return res;
  }

  @override
  Future<String> getTitle() async {
    var res = await executor(Command(Commands.GET_PAGE_TITLE));
    return res;
  }

  @override
  Future<String> getWindowHandle() async {
    var res = await executor(Command(Commands.GET_WINDOW_HANDLE));
    return res;
  }

  @override
  Future<List<String>> getWindowHandles() async {
    var res = await executor(Command(Commands.GET_WINDOW_HANDLES));
    return res;
  }

  @override
  Future<WebDriver> loadUrl(String url) async {
    await navigate().to(url);
    return this;
  }

  @override
  void quit() async {
    await executor(Command(Commands.QUIT));
    WebdriverService.Stop();
  }

  @override
  Future<WebDriver> sleep(Duration duration) async {
    await Future.delayed(duration);
    return this;
  }

  final Session _session;

  static Future<WebDriver> createSession(Capabilities capabilities) async {
    var cmd = Command(Commands.NEW_SESSION);
    cmd.setParameter('capabilities', capabilities.getCapabilities());
    var res = await Exe.execute(cmd);
    if (!res['value'].containsKey('sessionId')) {
      throw Exception(
          'Error: Something went wrong. Make sure Webdriver is properly configured');
    }
    var caps = Capabilities(capabilites: res['value']['capabilities']);
    var session = Session(res['value']['sessionId'], caps);
    return WebDriver(session);
  }

  @override
  Future<Element> findElement(By by) async {
    var cmd = Command(Commands.FIND_ELEMENT)
      ..setParameter('using', by.using)
      ..setParameter('value', by.value);
    var res = await executor(cmd);
    return Element(res, this);
  }

  Future<List<Element>> findElements(By by) async {
    List res = await executor(Command(Commands.FIND_ELEMENTS)
      ..setParameter('using', by.using)
      ..setParameter('value', by.value));
    List<Element> elements;
    elements = [];
    res.forEach((r) => elements.add(Element(r.toString(), this)));
    return elements;
  }

  Future<Object> executor(Command cmd) async {
    cmd.setParameter('sessionId', _session.id);
    var res = await Exe.execute(cmd);
    return _parseBody(res);
  }

  @override
  Navigation navigate() {
    return Navigation(this);
  }

  Object _parseBody(var responseBody) {
    var value = responseBody['value'];
    if (value is Map) {
      return value.values.first;
    } else if (value is List) {
      var ret = [];
      value.forEach((v) {
        ret.add(v.values.first);
      });
      return ret;
    }
    return value;
  }
}
