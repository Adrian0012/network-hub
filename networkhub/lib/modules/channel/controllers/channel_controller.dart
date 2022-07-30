import 'package:dio/dio.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/repositories/channel.dart';
import 'package:networkhub/modules/channel/repositories/channel_interface.dart';

class ChannelController {
  final IChannelRepository _channelRepo = ChannelRepository(Dio());

  Future<List<Channel>> getAllChannels() {
    return _channelRepo.getAll();
  }
}
