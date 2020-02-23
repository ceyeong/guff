import 'package:guff/guff.dart';
import 'package:guff/src/webdriver/env.dart';


void main() async {
  setEnv('chrome', '../drivers/chromedriver');
  var chrome = await Builder().withChrome().build();

  await chrome.loadUrl('https://google.com');
  print(await chrome.getTitle());
  await chrome.sleep(Duration(seconds: 5));
  await chrome.quit();
}
