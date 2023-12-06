import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/routes/route_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jobs_pot/system/system_providers.dart';

Future<ProviderContainer> appProviderContainer() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final container = ProviderContainer(
    overrides: [],
  );

  await initializeProviders(container);

  return container;
}

Future<void> initializeProviders(ProviderContainer container) async {
  container.read(routeControllerProvider);
  container.read(authControllerProvider);
  container.read(systemControllerProvider);
}
