import 'package:dio/dio.dart';
import 'package:networkhub/modules/user/models/user.dart';
import 'package:networkhub/modules/user/repositories/app_user.dart';
import 'package:networkhub/modules/user/repositories/app_user_interface.dart';

class UserController {
  final IAppuserRepository _userRepo = AppuserRepository(Dio());

  Future<List<Appuser>> getAllUsers() {
    return _userRepo.getAll();
  }
}
