import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';

class SettingController extends StateNotifier {
  SettingController(this.ref) : super(null);
  final Ref ref;
}
