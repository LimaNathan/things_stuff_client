import 'package:things_stuff_client/src/features/things/categories/interactor/dto/category.dart';

sealed class CategoriesState {
  T when<T>({
    required T Function() initCategories,
    T Function(ShowingCategories state)? showingCategories,
    T Function(LoadingCategories state)? loadingCategories,
    T Function(ShowingOneCategories state)? showingOneCategory,
    T Function(CreatedCategories state)? createCategory,
    T Function(CategoriesErrorState state)? errotCategoriesState,
    T Function(DeleteCategoriesSuccess state)? deleteCategory,
    T Function(NotCreatedCategories state)? notCreatedCategory,
  }) {
    return switch (this) {
      InitCategories _ => initCategories(),
      final LoadingCategories s =>
        loadingCategories?.call(s) ?? initCategories(),
      final ShowingCategories s =>
        showingCategories?.call(s) ?? initCategories(),
      final ShowingOneCategories s =>
        showingOneCategory?.call(s) ?? initCategories(),
      final CreatedCategories s => createCategory?.call(s) ?? initCategories(),
      final CategoriesErrorState s =>
        errotCategoriesState?.call(s) ?? initCategories(),
      final DeleteCategoriesSuccess s =>
        deleteCategory?.call(s) ?? initCategories(),
      final NotCreatedCategories s =>
        notCreatedCategory?.call(s) ?? initCategories(),
    };
  }
}

class InitCategories extends CategoriesState {}

class LoadingCategories extends CategoriesState {}

class ShowingCategories extends CategoriesState {
  final List<CategoriesDTO> categories;

  ShowingCategories(this.categories);
}

class ShowingOneCategories extends CategoriesState {
  final CategoriesDTO categoriesDTO;
  ShowingOneCategories(this.categoriesDTO);
}

class CreatedCategories extends CategoriesState {
  final CategoriesDTO dto;
  CreatedCategories(this.dto);
}

class CategoriesErrorState extends CategoriesState {}

class DeleteCategoriesSuccess extends CategoriesState {}

class NotCreatedCategories extends CategoriesState {
  final String message;
  NotCreatedCategories(this.message);
}
