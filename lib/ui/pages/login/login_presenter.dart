abstract class LoginPresenter {
  Stream<String> get emailErrorStream;
  Stream<String> get passwordErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String> get mainErrorStream;
  void validateEmail(String email);
  void validatePasword(String password);
  Future<void> auth();
  void dispose();
}
