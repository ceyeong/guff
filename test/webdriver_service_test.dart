import 'package:guff/src/service/webdriver_service.dart';
import 'package:test/test.dart';

void main() {
  test('Start Service and kill it', () async {
    var pid = await WebdriverService.Start(browser: 'chrome', executable: '../drivers/chromedriver');
    expect(pid, WebdriverService.serviceId);
  });

  test('Kill Service', () {
    WebdriverService.Stop();
    expect(WebdriverService.serviceId, null);
  });
}
