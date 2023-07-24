import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/features/auth/data/services/firebase_auth_service.dart';
import 'package:things_stuff_client/features/auth/interactor/reducers/auth_reducers.dart';
import 'package:things_stuff_client/features/auth/interactor/service/auth_service.dart';
import 'package:things_stuff_client/features/auth/ui/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get exportedBinds => [
        AutoBind.factory<AuthService>(FirebaseAuthService.new),
        AutoBind.singleton(AuthReducers.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (_, __) => const LoginPage()),
      ];
}
