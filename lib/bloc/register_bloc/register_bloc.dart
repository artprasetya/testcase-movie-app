import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/database/database_repository.dart';
import 'package:majootestcase/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqlite_api.dart';

part 'register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  DatabaseRepository _repository = DatabaseRepository();

  void onRegisterButtonPressed({
    String? username,
    String? email,
    String? password,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    emit(RegisterLoading());

    User user = User(
      username: username,
      email: email,
      password: password,
    );

    try {
      int? response = await _repository.register('User', user.toJson());
      if (response != null) {
        sharedPreferences.setBool("is_logged_in", true);
        emit(RegisterSuccess());
      } else {
        emit(RegisterError(errorMessage: 'Registration failed'));
      }
    } on DatabaseException catch (e) {
      emit(RegisterError(errorMessage: 'Registration Error: $e'));
    }
  }
}
