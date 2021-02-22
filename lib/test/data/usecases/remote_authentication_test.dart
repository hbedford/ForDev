import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:faker/faker.dart';
import 'package:meta/meta.dart';

class RemoteAuthentcation {
  final HttpClient httpClient;
  final String url;
  RemoteAuthentcation({@required this.httpClient, @required this.url});
  Future<void> auth() async {
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void> request({
    @required String url,
    @required String method,
  });
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Should call HttpClient with correct value', () async {
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentcation(httpClient: httpClient, url: url);
    await sut.auth();
    verify(httpClient.request(url: url, method: 'post'));
  });
}
