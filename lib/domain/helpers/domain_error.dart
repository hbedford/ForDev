enum DomainError { unexpected, invalidCredentials }

extension DomainErroExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Crendenciais inválidas.';
      default:
        return '';
    }
  }
}
