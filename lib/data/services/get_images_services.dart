import '../../core/constant.dart';
import '../../core/helper/services_helper.dart';

class GetImagesServices {
  static Future<dynamic> getImages() async {
    try {
      return await ServicesHelper.getData(
        url: ApiConstant.getImages,
      );
    } catch (error) {
      print('error get images ////////////////////////////////////////////');
      print(error.toString());

      return;
    }
  }
}
