import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/src/ansi_color_enum.dart';
import 'dart:developer' as developer;

class MyLogger {
  static String _colorize(String message, AnsiColor color) {
    return '$color$message${AnsiColor.reset}';
  }

  // static String _rainbow(String text) {
  //   final rainbow = [
  //     AnsiColor.boldRed,
  //     AnsiColor.boldGreen,
  //     AnsiColor.boldYellow,
  //     AnsiColor.boldBlue,
  //     AnsiColor.boldPurple,
  //     AnsiColor.boldCyan,
  //     AnsiColor.boldWhite
  //   ];
  //   final rainbowText = StringBuffer();
  //   for (var i = 0; i < text.length; i++) {
  //     final char = text[i];
  //     final color = rainbow[i % rainbow.length];
  //     rainbowText.write('$color$char');
  //   }
  //   rainbowText.write(AnsiColor.reset);
  //   return rainbowText.toString();
  // }

  static void error(dynamic message) {
    developer.log(_colorize(message, AnsiColor.highIntensityRed));
  }

  static void debugLog(dynamic message) {
    debugPrint(_colorize(message, AnsiColor.highIntensityPurple));
  }

  static String _uriLog(String uri) {
    return _colorize(
      "PATH: $uri",
      AnsiColor.highIntensityCyan,
    );
  }

  static void apiError({
    required int? statusCode,
    required String uri,
    required dynamic data,
  }) {
    String statusLog = _colorize(
      "ERROR [$statusCode] 🧨",
      AnsiColor.highIntensityRed,
    );

    String uriLog = _uriLog(uri);

    String dataLog = _colorize(
      "DATA: $data",
      AnsiColor.highIntensityRed,
    );
    String dataJsonLog = _colorize(
      "DATA: ${jsonEncode(data)}",
      AnsiColor.highIntensityRed,
    );
    if (data != null) {
      try {
        developer.log(
          "$statusLog \n$uriLog \n$dataJsonLog",
        );
      } catch (e) {
        developer.log(
          "$statusLog \n$uriLog \n$dataLog",
        );
      }
    } else {
      developer.log(
        "$statusLog \n$uriLog",
      );
    }
  }

  static void apiRequest({
    required String method,
    required String uri,
    required dynamic token,
    dynamic data,
  }) {
    String uriLog = _uriLog(uri);

    String methodLog = _colorize(
      "REQUEST: [$method] 🚀",
      AnsiColor.highIntensityYellow,
    );
    String tokenLog = _colorize(
      "TOKEN: $token",
      AnsiColor.highIntensityYellow,
    );
    String dataLog = _colorize(
      "DATA: $data",
      AnsiColor.highIntensityYellow,
    );

    if (method == 'GET') {
      developer.log(
        "$methodLog \n$uriLog \n$tokenLog",
      );
    } else {
      try {
        String dataJsonLog = _colorize(
          "DATA: ${jsonEncode(data)}",
          AnsiColor.highIntensityYellow,
        );
        developer.log(
          "$methodLog \n$uriLog \n$tokenLog \n$dataJsonLog",
        );
      } catch (e) {
        developer.log(
          "$methodLog \n$uriLog \n$tokenLog \n$dataLog",
        );
      }
    }
  }

  static void apiResponse({
    required int? statusCode,
    required String uri,
    required dynamic data,
  }) {
    String uriLog = _uriLog(uri);

    String statusLog = _colorize(
      "RESPONSE: [$statusCode] 📥",
      AnsiColor.highIntensityGreen,
    );

    String dataLog = _colorize(
      "DATA: $data",
      AnsiColor.highIntensityGreen,
    );

    developer.log(
      "$statusLog \n$uriLog  \n$dataLog",
    );
  }
}
