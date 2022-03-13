import 'package:flutter/material.dart';
import 'package:majootestcase/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:majootestcase/models/movie.dart';
import 'package:majootestcase/modules/detail_movie/page.dart';
import 'package:majootestcase/utils/core_initiator.dart';

class HomeInitiator extends CoreInitiator {
  late HomeBlocCubit _bloc;

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  void init() {
    _bloc = HomeBlocCubit();
    _bloc.fetchingData();
  }

  ///
  /// Getters
  ///

  HomeBlocCubit get bloc => _bloc;

  ///
  /// Functions
  ///

  void onRetry() => _bloc.fetchingData();

  void onTapMovie(BuildContext context, Result movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailMoviePage(movie: movie),
      ),
    );
  }

  void onTapLogout() => _bloc.logout();

  void onLogoutSuccess(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }
}
