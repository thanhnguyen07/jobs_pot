import 'package:local_storage/src/local_storage_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoveDataLocalStorage {
  Future<void> onboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.onboarding.toString());
  }

  Future<void> rememberStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.remember.toString());
  }

  Future<void> darkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.darkMode.toString());
  }

  Future<void> token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.token.toString());
  }

  Future<void> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.refreshToken.toString());
  }

  Future<void> idUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.idUser.toString());
  }

  Future<void> dataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKey.token.toString());
    await prefs.remove(LocalStorageKey.refreshToken.toString());
    await prefs.remove(LocalStorageKey.idUser.toString());
  }
}
