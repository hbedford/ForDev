import '../../../builders/builders.dart';

import '../../../../presentation/protocols/validation.dart';
import '../../../../validation/validators/validators.dart';
import '../../../../validation/protocols/protocols.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build()
  ];
}
