import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();

  factory Preferences() => _singleton;

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isLogged => _prefs?.getBool('is_logged') ?? false;
  set isLogged(bool value) => _prefs?.setBool('is_logged', value);

  Future<void> clear() async {
    await _prefs?.clear();
  }

  Future<void> reload() async {
    await _prefs?.reload();
  }
}
