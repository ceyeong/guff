import 'package:guff/guff.dart';
import 'package:guff/src/service/webdriver_service.dart';
import 'package:guff/src/webdriver/capabilities.dart';
import 'package:guff/src/webdriver/capability.dart';
import 'package:guff/src/webdriver/webdriver.dart';

class Builder {
  Capabilities _capabilities;

  Builder() {
    this._capabilities = Capabilities();
  }

  Builder withChrome() {
    this._capabilities.setBrowserName(Capability.CHROME);
    return this;
  }

  Builder withFirefox() {
    this._capabilities.setBrowserName(Capability.FIREFOX);
    return this;
  }

  Builder withCapabilities(Map<String, dynamic> capibilities) {
    this._capabilities.setCapabilities(capibilities);
    return this;
  }

  Future<WebDriver> build() async {
    //if browser not specifed throw error
    if (this._capabilities.getBrowserName() == null) {
      throw Exception("Browser undefined");
    }
    print("starting driver service");
    //start service
    await this._startService();

    WebDriver driver = await WebDriver.createSession(this._capabilities);
    print("returning driver");
    return driver;
  }

  void _startService() async {
    List<String> browsers = [Capability.CHROME, Capability.FIREFOX];
    if (!browsers.contains(this._capabilities.getBrowserName())) {
      throw Exception("Unknown Browser ${this._capabilities.getBrowserName()}");
    }
    await WebdriverService.Start(this._capabilities.getBrowserName());
  }
}
