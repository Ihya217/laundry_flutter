class UserData {
  int id;
  String username;
  String email;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String token; // Tambahkan atribut token

  UserData({
    required this.id,
    required this.username,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.token, // Tambahkan inisialisasi token pada konstruktor
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      token: json['token'], // Tambahkan pemrosesan token dari JSON
    );
  }
}
