import 'package:doctors/config/preferences.dart';
// import 'package:doctors/models/armors.dart';

class AppConfig {
  static final AppConfig _singleton = AppConfig._();

  factory AppConfig() => _singleton;

  AppConfig._();

  bool? isLogIn;

  init({required Preferences prefs}) {
    isLogIn = prefs.isLogged;
  }
}
