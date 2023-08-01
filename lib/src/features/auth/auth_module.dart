import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/auth/data/services/firebase_auth_service.dart';
import 'package:things_stuff_client/src/features/auth/interactor/reducers/auth_reducers.dart';
import 'package:things_stuff_client/src/features/auth/interactor/service/auth_service.dart';
import 'package:things_stuff_client/src/features/auth/ui/pages/login_page.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..add<AuthService>(FirebaseAuthService.new)
      ..addSingleton(AuthReducers.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (ctx) => const LoginPage());
  }
}
