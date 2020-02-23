import 'package:guff/src/service/webdriver_service.dart';
import 'package:guff/src/webdriver/env.dart';
import 'package:test/test.dart';

void main() {
  test('Start Service and kill it', () async {
    setEnv('chrome', '../drivers/chromedriver');
    var pid = await WebdriverService.Start('chrome');
    expect(pid, WebdriverService.serviceId);
  });

  test('Kill Service', () {
    WebdriverService.Stop();
    expect(WebdriverService.serviceId, null);
  });
}
