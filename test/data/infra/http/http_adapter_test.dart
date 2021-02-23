import 'dart:convert';

import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';
import 'package:faker/faker.dart';

class HttpAdapter {
  final Client client;
  HttpAdapter(this.client);
  Future<void> request(
      {@required String url, @required String method, Map body}) async {
    final headers = {
      'content-type': 'aplication/json',
      'accept': 'application/json'
    };
    await client.post(url, headers: headers, body: jsonEncode(body));
  }
}

class ClientSpy extends Mock implements Client {}

void main() {
  HttpAdapter sut;
  ClientSpy client;
  String url;
  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });
  group('post', () {
    test('Should call post with correct values', () async {
      await sut
          .request(url: url, method: 'post', body: {'any_key': 'any_value'});
      verify(client.post(url,
          headers: {
            'content-type': 'aplication/json',
            'accept': 'application/json'
          },
          body: '{"any_key":"any_value"}'));
    });
  });
}
