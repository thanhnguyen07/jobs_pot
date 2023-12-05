import 'dart:convert';
import 'dart:ui';
import 'package:local_storage/src/local_storage_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appLanguageEn = Locale('en');

class GetDataLocalStorage {
  Future<bool> onboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final onboadingStatusEncoded =
          prefs.getBool(LocalStorageKey.onboarding.toString());
      if (onboadingStatusEncoded == null) {
        return false;
      } else {
        return onboadingStatusEncoded;
      }
    } catch (e) {
      return false;
    }
  }

  Future<String> defaultLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final defaultLanguageEncoded =
          prefs.getString(LocalStorageKey.defaultLanguage.toString());
      if (defaultLanguageEncoded == null) {
        return appLanguageEn.toString();
      } else {
        return jsonDecode(defaultLanguageEncoded);
      }
    } catch (e) {
      return appLanguageEn.toString();
    }
  }

  Future<bool?> rememberStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final onboadingStatusEncoded =
          prefs.getBool(LocalStorageKey.remember.toString());
      if (onboadingStatusEncoded == null) {
        return null;
      } else {
        return onboadingStatusEncoded;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final tokenEncoded = prefs.getString(LocalStorageKey.token.toString());
      if (tokenEncoded == null) {
        return null;
      } else {
        return jsonDecode(tokenEncoded);
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final refreshTokenEncoded =
          prefs.getString(LocalStorageKey.refreshToken.toString());
      if (refreshTokenEncoded == null) {
        return null;
      } else {
        return jsonDecode(refreshTokenEncoded);
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> idUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final idUSerEncoded = prefs.getString(LocalStorageKey.idUser.toString());
      if (idUSerEncoded == null) {
        return null;
      } else {
        return jsonDecode(idUSerEncoded);
      }
    } catch (e) {
      return null;
    }
  }
}
