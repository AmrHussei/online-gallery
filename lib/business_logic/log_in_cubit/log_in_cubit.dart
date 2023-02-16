import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:online_photo_gallary/core/constant.dart';
import 'package:online_photo_gallary/data/models/log_in_model.dart';
import 'package:online_photo_gallary/data/repositories/log_in_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  late LogInModel userData;

  Future<void> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(TryLogIn());
      userData = await LogInRepo.logInUser(email: email, password: password);
      setToken();
      print('TOKEN *************************************');
      ApiConstant.token = userData.token;
      print(userData.token);
      emit(SuccessLogIn());
    } catch (error) {
      emit(FailureLogIn());

      print(error.toString());
    }
  }

  Future<SharedPreferences> initShardPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  setToken() async {
    final prefs = await initShardPrefs();
    String token = userData.token;
    await prefs.setString('token', token);
  }

  logOut() async {
    final prefs = await initShardPrefs();
    await prefs.setString('token', '');
  }
}
