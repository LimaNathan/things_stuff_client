import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/things/ui/pages/things_page.dart';

class ThingsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const ThingsPage(),
        ),
      ];
}
