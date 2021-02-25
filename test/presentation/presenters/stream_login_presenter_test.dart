import 'dart:async';

import 'package:ForDev/presentation/protocols/validation.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:faker/faker.dart';
import 'package:meta/meta.dart';

class LoginState {
  String emailError;
}

class StreamLoginPresenter {
  final Validation validation;
  final _controller = StreamController<LoginState>.broadcast();

  var _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError);
  StreamLoginPresenter({@required this.validation});
  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    _controller.add(_state);
  }
}

class ValidationSpy extends Mock implements Validation {}

StreamLoginPresenter sut;
ValidationSpy validation;
String email;
PostExpectation mockValidationCall(String field) => when(validation.validate(
    field: field == null ? anyNamed('field') : null, value: anyNamed('value')));
void mockValidation({String field, String value}) {
  mockValidationCall(field).thenReturn(value);
}

void main() {
  setUp(() {
    validation = ValidationSpy();
    sut = StreamLoginPresenter(validation: validation);
    email = faker.internet.email();
    mockValidation();
  });
  test('Should call Validation with correct email', () {
    sut.validateEmail(email);
    verify(validation.validate(field: 'email', value: email)).called(1);
  });
  test('Should emit email error if validation fails', () {
    mockValidation(value: 'error');
    expectLater(sut.emailErrorStream, emits('error'));
    sut.validateEmail(email);
  });
}
