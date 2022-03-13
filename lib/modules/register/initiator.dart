import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:majootestcase/bloc/register_bloc/register_bloc.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';
import 'package:majootestcase/utils/core_initiator.dart';

class RegisterInitiator extends CoreInitiator {
  late TextController _usernameController;
  late TextController _emailController;
  late TextController _passwordController;
  late GlobalKey<FormState> _formKey;

  late RegisterBloc _registerBloc;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    _registerBloc.close();
  }

  @override
  void init() {
    _usernameController = TextController();
    _emailController = TextController();
    _passwordController = TextController();
    _formKey = GlobalKey<FormState>();

    _registerBloc = RegisterBloc();
  }

  ///
  /// Getters
  ///

  TextController get usernameController => _usernameController;
  TextController get emailController => _emailController;
  TextController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  RegisterBloc get bloc => _registerBloc;

  ///
  /// Functions
  ///

  void handleRegister(BuildContext context) {
    String? username = _usernameController.value;
    String? email = _emailController.value;
    String? password = _passwordController.value;

    if (_formKey.currentState?.validate() == true) {
      _registerBloc.onRegisterButtonPressed(
        username: username,
        email: email,
        password: password,
      );
    } else {
      if (emailController.value != null &&
          emailController.value?.contains('@') == false) {
        showSnackBar(context, 'Masukkan e-mail yang valid');
      } else {
        showSnackBar(
          context,
          "Form tidak boleh kosong,mohon cek kembali data yang anda inputkan.",
        );
      }
    }
  }

  void onRegisterSuccess(BuildContext context) {
    showSnackBar(context, 'Berhasil mendaftar');

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (Route<dynamic> route) => false,
      );
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
