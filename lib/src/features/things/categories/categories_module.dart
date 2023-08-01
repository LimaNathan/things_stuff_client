import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/things/categories/data/categories_crud.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/reducers/categories_reducer.dart';
import 'package:things_stuff_client/src/features/things/categories/ui/categories_page.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';

class CategoriesModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<CRUDService>(CategoriesCRUD.new)
      ..addSingleton(CategoriesReducer.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (cxt) => const CategoriesPage());
  }
}
