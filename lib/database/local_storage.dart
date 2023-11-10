import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static const _tokenKey = 'token';
  static const _refreshTokenKey = 'refresh_token';
  static const _onboarding = '_onboarding';
  static const _remember = '_remember';
  static const _idUser = '_idUser';

  //SAVE
  static Future<void> saveOnboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboarding, true);
  }

  static Future<void> saveRememberStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_remember, true);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, jsonEncode(token));
  }

  static Future<void> saveRefreshToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshTokenKey, jsonEncode(token));
  }

  static Future<void> saveDataUser(
    String token,
    String refreshToken,
    String idUser,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, jsonEncode(token));
    await prefs.setString(_refreshTokenKey, jsonEncode(refreshToken));
    await prefs.setString(_idUser, jsonEncode(idUser));
  }

  //GET
  static Future<bool?> getOnboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final onboadingStatusEncoded = prefs.getBool(_onboarding);
      if (onboadingStatusEncoded == null) {
        return null;
      } else {
        return onboadingStatusEncoded;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> getRememberStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final onboadingStatusEncoded = prefs.getBool(_remember);
      if (onboadingStatusEncoded == null) {
        return null;
      } else {
        return onboadingStatusEncoded;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final tokenEncoded = prefs.getString(_tokenKey);
      if (tokenEncoded == null) {
        return null;
      } else {
        return jsonDecode(tokenEncoded);
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final refreshTokenEncoded = prefs.getString(_refreshTokenKey);
      if (refreshTokenEncoded == null) {
        return null;
      } else {
        return jsonDecode(refreshTokenEncoded);
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getIdUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final idUSerEncoded = prefs.getString(_idUser);
      if (idUSerEncoded == null) {
        return null;
      } else {
        return jsonDecode(idUSerEncoded);
      }
    } catch (e) {
      return null;
    }
  }

  //REMOVE
  static Future<void> removeOnboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_onboarding);
  }

  static Future<void> removeRememberStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_remember);
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> removeRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_refreshTokenKey);
  }

  static Future<void> removeIdUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_idUser);
  }

  static Future<void> removeDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_idUser);
  }
}
