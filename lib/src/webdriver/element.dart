import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/element_interface.dart';
import 'package:guff/src/webdriver/webdriver.dart';

import 'by.dart';
import 'command.dart';

class Element implements ElementI {
  final String _id;
  final WebDriver _webDriver;
  Element(this._id, this._webDriver);

  @override
  Future<Element> sendKeys(String keys) async {
    await _executor(
        Command(Commands.SEND_KEYS_TO_ELEMENT)..setParameter('text', keys));
    return this;
  }

  @override
  Future<Element> click() async {
    await _executor(Command(Commands.CLICK_ELEMENT));
    return this;
  }

  @override
  Future<Element> clear() async {
    await _executor(Command(Commands.CLEAR_ELEMENT));
    return this;
  }

  @override
  Future<Element> findElement(By by) async {
    var res = await _executor(
        Command(Commands.FIND_ELEMENT_FROM_ELEMENT)..setParameterByBy(by));
    return Element(res, _webDriver);
  }

  @override
  Future<List<Element>> findElements(By by) async {
    List res = await _executor(
        Command(Commands.FIND_ELEMENTS_FROM_ELEMENT)..setParameterByBy(by));
    List<Element> elements;
    elements = [];
    res.forEach((r) => elements.add(Element(r.toString(), _webDriver)));
    return elements;
  }

  @override
  Future<bool> isSelected() async {
    var res = await _executor(Command(Commands.IS_ELEMENT_SELECTED));
    return res;
  }

  @override
  Future<String> getAttribute(String name) async {
    var res = await _executor(
        Command(Commands.GET_ELEMENT_ATTRIBUTE)..setParameter('name', name));
    return res;
  }

  @override
  Future<String> getProperty(String name) async {
    var res = await _executor(Command(Commands.GET_ELEMENT_PROPERTY)..setParameter('name', name));
    return res;
  }

  @override
  Future<String> getCSSValue(String propertyName) async {
    var res = await _executor(Command(Commands.GET_ELEMENT_CSS_VALUE)..setParameter('propertyName', propertyName));
    return res;
  }

  @override
  Future<String> getText() async {
    return await _executor(Command(Commands.GET_ELEMENT_TEXT));
  }

  @override
  Future<String> getTagName() async {
    return await _executor(Command(Commands.GET_ELEMENT_TAG_NAME));
  }

  @override
  Future<Map> getRect() async {
    var res = await _executor(Command(Commands.GET_ELEMENT_RECT));
    return res;
  }

  Future<bool> isEnabled() async {
    return await _executor(Command(Commands.IS_ELEMENT_ENABLED));
  }

  Future<Object> _executor(Command cmd) async {
    cmd.setParameter('id', _id);
    return await _webDriver.executor(cmd);
  }
}


//future extentions.
Future<Element> click(Element element) async {
  return await element.click();
}

Future<Element> clear(Element element) async {
  return await element.clear();
}
