import 'package:guff/src/webdriver/command.dart';

Map GET(String path) {
  return resource('GET', path);
}

Map POST(String path) {
  return resource('POST', path);
}

Map DELETE(String path) {
  return resource('DELETE', path);
}

Map resource(String method, String path) {
  return {'method': method, 'path': path};
}

String buildPath(String path, Map<String, dynamic> parameters) {
  var exp = RegExp(r'\/:(\w+)\b');
  List<Match> matches = exp.allMatches(path).toList();
  if (matches.isEmpty) {
    return path;
  }
  for (var i = 0; i < matches.length; ++i) {
    var key = matches[i].group(0).substring(2);
    if (parameters[key] == null) {
      //passed parameters doesn't contain required key
      print(parameters);
      throw Error();
    }
    if (!(parameters[key] is String)) {
      parameters[key] = parameters[key].toString();
    }
    path = path.replaceFirst(matches[i].group(0), '/' + parameters[key]);
  }
  return path;
}

Map COMMAND_MAP = {
  Commands.GET_SERVER_STATUS: GET('/status'),
  Commands.NEW_SESSION: POST('/session'),
  Commands.GET_SESSIONS: GET('/sessions'),

  Commands.GET_TIMEOUT : GET('/session/sessionId/timeouts'),
  Commands.SET_TIMEOUT : POST('/session/sessionId/timeouts'),

  Commands.CLOSE: DELETE('/session/:sessionId/window'),
  Commands.QUIT: DELETE('/session/:sessionId'),

  Commands.GET: POST('/session/:sessionId/url'),
  Commands.GET_CURRENT_URL : GET('/session/:sessionId/url'),
  Commands.GO_BACK : POST('/session/:sessionId/back'),
  Commands.GO_FORWARD : POST('/session/:sessionId/forward'),
  Commands.REFRESH : POST('/session/:sessionId/refresh'),

  Commands.GET_PAGE_SOURCE : GET('/session/:sessionId/source'),
  Commands.GET_PAGE_TITLE : GET('/session/:sessionId/title'),

  //Elements
  Commands.FIND_ELEMENT : POST('/session/:sessionId/element'),
  Commands.FIND_ELEMENTS : POST('/session/:sessionId/elements'),
  Commands.GET_ACTIVE_ELEMENTS : GET('/session/:sessionId/element/active'),
  Commands.FIND_CHILD_ELEMENT : POST('/session/:sessionId/element/:id/element'),
  Commands.FIND_CHILD_ELEMENTS : POST('/session/:sessionId/element/:id/elements'),

  //Interactions
  Commands.CLICK_ELEMENT : POST('/session/:sessionId/element/:id/click'),
  Commands.CLEAR_ELEMENT : POST('/session/:sessionId/element/:id/clear'),
  Commands.GET_ELEMENT_TEXT : GET('/session/:sessionId/element/:id/text'),
  Commands.IS_ELEMENT_ENABLED : GET('/session/:sessionId/element/:id/enabled'),
  Commands.SEND_KEYS_TO_ELEMENT : POST('/session/:sessionId/element/:id/value'),

  //Contexts
  Commands.GET_WINDOW_HANDLE : GET('/session/:sessionId/window'),
  Commands.GET_WINDOW_HANDLES : GET('/session/:sessionId/window/handles'),
  Commands.CLOSE_WINDOW : DELETE('/session/:sessionId/window'),
  Commands.SWITCH_TO_WINDOW : POST('/session/:sessionId/window'),
  Commands.NEW_WINDOW : POST('/session/:sessionId/window/new')
};
