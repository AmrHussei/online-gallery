import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_photo_gallary/data/models/log_in_model.dart';
import 'package:online_photo_gallary/data/services/log_in_services.dart';

class LogInRepo {
  static Future<LogInModel> logInUser({
    required String email,
    required String password,
  }) async {
    Response respons =
        await LogInServices.logInUser(email: email, password: password);
    LogInModel userData = LogInModel.fromJson(respons.data);

    print(userData);

    return userData;
  }
}
