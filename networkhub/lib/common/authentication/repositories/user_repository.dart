import 'dart:async';

import 'package:networkhub/common/authentication/models/user.dart';
import 'package:networkhub/common/providers/api_provider.dart';

class UserRepository {
  final _apiProvider = ApiProvider();

  Future<User> getUser() async {
    final User user = await _apiProvider.getUser();
    return user;
  }
}
