import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_photo_gallary/data/models/get_images_model.dart';
import 'package:online_photo_gallary/data/repositories/get_images_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getImages() async {
    try {
      emit(LoadingImage());
      GetImagesModel respons = await GetImagesRepo.getImages();

      emit(LoadedImage(respons.images));
      print(
          'imagesssssssssssssssssssssssssssssssssssssssssss ${respons.images}');
    } catch (error) {
      emit(ErrorImage());
      print(error.toString());
    }
  }
}
