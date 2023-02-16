part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UploadImage extends HomeState {}

class LoadingImage extends HomeState {}

class LoadedImage extends HomeState {
  final List<String> listofImages;

  LoadedImage(this.listofImages);
}

class ErrorImage extends HomeState {}
