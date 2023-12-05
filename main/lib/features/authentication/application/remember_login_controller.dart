import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/utils/utils.dart';

class RememberLoginController extends StateNotifier<bool> {
  RememberLoginController(this.ref) : super(true);

  final Ref ref;

  Future initData() async {
    final rememberStatus = await Utils.localStorage.get.rememberStatus();
    if (rememberStatus != state) {
      changeLocalData();
    }
  }

  void changeStatus() {
    state = !state;
    changeLocalData();
  }

  void changeLocalData() {
    if (state) {
      Utils.localStorage.save.rememberStatus();
    } else {
      Utils.localStorage.remove.rememberStatus();
    }
  }
}
