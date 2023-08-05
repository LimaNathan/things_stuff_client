import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/auth/auth_module.dart';
import 'package:things_stuff_client/src/features/categories/categories_module.dart';
import 'package:things_stuff_client/src/features/splash/ui/pages/splash_page.dart';
import 'package:things_stuff_client/src/features/things/things_module.dart';

import 'core/service/api_service.dart';
import 'core/service/impl/uno_impl.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        ThingsModule(),
        CategoriesModule(),
      ];

  @override
  void binds(Injector i) {
    i
      ..addInstance<FirebaseAuth>(FirebaseAuth.instance)
      ..addSingleton<ApiService>(UnoImpl.new);
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
      )
      ..module(
        '/categories',
        module: CategoriesModule(),
      );
  }
}
