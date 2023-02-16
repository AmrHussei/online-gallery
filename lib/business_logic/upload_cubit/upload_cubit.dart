import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:online_photo_gallary/core/constant.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  Future<String> uploadImageToApi(File imageFile, String token) async {
    var uri = Uri.parse(ApiConstant.uploadImage);
    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';

    var length = await imageFile.length();
    var stream = imageFile.openRead().cast<List<int>>();
    var multipartFile = http.MultipartFile('img', stream, length,
        filename: path.basename(imageFile.path));
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON response.
      emit(SuccesUploadFromGallery());
      String responseString =
          await response.stream.transform(utf8.decoder).join();
      return responseString;
    } else {
      emit(ErrorUploadFromGallery());
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to upload image');
    }
  }

// function to select image from gallery
  Future<File?> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<File?> getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
