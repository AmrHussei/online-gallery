import 'package:dio/dio.dart';
import 'package:online_photo_gallary/data/models/get_images_model.dart';
import '../services/get_images_services.dart';

class GetImagesRepo {
  static Future<GetImagesModel> getImages() async {
    Response respons = await GetImagesServices.getImages();
    GetImagesModel dataOfImages = GetImagesModel.fromJson(respons.data);
    print(dataOfImages);
    return dataOfImages;
  }
}
