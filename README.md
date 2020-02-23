A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:guff/guff.dart';

void main() async {
  var chrome = await Builder().withChrome().build();

  await chrome.loadUrl('https://google.com');
  print(await chrome.getTitle());
  await chrome.sleep(Duration(seconds: 5));
  await chrome.quit();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
