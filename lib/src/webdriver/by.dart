class By {
  final String using, value;

  By(this.using, this.value);

  //By ID
  static By id(String id) {
    return By.css('*[id="' + id + '"]');
  }

  //By className
  static By className(String className) {
    return By.css("." + className);
  }

  //By css
  static By css(String css) {
    return By("css selector", css);
  }

  //By name
  static By name(String name) {
    return By.css('*[name="' + name + '"]');
  }

  //By linkText
  static By linkText(String linkText) {
    return By("link text", linkText);
  }

  //By partialLinkText
  static By partialLinkText(String partialLinkText) {
    return By("partial link text", partialLinkText);
  }

  //By tagName
  static By tagName(String tagName) {
    return By("tag name", tagName);
  }

  //By xpath
  static By xpath(String xpath) {
    return By("xpath", xpath);
  }

  @override
  String toString() {
    return "\{'using': '${this.using}, 'value': '${this.value}'\}";
  }
}

//Escape css
String escapeCss(String css) {
  String ret = "";

  for (int i = 0; i < css.length; i++) {
    var c = css.codeUnitAt(i);
    if (c == 0x0) {
      throw Error();
    }

    if ((c > 0x00001 && c <= 0x001F) ||
        c == 0x007F ||
        (i == 0 && c >= 0x0030 && c <= 0x0039) ||
        (i == 1 && c >= 0x0030 && c <= 0x0039 && css.codeUnitAt(0) == 0x002D)) {
      ret += '\\' + String.fromCharCode(c) + ' ';
      continue;
    }

    if (i == 0 && c == 0x002D && css.length == 1) {
      ret += '\\' + css.split('')[i];
      continue;
    }

    if (c >= 0x0080 ||
        c == 0x002D ||
        c == 0x005F ||
        (c >= 0x0030 && c <= 0x0039) ||
        (c >= 0x0041 && c <= 0x005A) ||
        (c >= 0x0061 && c <= 0x007A)) {
      ret += css.split('')[i];
      continue;
    }
    ret += '\\' + css.split('')[i];
  }
  return ret;
}
