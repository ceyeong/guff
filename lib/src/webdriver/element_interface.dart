import 'by.dart';

mixin ElementI {
  //interaction
  
  click();
  clear();
  sendKeys(String keys);
  
  //state
  isSelected();
  getAttribute(String name);
  getProperty(String name);
  getCSSValue(String propertyName);
  getText();
  getTagName();
  getRect();
  isEnabled();

  //retrival
  findElement(By by);
  findElements(By by);
}