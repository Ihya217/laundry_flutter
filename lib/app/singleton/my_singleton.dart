class MySingleton {
  // Variabel publik dalam kelas singleton
  String TAG_IS_LOGIN = 'isLogin';

  // Singleton instance
  static final MySingleton _instance = MySingleton._internal();

  factory MySingleton() {
    return _instance;
  }

  MySingleton._internal();
}
