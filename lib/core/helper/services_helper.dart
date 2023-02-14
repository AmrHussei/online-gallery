import 'package:dio/dio.dart';

import '../constant.dart';

class ServicesHelper {
  static late Dio dio;
  static intiDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}
