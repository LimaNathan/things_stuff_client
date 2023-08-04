import 'package:things_stuff_client/src/features/things/interactor/entities/dto.dart';

abstract class CRUDService<T> {
  Future<T> getAll();
  Future<T> getUnique(int id);
  Future<T> createNew(DTO dto);
  Future<T> update(DTO dto);
  Future<T> delete(int id);
}
