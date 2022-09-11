import 'dart:convert';

import 'package:networkhub/env_config.dart';
import 'package:networkhub/modules/channel/repositories/channel_repository.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherMixin {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  final ChannelRepository _channelRepository = ChannelRepository();

  void log(String text) {
    print("LOG: $text");
  }

  // TODO
  // split the init and subscribe?
  // call unsubscribe when logging out
  void establishConnection() async {
    try {
      await pusher.init(
        apiKey: EnvironmentConfig.pusherApiKey,
        cluster: EnvironmentConfig.pusherCluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onPusherError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onPusherEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // authEndpoint: "<Your Authendpoint Url>",
        // onAuthorizer: onAuthorizer
      );
      await pusher.subscribe(channelName: EnvironmentConfig.pusherChannelName);
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onPusherError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onPusherEvent(PusherEvent event) {
    // log("onEvent: $event");
    _channelRepository.messageReceived(message: json.decode(event.data));
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }
}
