part of 'upload_cubit.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}

class SuccesUploadFromGallery extends UploadState {}

class ErrorUploadFromGallery extends UploadState {}
