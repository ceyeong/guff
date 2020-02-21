import 'package:guff/src/webdriver/command.dart';

import 'webdriver.dart';

class Navigation {
  WebDriver _driver;
  Navigation(this._driver);

  // Load url
  void to(String url) async {
    await this._driver.executor(Command(Commands.GET)..setParameter("url", url));
  }

  // Browser back
  void back() async {
    await this._driver.executor(Command(Commands.GO_BACK));
  }

  // Browser forward
  void forward() async {
    await this._driver.executor(Command(Commands.GO_FORWARD));
  }

  // Browser refresh
  void refresh() async {
    await this._driver.executor(Command(Commands.REFRESH));
  }
}