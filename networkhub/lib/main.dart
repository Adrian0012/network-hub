import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:networkhub/services/pusher/pusher_service.dart';
// ignore: unused_import
import 'package:pusher_beams/pusher_beams.dart';
import 'app.dart';

Future<void> main() async {
  // this is a prerequisites for Pusher Beams
  // not sure if it has any impact on Pusher Channels or anything else
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  PusherService.instance().initializePusher();
  // await PusherBeams.instance.start(EnvironmentConfig.pusherBeamsInstanceId);
  // await PusherBeams.instance.addDeviceInterest('apples');
  runApp(
    const App(),
  );
}
