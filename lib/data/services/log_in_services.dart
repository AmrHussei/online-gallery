import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_photo_gallary/core/constant.dart';
import 'package:online_photo_gallary/core/helper/services_helper.dart';

class LogInServices {
  static Future<dynamic> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      return await ServicesHelper.postData(
        url: ApiConstant.logInUser,
        data: {
          'email': email,
          'password': password,
        },
      );
    } catch (error) {
      print(error.toString());

      return;
    }
  }
}
