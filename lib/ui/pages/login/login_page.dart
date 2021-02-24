import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  LoginPage(this.presenter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(),
            Headline1(
              text: 'Login',
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                  child: Column(
                children: [
                  StreamBuilder<String>(
                    stream: presenter.emailErrorStream,
                    builder: (context, snapshot) => TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          errorText: snapshot.data?.isEmpty == true
                              ? null
                              : snapshot.data),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: presenter.validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 32),
                    child: StreamBuilder<String>(
                      stream: presenter.passwordErrorStream,
                      builder: (context, snapshot) => TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            errorText: snapshot.data?.isEmpty == true
                                ? null
                                : snapshot.data),
                        obscureText: true,
                        onChanged: presenter.validatePasword,
                      ),
                    ),
                  ),
                  StreamBuilder<bool>(
                    stream: presenter.isFormValidStream,
                    builder: (context, snapshot) => RaisedButton(
                      onPressed: snapshot.data == true ? presenter.auth : null,
                      child: Text('Entrar'.toUpperCase()),
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    label: Text('Criar Conta'),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
