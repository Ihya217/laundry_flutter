class UserData {
  int id;
  String username;
  String email;
  String token; // Tambahkan atribut token

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.token, // Tambahkan inisialisasi token pada konstruktor
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      token: json['token'], // Tambahkan pemrosesan token dari JSON
    );
  }
}
