import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/routes/route_providers.dart';
import 'package:jobs_pot/system/system_providers.dart';

class AuthController extends StateNotifier {
  AuthController(this.ref) : super(null);

  final Ref ref;

  void updateAuthState(bool? value) {
    authStateListenable.value = value;
  }

  Future<dynamic> refreshToken() async {
    EasyLoading.show();

    final resRefreshToken =
        await ref.read(authRepositoryProvider).refreshToken();

    EasyLoading.dismiss();
    return resRefreshToken.fold(
      (l) {
        ref.read(systemControllerProvider.notifier).showToastMessage(l.error);

        final appRouter = ref.read(routeControllerProvider);
        appRouter!.removeLast();
        appRouter.replaceNamed(LoginScreen.path);

        return null;
      },
      (r) {
        return r;
      },
    );
  }
}
