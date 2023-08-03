import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/things/categories/categories_module.dart';
import 'package:things_stuff_client/src/features/things/data/service/things_crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/reducers/things_reducer.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/ui/pages/things_page.dart';

class ThingsModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addSingleton<CRUDService>(ThingsCRUD.new)
      ..addSingleton(ThingsReducer.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..module('/categories', module: CategoriesModule())
      ..child(
        '/',
        child: (ctx) => const ThingsPage(),
      );
  }
}
