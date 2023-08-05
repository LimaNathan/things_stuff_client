import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/categories/data/categories_crud.dart';
import 'package:things_stuff_client/src/features/categories/interactor/reducers/categories_reducer.dart';
import 'package:things_stuff_client/src/features/categories/ui/categories_page.dart';

class CategoriesModule extends Module {
  @override
  @override
  void exportedBinds(Injector i) {
    i
      ..addSingleton<CategoriesCRUD>(() => CategoriesCRUD(i()))
      ..addSingleton(CategoriesReducer.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (cxt) => const CategoriesPage());
  }
}
