import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/database/database_repository.dart';
import 'package:majootestcase/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc_state.dart';

class AuthBlocCubit extends Cubit<AuthBlocState> {
  AuthBlocCubit() : super(AuthBlocInitialState());

  final DatabaseRepository _repository = DatabaseRepository();
  SharedPreferences? _sharedPreferences;

  void fetchHistoryLogin() async {
    emit(AuthBlocInitialState());
    _sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = _sharedPreferences?.getBool("is_logged_in");

    if (isLoggedIn == null) {
      emit(AuthBlocLoginState());
    } else {
      if (isLoggedIn) {
        emit(AuthBlocLoggedInState());
      } else {
        emit(AuthBlocLoginState());
      }
    }
  }

  void loginUser(User user) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    emit(AuthBlocLoadingState());

    try {
      bool userExist = await _repository.selectUser(user);

      if (userExist) {
        _sharedPreferences?.setBool("is_logged_in", true);
        emit(AuthBlocLoggedInState());
      } else {
        emit(AuthBlocErrorState('Login Failed'));
      }
    } on Exception catch (e) {
      emit(AuthBlocErrorState('Auth Error: $e'));
    }
  }
}
