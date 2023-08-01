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
  void binds(Injector i) {
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/splash',
        child: (ctx) => const SplashPage(),
      )
      ..module(
        '/auth',
        module: AuthModule(),
      )
      ..module(
        '/things',
        module: ThingsModule(),
      );
  }
}
