abstract class LoginPresenter {
  Stream get emailErrorStream;
  void validateEmail(String email);
  void validatePasword(String password);
}
