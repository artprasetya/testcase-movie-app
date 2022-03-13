import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:majootestcase/modules/home/initiator.dart';
import 'package:majootestcase/ui/extra/error_screen.dart';
import 'package:majootestcase/ui/extra/loading.dart';
import 'package:majootestcase/modules/home/components/home_loaded_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeInitiator _initiator;

  @override
  void initState() {
    _initiator = HomeInitiator()..init();
    super.initState();
  }

  @override
  void dispose() {
    _initiator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _initiator.bloc,
      listener: (context, state) {
        if (state is HomeBlocLoggedOutSuccesState)
          _initiator.onLogoutSuccess(context);
      },
      builder: (context, state) {
        if (state is HomeBlocLoadedState && state.data != null) {
          return HomeLoadedView(
            data: state.data,
            onTap: _initiator.onTapMovie,
            onTapLogout: _initiator.onTapLogout,
          );
        } else if (state is HomeBlocLoadingState) {
          return LoadingIndicator();
        } else if (state is HomeBlocErrorState) {
          return ErrorScreen(
            message: state.error,
            retry: _initiator.onRetry,
          );
        } else
          return Scaffold(
            body: Center(
              child:
                  Text(kDebugMode ? "Home: state not implemented $state" : ""),
            ),
          );
      },
    );
  }
}
