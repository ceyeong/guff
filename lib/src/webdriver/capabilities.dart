import 'package:guff/src/webdriver/capability.dart';

class Capabilities {
  Map<String, dynamic> _capabilites;

  Capabilities({Map<String, dynamic> capabilites}) {
    if (capabilites != null) {
      this._capabilites = capabilites;
    } else {
      this._capabilites = Map<String, dynamic>();
    }
  }
  String getBrowserName() {
    return this._capabilites[Capability.BROWSER_NAME];
  }

  String getPlatformName() {
    return this._capabilites[Capability.PLATFORM_NAME];
  }

  Capabilities setBrowserName(String browser) {
    return this.setCapability(Capability.BROWSER_NAME, browser);
  }

  Capabilities setPlatformName(String platformName) {
    return this.setCapability(Capability.PLATFORM_NAME, platformName);
  }

  Capabilities setCapability(String key, String value) {
    this._capabilites[key] = value;
    return this;
  }

  dynamic getCapability(String key) {
    return this._capabilites[key];
  }

  Map<String, dynamic> getCapabilities() {
    return this._capabilites;
  }

  Capabilities setCapabilities(Map<String, dynamic> capabilities) {
    this._capabilites.addAll(capabilities);
    return this;
  }
}
