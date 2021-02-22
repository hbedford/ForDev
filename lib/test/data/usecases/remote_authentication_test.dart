import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

import 'package:ForDev/domain/usecase/authentication.dart';

class RemoteAuthentcation {
  final HttpClient httpClient;
  final String url;
  RemoteAuthentcation({@required this.httpClient, @required this.url});
  Future<void> auth(AuthenticationParams params) async {
    final body = {'email': params.email, 'password': params.secret};
    await httpClient.request(url: url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void> request(
      {@required String url, @required String method, Map body});
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentcation sut;
  HttpClientSpy httpClient;
  String url;
  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentcation(httpClient: httpClient, url: url);
  });
  test('Should call HttpClient with correct value', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    await sut.auth(params);
    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });
}
