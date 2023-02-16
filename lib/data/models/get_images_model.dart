class GetImagesModel {
  GetImagesModel({
    required this.status,
    required this.message,
    required this.images,
  });

  String status;
  String message;
  List<String> images;
  factory GetImagesModel.fromJson(Map<String, dynamic> json) => GetImagesModel(
        status: json["status"],
        message: json["message"],
        images: json["data"]["images"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "images": images,
      };
}
