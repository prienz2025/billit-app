abstract class BaseRepository<T> {
  Future<T> get(String id);
  Future<List<T>> getAll();
  Future<T> create(T item);
  Future<T> update(T item);
  Future<void> delete(String id);
}
