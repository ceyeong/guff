import 'package:guff/src/service/webdriver_service.dart';
import 'package:guff/src/webdriver/env.dart';
import 'package:test/test.dart';

main() {
  test("Start Service and kill it", () async {
    setEnv("chrome", "C:\\Users\\gurung\\Downloads\\chromedriver.exe");
    int pid = await WebdriverService.Start("chrome");
    expect(pid, WebdriverService.serviceId);
  });

  test("Kill Service", () {
    WebdriverService.Stop();
    expect(WebdriverService.serviceId, null);
  });
}
