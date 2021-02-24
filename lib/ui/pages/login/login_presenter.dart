abstract class LoginPresenter {
  Stream get emailErrorStream;
  Stream get passwordErrorStream;
  Stream get isFormValidStream;
  Stream get isLoadingStream;
  Stream get mainErrorStream;
  void validateEmail(String email);
  void validatePasword(String password);
  void auth();
  void dispose();
}
