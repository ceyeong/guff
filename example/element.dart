import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/webdriver.dart';

class Element {
  var elementFuture;
  WebDriver _webDriver;
  Element(this.elementFuture);

  Future<Element> sendKeys(String keys) async {
    await this._executor(
        Command(Commands.SEND_KEYS_TO_ELEMENT)..setParameter("text", keys));
    return this;
  }

  Future<Element> click() async {
    await this._executor(Command(Commands.CLICK_ELEMENT));
    return this;
  }

  Future<Element> clear() async {
    await this._executor(Command(Commands.CLEAR_ELEMENT));
    return this;
  }

  Future<Map> _executor(Command cmd) async {
    cmd.setParameter("id", _id);
    return await this._webDriver.executor(cmd);
  }
}

Future<Element> click(Element element) async {
  return await element.click();
}

Future<Element> clear(Element element) async {
  return await element.clear();
}
