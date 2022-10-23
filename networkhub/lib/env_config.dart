import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static String appENV = 'development';

  static String sentryDSN = dotenv.env['SENTRY_DSN_KEY'] as String;

  static String pusherApiKey = dotenv.env['PUSHER_API_KEY'] as String;

  static String pusherCluster = dotenv.env['PUSHER_CLUSTER'] as String;

  static String pusherChannelName = dotenv.env['PUSHER_CHANNEL'] as String;
}
