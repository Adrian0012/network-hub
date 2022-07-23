import '../models/user.dart';

abstract class IAppuserRepository {
  Future<List<Appuser>> getAll();
  Future<Appuser?> getOne(int id);
  // Future<void> insert(Appuser book);
  // Future<void> update(Appuser book);
  Future<void> delete(int id);
}
