import 'package:ForDev/data/usecases/remote_authentication.dart';
import 'package:ForDev/infra/http/http.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

import '../../../../presentation/presenters/presenters.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation());
}
