import 'dart:convert';

import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/http.dart';
import 'package:http/http.dart' as http;

class Exe {
  static final URL = 'http://localhost:9515';

  static Future<Map> execute(Command cmd) async {
    Map resource = COMMAND_MAP[cmd.name];
    http.Response response;
    switch (resource['method']) {
      case 'GET':
        response = await http
            .get(URL + buildPath(resource['path'], cmd.getParameters()));
        break;
      case 'POST':
        response = await http.post(
            URL + buildPath(resource['path'], cmd.getParameters()),
            body: jsonEncode(cmd.getParameters()));
        break;
      case 'DELETE':
        response = await http
            .delete(URL + buildPath(resource['path'], cmd.getParameters()));
        break;
      default:
        // unknown method;
        throw Exception(
            'Error occured while trying to send request to webdriver');
    }
    if (response == null) {
      throw Exception('Empty response was sent by server');
    }
    Map resBody = jsonDecode(response.body);
    if (resBody['value'] != null &&
        resBody['value'] is Map &&
        resBody['value'].containsKey('error')) {
      throw Exception('Error: ' +
          resBody['value']['error'] +
          '\n ' +
          resBody['value']['message']);
    }
    return resBody;
  }
}
