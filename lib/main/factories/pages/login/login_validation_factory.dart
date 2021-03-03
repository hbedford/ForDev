import '../../../../presentation/protocols/validation.dart';
import '../../../../validation/validators/validators.dart';
import '../../../../validation/protocols/protocols.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password')
  ];
}
