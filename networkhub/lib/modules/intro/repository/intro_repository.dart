import 'dart:async';

import 'package:networkhub/modules/intro/provider/intro_provider.dart';

class IntroRepository {
  final _introProvider = IntroProvider();

  Future<bool> initializeSkynet() {
    return _introProvider.initializeSkynet();
  }
}

class NetworkError extends Error {}
