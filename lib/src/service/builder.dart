import 'package:guff/guff.dart';
import 'package:guff/src/service/webdriver_service.dart';
import 'package:guff/src/webdriver/capabilities.dart';
import 'package:guff/src/webdriver/capability.dart';
import 'package:guff/src/webdriver/webdriver.dart';

class Builder {
  Capabilities _capabilities;

  Builder() {
    _capabilities = Capabilities();
  }

  Builder withChrome() {
    _capabilities.setBrowserName(Capability.CHROME);
    return this;
  }

  Builder withFirefox() {
    _capabilities.setBrowserName(Capability.FIREFOX);
    return this;
  }

  Builder withCapabilities(Map<String, dynamic> capibilities) {
    _capabilities.setCapabilities(capibilities);
    return this;
  }

  Future<WebDriver> build() async {
    //if browser not specifed throw error
    if (_capabilities.getBrowserName() == null) {
      throw Exception('Browser undefined');
    }
    print('starting driver service');
    //start service
    await _startService();

    var driver = await WebDriver.createSession(_capabilities);
    print('returning driver');
    return driver;
  }

  void _startService() async {
    var browsers = [Capability.CHROME, Capability.FIREFOX];
    if (!browsers.contains(_capabilities.getBrowserName())) {
      throw Exception('Unknown Browser ${_capabilities.getBrowserName()}');
    }
    await WebdriverService.Start(_capabilities.getBrowserName());
  }
}
