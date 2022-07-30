import 'package:networkhub/modules/channel/models/channel.dart';

abstract class IChannelRepository {
  Future<List<Channel>> getAll();
}
