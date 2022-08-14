import 'package:networkhub/common/providers/api_provider.dart';
import 'package:networkhub/modules/channel/models/channel.dart';

class ChannelRepository {
  final _provider = ApiProvider();

  Future<List<Channel>> fetchChannelList() {
    return _provider.fetchChannelList();
  }
}

class NetworkError extends Error {}
