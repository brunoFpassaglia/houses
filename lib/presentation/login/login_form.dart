import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/presentation/house_rules/house_rules_page.dart';
import 'package:houses/presentation/login/login_bloc.dart';
import 'package:houses/presentation/login/login_event.dart';
import 'package:houses/presentation/login/login_states.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final LoginBloc loginBloc = Modular.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>.value(
      value: loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Modular.to.pushReplacementNamed('/home');
          }
        },
        builder: (context, state) {
          if (state is LoginFailure) {
            _onWidgetDidBuild(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
              _passwordController.text = "";
            });
          }
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 150, 16, 30),
              child: ListView(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            _onButtonPressed();
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: state is LoginLoading
                            ? CircularProgressIndicator()
                            : null,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onButtonPressed() {
    loginBloc.add(
      LoginAttemptEvent(
          email: _emailController.text, password: _passwordController.text),
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
