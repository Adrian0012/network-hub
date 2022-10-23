import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:networkhub/env_config.dart';
import 'package:networkhub/services/pusher/pusher_service.dart';
import 'app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  if (EnvironmentConfig.appENV == 'development') {
    PusherService.instance().initializePusher();
  }
  runApp(
    const App(),
  );
}
