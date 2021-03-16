import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

import '../../../../presentation/presenters/presenters.dart';

LoginPresenter makeStreamLoginPresenter() {
  return StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation());
}

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation());
}
