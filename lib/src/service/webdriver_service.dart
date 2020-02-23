import 'dart:io';

class WebdriverService {
  static int serviceId;

  static Future<int> Start({String browser, String executable}) async {
    if (executable == null) {
      throw Exception('Webdriver path not provided');
    }
    var res = await Process.start(executable, []);
    WebdriverService.serviceId = res.pid;
    return res.pid;
  }

  static void Stop() {
    Process.killPid(WebdriverService.serviceId);
    WebdriverService.serviceId = null;
  }
}
