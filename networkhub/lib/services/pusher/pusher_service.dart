// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:networkhub/environment_config.dart';
import 'package:networkhub/services/pusher/models/pusher_response.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:rxdart/rxdart.dart';

class PusherService {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  static PusherService? _instance;

  PusherService._() {
    _instance = this;
  }

  factory PusherService.instance() => _instance ?? PusherService._();

  BehaviorSubject<PusherResponse> messagesStreamController =
      BehaviorSubject<PusherResponse>();
  //============================================================================
  // Pusher Channels
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
    Map<String, dynamic> response = jsonDecode(event.data);
    Map<String, dynamic> responseData = {
      "message": response['message'],
      "channelHash": response['channelHash'],
      "fromUser": jsonDecode(response['fromUser']),
    };
    PusherResponse data = PusherResponse.fromJson(responseData);
    messagesStreamController.add(data);
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
  // ===========================================================================

  // ===========================================================================
  // Pusher Beams
  getSecure() async {
    final BeamsAuthProvider provider = BeamsAuthProvider()
      ..authUrl = 'https://some-auth-url.com/secure'
      ..headers = {'Content-Type': 'application/json'}
      ..queryParams = {'page': '1'}
      ..credentials = 'omit';

    await PusherBeams.instance.setUserId(
        'user-id',
        provider,
        (error) => {
              if (error != null) {print(error)}

              // Success! Do something...
            });
  }

  initPusherBeams() async {
    // Let's see our current interests
    print(await PusherBeams.instance.getDeviceInterests());

    // This is not intented to use in web
    if (!kIsWeb) {
      await PusherBeams.instance
          .onInterestChanges((interests) => {print('Interests: $interests')});

      await PusherBeams.instance
          .onMessageReceivedInTheForeground(_onMessageReceivedInTheForeground);
    }
    await _checkForInitialMessage();
  }

  Future<void> _checkForInitialMessage() async {
    final initialMessage = await PusherBeams.instance.getInitialMessage();
    if (initialMessage != null) {
      print(initialMessage.toString());
    }
  }

  void _onMessageReceivedInTheForeground(Map<Object?, Object?> data) {
    print(data["title"].toString());
    print(data["body"].toString());
  }
  // ===========================================================================
}
