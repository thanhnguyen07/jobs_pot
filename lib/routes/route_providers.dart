import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/routes/route_config.dart';
import 'package:jobs_pot/routes/route_controller.dart';

final routeControllerProvider =
    StateNotifierProvider<RouteController, AppRouter?>(
  (ref) => RouteController(),
);
