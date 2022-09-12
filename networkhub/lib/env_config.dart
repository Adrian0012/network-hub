class EnvironmentConfig {
  static const String appENV = 'dev';

  static const String sentryDSN = '';

  static const String pusherApiKey = String.fromEnvironment('PUSHER_API_KEY');

  static const String pusherCluster = 'eu';

  static const String pusherChannelName = 'my-channel';
}
