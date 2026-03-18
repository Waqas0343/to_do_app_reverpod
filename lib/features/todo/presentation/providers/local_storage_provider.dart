import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
});

class PrefService {
  final SharedPreferences _prefs;
  PrefService(this._prefs);

  bool getBool(String key, {bool defaultValue = false}) => _prefs.getBool(key) ?? defaultValue;
  Future<void> setBool(String key, bool value) async => await _prefs.setBool(key, value);

  String getString(String key, {String defaultValue = ''}) => _prefs.getString(key) ?? defaultValue;
  Future<void> setString(String key, String value) async => await _prefs.setString(key, value);
}

final prefServiceProvider = Provider<PrefService>((ref) {
  final prefsAsync = ref.watch(sharedPreferencesProvider).value;
  if (prefsAsync != null) {
    return PrefService(prefsAsync);
  } else {
    throw Exception("Preferences not loaded yet");
  }
});