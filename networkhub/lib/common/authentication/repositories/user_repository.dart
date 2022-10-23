import 'dart:async';

import 'package:networkhub/common/authentication/models/user.dart';
import 'package:networkhub/common/providers/api_provider.dart';
import 'package:rxdart/subjects.dart';

class UserRepository {
  final _apiProvider = ApiProvider();
  BehaviorSubject<User> userStreamController = BehaviorSubject<User>();

  Future<User> getUser() async {
    final User user = await _apiProvider.getUser();
    userStreamController.add(user);
    return user;
  }

  void updateUser(User user) {
    userStreamController.add(user);
  }
}
