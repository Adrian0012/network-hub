import 'package:flutter/material.dart';
import 'package:networkhub/common/repositories/authentication_repository.dart';
import 'package:networkhub/common/repositories/user_repository.dart';

import 'app.dart';

void main() {
  runApp(
    App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
  );
}
