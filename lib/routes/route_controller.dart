import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/routes/route_config.dart';

class RouteController extends StateNotifier<AppRouter?> {
  RouteController() : super(null) {
    _init();
  }

  void _init() {
    state = AppRouter();
  }
}
