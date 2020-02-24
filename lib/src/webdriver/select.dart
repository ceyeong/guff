import 'package:guff/src/webdriver/select_interface.dart';

import 'package:guff/src/webdriver/by.dart';
import 'package:guff/src/webdriver/element.dart';

class Select implements SelectI {
  final Element _element;
  bool _isMulti;

  Select(this._element) {
    _isMulti = false;
  }

  @override
  void deselectAll() async {
    await _checkIfValidSelect();
    if (!_isMulti) {
      throw Exception('You can only deselect multi-select.');
    }
    for (var element in await getOptions()) {
      _setSelected(element, false);
    }
  }

  @override
  void deselectByIndex(int index) async {
    await _checkIfValidSelect();
    if (!_isMulti) {
      throw Exception('You can only deselect multi-select.');
    }
    await _setSelectByIndex(index, false);
  }

  @override
  void deselectByValue(String value) async {
    await _checkIfValidSelect();
    if (!_isMulti) {
      throw Exception('You can only deselect multi-select.');
    }

    for (var element in await _findOptionsByValue(value)) {
      await _setSelected(element, false);
    }
  }

  @override
  void deselectByVisibleText(String text) async {
    await _checkIfValidSelect();

    if (!_isMulti) {
      throw Exception('You can only deselect multi-select.');
    }

    for (var element in await _findOptionsByVisibleText(text)) {
      _setSelected(element, false);
    }
  }

  @override
  isMultiple() {
    return _isMulti;
  }

  @override
  void selectByIndex(int index) async {
    await _checkIfValidSelect();
    await _setSelectByIndex(index, true);
  }

  @override
  void selectByValue(String value) async {
    await _checkIfValidSelect();
    List<Element> options = await _findOptionsByValue(value);
    await _select(options);
  }

  @override
  void selectByVisibleText(String text) async {
    await _checkIfValidSelect();
    List<Element> options = await _findOptionsByVisibleText(text);
    await _select(options);
  }

  @override
  Future<List<Element>> getOptions() async {
    await _checkIfValidSelect();
    return await _element.findElements(By.tagName('option'));
  }

  Future<List<Element>> _findOptionsByValue(String value) async {
    await _checkIfValidSelect();
    List<Element> elements =
        await _element.findElements(By.xpath('.//option[@value = "${value}"]'));
    if (elements.isEmpty) {
      throw Exception("Cannot locate option with value: ${value}.");
    }
    return elements;
  }

  Future<List<Element>> _findOptionsByVisibleText(String text) async {
    List<Element> options = await _element
        .findElements(By.xpath('//option[normalize-space(.) = "${text}"]'));
    if (options.isNotEmpty) {
      return options;
    }
    options =
        await _element.findElements(By.xpath('//option[text() = "${text}"]'));
    if (options.isEmpty) {
      throw Exception("Option not found with visible text: ${text}");
    }
    return options;
  }

  void _setSelected(Element element, bool select) async {
    if (await element.isSelected() != select) {
      await element.click();
    }
  }

  void _checkIfValidSelect() async {
    var tagName = await _element.getTagName();
    if (tagName == null || (tagName.toLowerCase() != 'select')) {
      throw new Exception("Provided Element is not select.");
    }
    String value = await _element.getAttribute('multiple');
    _isMulti = (value != null && value != 'false');
  }

  void _select(List<Element> options, {bool select = true}) async {
    for (var element in options) {
      await _setSelected(element, select);
      if (!_isMulti) {
        break;
      }
    }
  }

  void _setSelectByIndex(int index, bool select) async {
    for (var element in await getOptions()) {
      if (index.toString() == await element.getAttribute('index')) {
        _setSelected(element, true);
        return;
      }
    }
    throw new Exception('Cannot locate option with index : ${index}');
  }
}
