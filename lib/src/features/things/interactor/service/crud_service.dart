
abstract class CRUDService<T, E> {
  Future<T> getAll();
  Future<T> getUnique(int id);
  Future<T> createNew(E dto);
  Future<T> update(E dto);
  Future<T> delete(int id);
}
