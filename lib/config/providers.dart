import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/routes/route_providers.dart';

Future<ProviderContainer> appProviderContainer() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(
    overrides: [],
  );
  await initializeProviders(container);
  return container;
}

Future<void> initializeProviders(ProviderContainer container) async {
  container.read(routeControllerProvider);
}
