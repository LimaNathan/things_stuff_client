import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/auth/auth_module.dart';
import 'package:things_stuff_client/src/features/splash/ui/pages/splash_page.dart';
import 'package:things_stuff_client/src/features/things/things_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/splash',
          child: (_, __) => const SplashPage(),
        ),
        ModuleRoute(
          '/auth',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/things',
          module: ThingsModule(),
        ),
      ];
}
