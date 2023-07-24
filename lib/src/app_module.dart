import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/features/auth/auth_module.dart';

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
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
