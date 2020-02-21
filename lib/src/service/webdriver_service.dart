import 'dart:io';

import 'package:guff/src/webdriver/env.dart';

class WebdriverService {
  static int serviceId;

  static Future<int> Start(String browser) async {
    String executable = getEnv(browser);
    if (executable == null) {
      throw Error();
    }
    Process res = await Process.start(executable, []);
    WebdriverService.serviceId = res.pid;
    return res.pid;
  }

  static void Stop() {
    Process.killPid(WebdriverService.serviceId);
    WebdriverService.serviceId = null;
  }
}
