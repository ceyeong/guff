mixin SelectI {
  bool isMultiple();
  void selectByVisibleText(String text);
  void selectByIndex(int index);
  void selectByValue(String value);
  void deselectAll();
  void deselectByValue(String value);
  void deselectByIndex(int index);
  void deselectByVisibleText(String text);
  getOptions();
}