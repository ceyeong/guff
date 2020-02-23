import 'package:guff/src/webdriver/capability.dart';

class Capabilities {
  Map<String, dynamic> _capabilites;

  Capabilities({Map<String, dynamic> capabilites}) {
    if (capabilites != null) {
      _capabilites = capabilites;
    } else {
      _capabilites = <String, dynamic>{};
    }
  }
  String getBrowserName() {
    return _capabilites[Capability.BROWSER_NAME];
  }

  String getPlatformName() {
    return _capabilites[Capability.PLATFORM_NAME];
  }

  Capabilities setBrowserName(String browser) {
    return setCapability(Capability.BROWSER_NAME, browser);
  }

  Capabilities setPlatformName(String platformName) {
    return setCapability(Capability.PLATFORM_NAME, platformName);
  }

  Capabilities setCapability(String key, String value) {
    _capabilites[key] = value;
    return this;
  }

  dynamic getCapability(String key) {
    return _capabilites[key];
  }

  Map<String, dynamic> getCapabilities() {
    return _capabilites;
  }

  Capabilities setCapabilities(Map<String, dynamic> capabilities) {
    _capabilites.addAll(capabilities);
    return this;
  }
}
