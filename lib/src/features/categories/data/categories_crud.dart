import 'package:things_stuff_client/src/core/service/api_service.dart';
import 'package:things_stuff_client/src/features/categories/interactor/dto/category.dart';
import 'package:things_stuff_client/src/features/categories/interactor/states/categories_state.dart';
import 'package:things_stuff_client/src/features/things/interactor/entities/dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/shared/utils/endpoints.dart';
import 'package:uno/uno.dart';

class CategoriesCRUD extends CRUDService<CategoriesState> {
  final ApiService api;

  CategoriesCRUD(this.api);
  @override
  Future<CategoriesState> createNew(DTO dto) async {
    dto as CategoriesDTO;
    try {
      final Response response = await api.post(
        Endpoints.createNewThing,
        body: dto.toMap(),
      );
      return CreatedCategories(CategoriesDTO.fromJson(response.data));
    } catch (e) {
      return NotCreatedCategories('Não foi possível criar o tipo');
    }
  }

  @override
  Future<CategoriesState> delete(int id) async {
    try {
      await api.delete(Endpoints.deleteCategorieByID, id: id);
      return DeleteCategoriesSuccess();
    } catch (e) {
      return CategoriesErrorState();
    }
  }

  @override
  Future<CategoriesState> getAll() async {
    try {
      final Response response = await api.get(Endpoints.getAllCategories);

      final categories = (response.data as List)
          .map(
            // ignore: unnecessary_lambdas
            (e) => CategoriesDTO.fromMap(e),
          )
          .toList();

      return ShowingCategories(categories);
    } catch (e) {
      return CategoriesErrorState();
    }
  }

  @override
  Future<CategoriesState> getUnique(int id) async {
    try {
      final Response response =
          await api.get(Endpoints.getCategorieByID, queryParams: {'id': id});

      return ShowingOneCategories(CategoriesDTO.fromMap(response.data));
    } catch (e) {
      return CategoriesErrorState();
    }
  }

  @override
  Future<CategoriesState> update(DTO dto) async {
    try {
      final Response response = await api.update(Endpoints.updateCategorieByID);

      return CreatedCategories(CategoriesDTO.fromMap(response.data));
    } catch (e) {
      return CategoriesErrorState();
    }
  }
}
