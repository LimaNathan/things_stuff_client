import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/categories/categories_module.dart';
import 'package:things_stuff_client/src/features/things/data/service/things_crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/reducers/things_reducer.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/ui/pages/things_page.dart';

class ThingsModule extends Module {


  @override
  void exportedBinds(Injector i) {
    i
      ..addSingleton<CRUDService>(() => ThingsCRUD(i()))
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
