import 'package:guff/src/webdriver/capabilities.dart';
import 'package:test/test.dart';

void main() {
  test('Empty Capability', (){
    var capabilities = Capabilities();
    expect(capabilities.getCapabilities(), <String, dynamic>{});
  });

  test('Capibilities with params', (){
    var capabilities = Capabilities(capabilites: {'browserName': 'chrome'});
    expect(capabilities.getCapabilities()['browserName'], 'chrome');
  });

  var capabilities = Capabilities();
  test('set and get browser name', (){
    capabilities.setBrowserName('chrome');
    expect(capabilities.getBrowserName(), 'chrome');
  });

  test('set capabilites', (){
    capabilities.setCapabilities({'browserName': 'firefox'});
    expect(capabilities.getBrowserName(), 'firefox');
  });
}