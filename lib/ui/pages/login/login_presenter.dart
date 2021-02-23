abstract class LoginPresenter {
  Stream get emailErrorStream;
  Stream get passwordErrorStream;
  void validateEmail(String email);
  void validatePasword(String password);
}
