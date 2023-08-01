import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/dto/category.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/states/categories_state.dart';

///Atom
final atomState = Atom<CategoriesState>(
  InitCategories(),
  key: 'CategoriesState',
);

///Action

final getCategories = Atom.action(key: 'getCategories');
final sendNewCategories = Atom<CategoriesDTO>(
  CategoriesDTO(),
  key: 'getCategories',
);

final updateCategories = Atom<CategoriesDTO>(
  CategoriesDTO(),
  key: 'updateCategories ',
);

final deleteThing = Atom<CategoriesDTO>(CategoriesDTO(), key: 'deleteThing');
