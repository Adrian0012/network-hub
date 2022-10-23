import 'dart:convert';

import 'package:networkhub/env_config.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:rxdart/rxdart.dart';

class PusherService {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  static PusherService? _instance;

  PusherService._() {
    _instance = this;
  }

  factory PusherService.instance() => _instance ?? PusherService._();

  BehaviorSubject<Map<String, dynamic>> messagesStreamController =
      BehaviorSubject<Map<String, dynamic>>();

  void initializePusher() async {
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
    await pusher.connect();
  }

  void onPusherEvent(PusherEvent event) {
    if (!messagesStreamController.isClosed) {
      messagesStreamController.add(json.decode(event.data));
    }
  }

  onPusherSubscribe(String? channelName) async {
    if (channelName != null) {
      await pusher.subscribe(channelName: channelName);
    } else {
      await pusher.subscribe(channelName: EnvironmentConfig.pusherChannelName);
    }
  }

  onPusherUnSubscribe(String? channelName) async {
    if (channelName != null) {
      await pusher.unsubscribe(channelName: channelName);
    } else {
      await pusher.unsubscribe(
          channelName: EnvironmentConfig.pusherChannelName);
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {}

  void onPusherError(String message, int? code, dynamic e) {}

  void onSubscriptionSucceeded(String channelName, dynamic data) {}

  void onSubscriptionError(String message, dynamic e) {}

  void onDecryptionFailure(String event, String reason) {}

  void onMemberAdded(String channelName, PusherMember member) {}

  void onMemberRemoved(String channelName, PusherMember member) {}
}
