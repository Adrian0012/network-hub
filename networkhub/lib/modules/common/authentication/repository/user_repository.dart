import 'dart:async';

import 'package:networkhub/modules/common/authentication/models/user.dart';
import 'package:networkhub/modules/common/authentication/provider/auth_provider.dart';
import 'package:rxdart/subjects.dart';

class UserRepository {
  final _authProvider = AuthProvider();
  BehaviorSubject<User> userStreamController = BehaviorSubject<User>();

  Future<User> getUser() async {
    final User user = await _authProvider.getUser();
    userStreamController.add(user);
    return user;
  }

  void updateUser(User user) {
    userStreamController.add(user);
  }
}
