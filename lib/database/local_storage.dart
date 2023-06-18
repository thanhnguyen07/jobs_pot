import 'dart:convert';

import 'package:jobs_pot/features/authentication/domain/entities/token_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static const _tokenKey = 'token';
  static const _refreshTokenKey = 'refresh_token';

  static Future<void> saveToken(TokenEntity token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, jsonEncode(token.toJson()));
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<TokenEntity?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final tokenEncoded = prefs.getString(_tokenKey);
      if (tokenEncoded == null) {
        return null;
      } else {
        return TokenEntity.fromJson(
            jsonDecode(tokenEncoded) as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveRefreshToken(TokenEntity token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshTokenKey, jsonEncode(token.toJson()));
  }

  static Future<void> removeRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_refreshTokenKey);
  }

  static Future<TokenEntity?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final tokenEncoded = prefs.getString(_refreshTokenKey);
      if (tokenEncoded == null) {
        return null;
      } else {
        return TokenEntity.fromJson(
            jsonDecode(tokenEncoded) as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
  }
}
