import 'package:networkhub/modules/user/models/user.dart';

abstract class IAppuserRepository {
  Future<List<Appuser>> getAll();
}
