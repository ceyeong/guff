import 'package:guff/src/webdriver/capabilities.dart';
import 'package:guff/src/webdriver/element.dart';
import 'package:guff/src/webdriver/navigation.dart';

import '../../guff.dart';

abstract class WebDriverInterface {

  WebDriverInterface(Capabilities capabilities);

  //close the current window
  Future<WebDriverInterface> close();

  //Load a new page in the current browser
  Future<WebDriverInterface> loadUrl(String url);

  //Return current url as string
  Future<String> getCurrentUrl();

  //Get the string source of the page loaded
  Future<String> getPageSource();

  //Get string title of current page
  Future<String> getTitle();

  //Get current window handle
  Future<String> getWindowHandle();

  //list of all the available windows handle
  Future<List<String>> getWindowHandles();

  //Make the dirver sleep for someTime();
  Future<WebDriver> sleep(Duration duration);

  //findElement
  Future<Element> findElement(By by);

  //quit the driver
  void quit();

  //navigation
  Navigation navigate();
}