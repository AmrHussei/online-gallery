class LogInModel {
  final String token;
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  LogInModel({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        token: json["token"] as String,
        id: json["user"]["id"] as int,
        name: json["user"]["name"] as String,
        email: json["user"]["email"] as String,
        emailVerifiedAt: json["user"]["email_verified_at"] != null
            ? DateTime.parse(json["user"]["email_verified_at"] as String)
            : null,
        createdAt: DateTime.parse(json["user"]["created_at"] as String),
        updatedAt: DateTime.parse(json["user"]["updated_at"] as String),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
