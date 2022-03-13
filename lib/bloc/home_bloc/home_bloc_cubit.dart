import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/models/movie.dart';

import 'package:majootestcase/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit() : super(HomeBlocInitialState());

  SharedPreferences? _sharedPreferences;

  void fetchingData() async {
    emit(HomeBlocLoadingState());

    ApiServices apiServices = ApiServices();

    try {
      MovieModel? movieResponse = await apiServices.getMovieList();
      if (movieResponse != null) {
        emit(HomeBlocLoadedState(movieResponse.results));
      } else {
        emit(HomeBlocErrorState("Error Unknown"));
      }
    } catch (e) {
      emit(HomeBlocErrorState("Error Unknown"));
    }
  }

  Future<void> logout() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    emit(HomeBlocLoadingState());
    _sharedPreferences?.setBool("is_logged_in", false);
    emit(HomeBlocLoggedOutSuccesState());
  }
}
