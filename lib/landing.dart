import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:majootestcase/modules/home/page.dart';
import 'package:majootestcase/modules/login/page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late AuthBlocCubit _bloc;

  @override
  void initState() {
    _bloc = AuthBlocCubit()..fetchHistoryLogin();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is AuthBlocLoginState) {
          return LoginPage();
        } else if (state is AuthBlocLoggedInState) {
          return HomePage();
        } else
          return Scaffold(
            body: Center(
              child: Text(kDebugMode ? "state not implemented $state" : ""),
            ),
          );
      },
    );
  }
}
