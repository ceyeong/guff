import 'by.dart';

class Command {
  final Commands _name;
  final Map<String, dynamic> _parameters = {};
  Command(this._name);

  Commands get name => _name;

  ///Set the parameter to send with this command
  Command setParameter(String name, dynamic value) {
    _parameters[name] = value;
    return this;
  }

  Command setParameterByBy(By by) {
    setParameter('using', by.using);
    setParameter('value', by.value);
    return this;
  }

  dynamic getParameter(String key) {
    return _parameters[key];
  }

  Map<String, dynamic> getParameters() {
    return _parameters;
  }
}

enum Commands {
  GET_SERVER_STATUS,
  NEW_SESSION,
  GET_SESSIONS,

  GET_TIMEOUT,
  SET_TIMEOUT,

  CLOSE,
  QUIT,

  GET,
  GET_CURRENT_URL,
  GO_BACK,
  GO_FORWARD,
  REFRESH,

  GET_PAGE_SOURCE,
  GET_PAGE_TITLE,

  //Elements
  FIND_ELEMENT,
  FIND_ELEMENTS,
  GET_ACTIVE_ELEMENTS,
  FIND_CHILD_ELEMENT,
  FIND_CHILD_ELEMENTS,
  FIND_ELEMENT_FROM_ELEMENT,
  FIND_ELEMENTS_FROM_ELEMENT,

  //Elements interactions
  CLICK_ELEMENT,
  CLEAR_ELEMENT,
  SEND_KEYS_TO_ELEMENT,

  //Element State
  IS_ELEMENT_SELECTED,
  GET_ELEMENT_ATTRIBUTE,
  GET_ELEMENT_PROPERTY,
  GET_ELEMENT_CSS_VALUE,
  GET_ELEMENT_TEXT,
  GET_ELEMENT_TAG_NAME,
  GET_ELEMENT_RECT,
  IS_ELEMENT_ENABLED,

  //Context
  GET_WINDOW_HANDLE,
  GET_WINDOW_HANDLES,
  CLOSE_WINDOW,
  SWITCH_TO_WINDOW,
  NEW_WINDOW,
}
