import 'dart:async';

import 'package:networkhub/modules/channel/provider/channel_provider.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';

class ChannelRepository {
  final _channelProvider = ChannelProvider();

  Future<List<Channel>> fetchChannelList() {
    return _channelProvider.fetchChannelList();
  }

  Future<List<ChannelMessage>> fetchChannelMessages(String channelId) {
    return _channelProvider.fetchChannelMessages(channelId);
  }

  void sendMessage(ChannelMessage message) {
    _channelProvider.sendMessage(message);
  }
}

class NetworkError extends Error {}
