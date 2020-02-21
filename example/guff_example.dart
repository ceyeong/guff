import 'package:guff/guff.dart';
import 'package:guff/src/webdriver/env.dart';

main() async {
  setEnv("chrome", "C:\\Users\\gurung\\Downloads\\chromedriver.exe");

  WebDriver driver = await Builder().withChrome().build();

  driver = await driver.loadUrl("https://facebook.com");

  //var searchBox = await driver.findElement(By.id("search-by"));
  //await searchBox.sendKeys("keys");
  //await searchBox.sendKeys("keys");
  await driver.navigate().to("https://google.com");
  await driver.sleep(Duration(seconds: 5));
  
  await driver.getWindowHandle();
  for(String handle in await driver.getWindowHandles()){
    print(handle);
  }
  Map<String, dynamic> mp = {"apple": 123};
  mp.addAll({"apple":11123, "mango": 123});
  print(mp);
  //await driver.close();
  //await driver.loadUrl("https://chocolatey.org/");


  await driver.sleep(Duration(seconds: 10));
  
  driver.quit();
}
