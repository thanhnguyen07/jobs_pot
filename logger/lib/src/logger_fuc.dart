import 'dart:convert';

import 'package:logger/src/ansi_color_enum.dart';
import 'dart:developer' as developer;

class MyLogger {
  static String _colorize(String message, AnsiColor color) {
    return '$color$message${AnsiColor.reset}';
  }

  static String _rainbow(String text) {
    final rainbow = [
      AnsiColor.boldRed,
      AnsiColor.boldGreen,
      AnsiColor.boldYellow,
      AnsiColor.boldBlue,
      AnsiColor.boldPurple,
      AnsiColor.boldCyan,
      AnsiColor.boldWhite
    ];
    final rainbowText = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final char = text[i];
      final color = rainbow[i % rainbow.length];
      rainbowText.write('$color$char');
    }
    rainbowText.write(AnsiColor.reset);
    return rainbowText.toString();
  }

  static void error(dynamic message) {
    developer.log(_colorize(message, AnsiColor.highIntensityRed));
  }

  static void apiError({
    required int? statusCode,
    required String uri,
    required dynamic data,
  }) {
    try {
      developer.log(
        _colorize(
          "ERROR [$statusCode] 🧨 \nPATH: $uri \nDATA: ${jsonEncode(data)}",
          AnsiColor.highIntensityRed,
        ),
      );
    } catch (e) {
      developer.log(
        _colorize(
          "ERROR [$statusCode] 🧨 \nPATH: $uri \nDATA: $data",
          AnsiColor.highIntensityRed,
        ),
      );
    }
  }

  static void apiRequest({
    required String method,
    required Uri uri,
    required dynamic token,
    dynamic data,
  }) {
    if (method == 'GET') {
      developer.log(
        _colorize(
          "REQUEST: [$method] 🚀 \nPATH: $uri \n Token: $token",
          AnsiColor.highIntensityYellow,
        ),
      );
    } else {
      try {
        developer.log(
          _colorize(
            "REQUEST: [$method] 🚀 \nPATH: $uri \nToken: $token \nDATA: ${jsonEncode(data)}",
            AnsiColor.highIntensityYellow,
          ),
        );
      } catch (e) {
        developer.log(
          _colorize(
            "REQUEST: [$method] 🚀 \nPATH: $uri \nToken: $token \nDATA:  $data",
            AnsiColor.highIntensityYellow,
          ),
        );
      }
    }
  }

  static void apiResponse({
    required int? statusCode,
    required Uri uri,
    required dynamic data,
  }) {
    developer.log(
      _colorize(
        "RESPONSE: [$statusCode] 📥  \nPATH: $uri \nDATA: $data",
        AnsiColor.highIntensityGreen,
      ),
    );
  }
}
