import 'package:networkhub/modules/user/models/user.dart';
import 'package:networkhub/utils/services/rest_api_service.dart';

import 'app_user_interface.dart';

class AppuserRepository implements IAppuserRepository {
  final VirtualDB _db;

  AppuserRepository(this._db);

  @override
  Future<List<Appuser>> getAll() async {
    var items = await _db.list();
    return items.map((item) => Appuser.fromJson(item)).toList();
  }

  @override
  Future<Appuser?> getOne(int id) async {
    var item = await _db.findOne(id);
    return item != null ? Appuser.fromJson(item) : null;
  }

  // @override
  // Future<void> insert(Appuser book) async {
  //   await _db.insert(Appuser.toJson());
  // }

  // @override
  // Future<void> update(Appuser book) async {
  //   await _db.update(Appuser);
  // }

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }
}
