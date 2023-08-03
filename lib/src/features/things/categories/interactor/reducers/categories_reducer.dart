// ignore_for_file: unnecessary_lambdas

import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/atoms/categories_atom.dart';
import 'package:things_stuff_client/src/features/things/categories/interactor/states/categories_state.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';

class CategoriesReducer extends Reducer {
  final CRUDService service;

  CategoriesReducer(this.service) {
    on(() => [getCategoriesAction], _getCategories);
    on(() => [sendNewCategoryAction], _sendNewCategories);
    on(() => [updateCategoryAction], _updateCategories);
    on(() => [deleteCategoryAction], _deleteCategories);
  }

  void _getCategories() {
    categoriesState.value = LoadingCategories();
    service.getAll().then((value) => categoriesState.setValue(value));
  }



  void _sendNewCategories() {
    categoriesState.value = LoadingCategories();
    final dto = sendNewCategoryAction.value;
    service.createNew(dto).then((value) => categoriesState.setValue(value));
  }

  void _updateCategories() {
    categoriesState.value = LoadingCategories();
    final dto = updateCategoryAction.value;
    service.update(dto).then((value) => categoriesState.setValue(value));
  }

  void _deleteCategories() {
    categoriesState.value = LoadingCategories();
    final id = deleteCategoryAction.value.id!;
    service.delete(id).then((value) => categoriesState.setValue(value));
  }
}
