import 'package:guff/src/webdriver/capabilities.dart';
import 'package:test/test.dart';

main() {
  test("Empty Capability", (){
    Capabilities capabilities = Capabilities();
    expect(capabilities.getCapabilities(), Map<String, dynamic>());
  });

  test("Capibilities with params", (){
    Capabilities capabilities = Capabilities(capabilites: {"browserName": "chrome"});
    expect(capabilities.getCapabilities()["browserName"], "chrome");
  });

  Capabilities capabilities = Capabilities();
  test("set and get browser name", (){
    capabilities.setBrowserName("chrome");
    expect(capabilities.getBrowserName(), "chrome");
  });

  test("set capabilites", (){
    capabilities.setCapabilities({"browserName": "firefox"});
    expect(capabilities.getBrowserName(), "firefox");
  });
}