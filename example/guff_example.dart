import 'package:guff/guff.dart';

void main() async {
  var chrome = await Builder()
      .withExecutable('../drivers/chromedriver')
      .withChrome()
      .build();
  await chrome.loadUrl('https://google.com');
  print(await chrome.getTitle());
  await chrome.sleep(Duration(seconds: 5));
  await chrome.quit();
}
