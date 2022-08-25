import 'package:networkhub/common/providers/api_provider.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';

class ChannelRepository {
  final _provider = ApiProvider();

  Future<List<Channel>> fetchChannelList() {
    return _provider.fetchChannelList();
  }

  Future<List<ChannelMessage>> fetchChannelMessages(String channelId) {
    return _provider.fetchChannelMessages(channelId);
  }
}

class NetworkError extends Error {}
