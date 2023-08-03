import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/dto/category.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/states/categories_state.dart';

///Atom
final categoriesState = Atom<CategoriesState>(
  InitCategories(),
  key: 'CategoriesState',
);

///Action

final getCategoriesAction = Atom<int?>(null,key: 'getCategories');
final sendNewCategoryAction = Atom<CategoriesDTO>(
  CategoriesDTO(),
  key: 'getCategories',
);

final updateCategoryAction = Atom<CategoriesDTO>(
  CategoriesDTO(),
  key: 'updateCategory ',
);

final deleteCategoryAction = Atom<CategoriesDTO>(
  CategoriesDTO(),
  key: 'deleteThing',
);
