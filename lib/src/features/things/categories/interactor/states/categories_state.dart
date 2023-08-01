import 'package:things_stuff_client/src/features/things/categories/interactor/dto/category.dart';

sealed class CategoriesState {}

class InitCategories implements CategoriesState {}

class LoadingCategories implements CategoriesState {}

class ShowingCategories implements CategoriesState {
  final List<CategoriesDTO> categories;

  ShowingCategories(this.categories);
}

class ShowingOneCategories implements CategoriesState {
  final CategoriesDTO categoriesDTO;
  ShowingOneCategories(this.categoriesDTO);
}

class CreatedCategories implements CategoriesState {
  final CategoriesDTO dto;
  CreatedCategories(this.dto);
}

class CategoriesErrorState implements CategoriesState {}

class DeleteCategoriesSuccess implements CategoriesState {}

class NotCreatedCategories implements CategoriesState {
  final String message;
  NotCreatedCategories(this.message);
}
