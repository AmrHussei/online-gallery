class GetImagesModel {
  GetImagesModel({
    required this.status,
    required this.message,
    required this.images,
  });

  String status;
  String message;
  List<String> images;
  factory GetImagesModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> imagesList = json["data"]["images"];
    List<String> castedImagesList =
        imagesList.map((image) => image.toString()).toList();
    return GetImagesModel(
      status: json["status"],
      message: json["message"],
      images: castedImagesList,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "images": images,
      };
}
