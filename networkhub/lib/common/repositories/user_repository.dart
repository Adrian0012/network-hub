import 'dart:async';

import 'package:networkhub/common/models/user.dart';

class UserRepository {
  AppUser? _user;

  Future<AppUser?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = const AppUser(),
    );
  }
}
