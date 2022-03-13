import 'package:flutter/material.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/utils/core_initiator.dart';

class LoginInitiator extends CoreInitiator {
  late TextController _emailController;
  late TextController _passwordController;
  late GlobalKey<FormState> _formKey;
  

  late AuthBlocCubit _bloc;

  final BuildContext context;
  LoginInitiator(this.context);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bloc.close();
  }

  @override
  void init() {
    _emailController = TextController();
    _passwordController = TextController();
    _formKey = GlobalKey<FormState>();

    _bloc = AuthBlocCubit();
    _bloc.fetchHistoryLogin();
  }

  //
  // Parameters
  //

  TextController get emailController => _emailController;
  TextController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  AuthBlocCubit get bloc => _bloc;

  //
  // Functions
  //

  void handleLogin() async {
    final String? _email = _emailController.value;
    final String? _password = _passwordController.value;

    if (formKey.currentState?.validate() == true &&
        _email != null &&
        _password != null) {
      User user = User(
        email: _email,
        password: _password,
      );

      _bloc.loginUser(user);
    }

    if (formKey.currentState?.validate() == false &&
        _email == null &&
        _password == null) {
      showSnackBar(
        context,
        "Form tidak boleh kosong, mohon cek kembali data yang anda inputkan",
      );
    }
  }

  // function to show snackbar
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void navigateToHome() => Navigator.pushReplacementNamed(context, "/home");

  void onTapRegister() => Navigator.of(context).pushNamed('/register');

  void onLoginError(BuildContext context) {
    showSnackBar(
      context,
      "Login gagal, periksa kembali inputan anda",
    );
  }
}
