import 'dart:io';

import 'package:guff/src/webdriver/capability.dart';

class WebdriverService {
  static int serviceId;

  static Future<int> Start({String browser, String executable}) async {
    if (executable == null) {
      throw Exception('Webdriver path not provided');
    }
    List<String> params = [];
    if(browser == Capability.FIREFOX) {
      params.add('-p');
      params.add('9515');
    }

    var res = await Process.start(executable, params);
    WebdriverService.serviceId = res.pid;
    return res.pid;
  }

  static void Stop() {
    Process.killPid(WebdriverService.serviceId);
    WebdriverService.serviceId = null;
  }
}
