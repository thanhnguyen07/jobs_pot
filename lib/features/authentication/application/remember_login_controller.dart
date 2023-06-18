import 'package:flutter_riverpod/flutter_riverpod.dart';

class RememberLoginController extends StateNotifier<bool> {
  RememberLoginController() : super(true);

  void changeStatus() {
    state = !state;
  }
}
