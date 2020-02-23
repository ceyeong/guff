import 'package:guff/src/webdriver/http.dart';
import 'package:test/test.dart';

void main() {
  test('resource', (){
    expect(resource('GET','/session'), {'method': 'GET', 'path': '/session'});
  });
  test('POST', (){
    expect(POST('/session'), {'method': 'POST', 'path': '/session'});
  });
  test('GET', (){
    expect(GET('/session'), {'method': 'GET', 'path': '/session'});
  });
  test('DELETE', (){
    expect(DELETE('/session'), {'method': 'DELETE', 'path': '/session'});
  });
  test('buildPath', (){
    var path = buildPath('/session/:sessionId/buttondown', {'sessionId': 12312444});
    expect(path, '/session/12312444/buttondown');
  });
  test('buildPath with no match', (){
    var path = buildPath('/session', {});
    expect(path, '/session');
  });
}