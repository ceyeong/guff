Webdirver automation using dart

## Usage

A simple usage example:

```dart
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

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
