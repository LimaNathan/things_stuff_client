import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/core/service/api_service.dart';
import 'package:things_stuff_client/src/core/service/impl/uno_impl.dart';
import 'package:things_stuff_client/src/features/auth/auth_module.dart';
import 'package:things_stuff_client/src/features/things/data/service/things_crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/reducers/things_reducer.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/ui/pages/things_page.dart';

class ThingsModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i
      ..addSingleton<ApiService>(UnoImpl.new)
      ..add<CRUDService>(ThingsCrudServiceImpl.new)
      ..addSingleton(ThingsReducer.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (ctx) => const ThingsPage(),
    );
  }
}
