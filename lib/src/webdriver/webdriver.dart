import 'package:guff/src/service/webdriver_service.dart';
import 'package:guff/src/webdriver/by.dart';
import 'package:guff/src/webdriver/capabilities.dart';
import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/element.dart';
import 'package:guff/src/webdriver/exe.dart';
import 'package:guff/src/webdriver/navigation.dart';
import 'package:guff/src/webdriver/session.dart';
import 'package:guff/src/webdriver/webdriver_interface.dart';

class WebDriver implements WebDriverInterface {
  WebDriver(this._session);

  @override
  Future<WebDriver> close() async {
    await this.executor(Command(Commands.CLOSE));
    return this;
  }

  @override
  Future<String> getCurrentUrl() async {
    var res = await this.executor(Command(Commands.GET_CURRENT_URL));
    return res["value"];
  }

  @override
  Future<String> getPageSource() async {
    var res = await this.executor(Command(Commands.GET_PAGE_SOURCE));
    return res["value"];
  }

  @override
  Future<String> getTitle() async {
    var res = await this.executor(Command(Commands.GET_PAGE_TITLE));
    return res["value"];
  }

  @override
  Future<String> getWindowHandle() async {
    var res = await this.executor(Command(Commands.GET_WINDOW_HANDLE));
    return res["value"];
  }

  @override
  Future<List<String>> getWindowHandles() async {
    var res = await this.executor(Command(Commands.GET_WINDOW_HANDLES));
    List<String> list = res["value"].cast<String>().toList();
    return list;
  }

  @override
  Future<WebDriver> loadUrl(String url) async {
    await this.navigate().to(url);
    return this;
  }

  @override
  void quit() async {
    await this.executor(Command(Commands.QUIT));
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
    cmd.setParameter("capabilities", capabilities.getCapabilities());
    Map res = await Exe.execute(cmd);
    if (!res["value"].containsKey("sessionId")) {
      throw Exception(
          "Error: Something went wrong. Make sure Webdriver is properly configured");
    }
    Capabilities caps = Capabilities(capabilites: res["value"]["capabilities"]);
    Session session = Session(res["value"]["sessionId"], caps);
    return WebDriver(session);
  }

  @override
  Future<Element> findElement(By by) async {
    Command cmd = Command(Commands.FIND_ELEMENT)
      ..setParameter("using", by.using)
      ..setParameter("value", by.value);
    Map res = await this.executor(cmd);
    String elementId = res["value"].values.first;
    return Element(elementId, this);
  }

  Future<List<Element>> findElements(By by) async {
    Map res = await this.executor(Command(Commands.FIND_ELEMENTS)
      ..setParameter("using", by.using)
      ..setParameter("value", by.value));
    return null;
  }

  Future<Map> executor(Command cmd) {
    cmd.setParameter("sessionId", this._session.id);
    return Exe.execute(cmd);
  }

  @override
  Navigation navigate() {
    return Navigation(this);
  }
}
