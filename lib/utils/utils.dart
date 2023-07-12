import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';

class Utils {
  static String getLocaleMessage(String key) {
    return key.tr();
  }

  static String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
