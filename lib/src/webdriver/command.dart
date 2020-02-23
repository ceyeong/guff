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

  //Elements interactions
  CLICK_ELEMENT,
  CLEAR_ELEMENT,
  GET_ELEMENT_TEXT,
  IS_ELEMENT_ENABLED,
  SEND_KEYS_TO_ELEMENT,

  //Context
  GET_WINDOW_HANDLE,
  GET_WINDOW_HANDLES,
  CLOSE_WINDOW,
  SWITCH_TO_WINDOW,
  NEW_WINDOW,
}
